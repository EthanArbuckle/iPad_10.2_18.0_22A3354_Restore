@implementation GCHIDDeviceInput

- (GCHIDDeviceInput)initWithIOHIDDevice:(__IOHIDDevice *)a3
{
  GCHIDDeviceInput *v4;
  __IOHIDDevice *v5;
  io_service_t Service;
  IOHIDQueueRef v7;
  uint64_t v8;
  NSMutableArray *changedElements;
  GCHIDDeviceInput *v10;
  NSObject *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)GCHIDDeviceInput;
  v4 = -[GCHIDDeviceInput init](&v13, sel_init);
  v5 = (__IOHIDDevice *)CFRetain(a3);
  Service = IOHIDDeviceGetService(v5);
  if (Service)
    IORegistryEntryGetRegistryEntryID(Service, &v4->_cachedDeviceRegistryEntryID);
  v7 = IOHIDQueueCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v5, 20, 0);
  v4->_queue = v7;
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc((Class)&off_1F03A71F0), "initWithCapacity:", 20);
    changedElements = v4->_changedElements;
    v4->_changedElements = (NSMutableArray *)v8;

    IOHIDQueueRegisterValueAvailableCallback(v4->_queue, (IOHIDCallback)__IOHIDQueueInputElementValueCallback, v4);
    -[GCHIDDeviceInput setInputElementMatching:](v4, "setInputElementMatching:", 0);
    v10 = v4;
  }
  else
  {
    _gc_log_hid_input();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[GCHIDDeviceInput initWithIOHIDDevice:].cold.1((uint64_t)v5, v11);

    v10 = 0;
  }

  return v10;
}

- (GCHIDDeviceInput)init
{
  -[GCHIDDeviceInput doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)dealloc
{
  __IOHIDQueue *queue;
  IOHIDDeviceRef Device;
  objc_super v5;

  queue = self->_queue;
  if (queue)
  {
    Device = IOHIDQueueGetDevice(queue);
    CFRelease(Device);
    CFRelease(self->_queue);
    self->_queue = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)GCHIDDeviceInput;
  -[GCHIDDeviceInput dealloc](&v5, sel_dealloc);
}

- (__IOHIDDevice)deviceRef
{
  return IOHIDQueueGetDevice(self->_queue);
}

- (void)setSuspended:(BOOL)a3
{
  _BOOL4 v3;
  __IOHIDQueue *queue;
  GCHIDDeviceInput *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_suspended != v3)
  {
    obj->_suspended = v3;
    if (obj->_activated)
    {
      queue = obj->_queue;
      if (v3)
        IOHIDQueueStop(queue);
      else
        IOHIDQueueStart(queue);
    }
  }
  objc_sync_exit(obj);

}

- (void)activate
{
  GCHIDDeviceInput *v2;
  NSObject *v3;
  __IOHIDQueue *queue;
  _BOOL4 suspended;
  _QWORD handler[5];
  os_activity_scope_state_s state;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_activated)
  {
    v3 = _os_activity_create(&dword_1DC79E000, "[HID Input] Activate", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v3, &state);
    queue = v2->_queue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __28__GCHIDDeviceInput_activate__block_invoke;
    handler[3] = &unk_1EA4D2DB8;
    handler[4] = v2;
    IOHIDQueueSetCancelHandler(queue, handler);
    suspended = v2->_suspended;
    if (v2->_suspended)
      -[GCHIDDeviceInput willChangeValueForKey:](v2, "willChangeValueForKey:", CFSTR("suspended"));
    *(_WORD *)&v2->_activated = 1;
    IOHIDQueueActivate(v2->_queue);
    if (suspended)
      -[GCHIDDeviceInput didChangeValueForKey:](v2, "didChangeValueForKey:", CFSTR("suspended"));
    os_activity_scope_leave(&state);

  }
  objc_sync_exit(v2);

}

void __28__GCHIDDeviceInput_activate__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  os_activity_scope_state_s v6;

  v2 = _os_activity_create(&dword_1DC79E000, "[HID Input] Cancelled", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v2, &v6);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = 0;

  }
  os_activity_scope_leave(&v6);

}

- (void)cancel
{
  IOHIDQueueCancel(self->_queue);
}

- (void)setDispatchQueue:(id)a3
{
  IOHIDQueueSetDispatchQueue(self->_queue, (dispatch_queue_t)a3);
}

- (id)batchInputElementHandler
{
  if (a1)
  {
    objc_getProperty(a1, sel_batchInputElementHandler, 24, 1);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)setBatchInputElementHandler:(id)a3
{
  id v5;

  v5 = _Block_copy(a3);
  objc_setProperty(self, a2, 24, v5, 1, 1);

}

- (void)setCancelHandler:(id)a3
{
  id v5;

  v5 = _Block_copy(a3);
  objc_setProperty(self, a2, 16, v5, 1, 1);

}

- (void)setInputElements:(id)a3
{
  id v4;
  NSObject *v5;
  __IOHIDDevice *Device;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  CFTypeID v12;
  void *v13;
  void *v14;
  uint64_t v15;
  IOHIDValueRef Value;
  void *v17;
  void *v18;
  void *v19;
  CFMutableSetRef Mutable;
  CFMutableSetRef v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  __IOHIDElement *v26;
  void *v27;
  _BOOL4 v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t j;
  __IOHIDElement *v34;
  void *v35;
  _BOOL4 v36;
  GCHIDInputElement *v37;
  void *v38;
  uint64_t v39;
  BOOL v40;
  const __CFArray *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t k;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  CFArrayRef v49;
  GCHIDDeviceInput *v50;
  id obj;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _gc_log_hid_input();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[GCHIDDeviceInput setInputElements:].cold.1((uint64_t)self, v4, v5);

  Device = IOHIDQueueGetDevice(self->_queue);
  v7 = (void *)objc_msgSend(objc_alloc((Class)&off_1F03A7460), "initWithCapacity:", objc_msgSend(v4, "count"));
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = v4;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v66;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v66 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = (void *)objc_msgSend(v11, "element");
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v12 = CFGetTypeID(v11);
            if (v12 != IOHIDElementGetTypeID())
            {
              unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCHIDDeviceInput.m"), 215, CFSTR("Invalid object: %@"), v11);

              goto LABEL_14;
            }
          }
        }
        if (IOHIDElementGetDevice((IOHIDElementRef)v11) == Device)
        {
          objc_msgSend(v7, "addObject:", v11);
        }
        else
        {
          unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCHIDDeviceInput.m"), 219, CFSTR("<HIDElement %@> is not an element of %@"), v11, Device);

        }
LABEL_14:
        ++v10;
      }
      while (v8 != v10);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
      v8 = v15;
    }
    while (v15);
  }

  v49 = IOHIDDeviceCopyMatchingElements(Device, (CFDictionaryRef)&unk_1EA4F1948, 0);
  if (!v49)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCHIDDeviceInput.m"), 230, CFSTR("Could not obtain the NULL elements from %@."), Device);

  }
  v50 = self;
  objc_sync_enter(v50);
  IOHIDQueueStop(self->_queue);
  while (1)
  {
    Value = IOHIDQueueCopyNextValue(self->_queue);
    if (!Value)
      break;
    CFRelease(Value);
  }
  -[GCHIDDeviceInput elements](v50, "elements");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");
  v19 = v18;
  if (v18)
    Mutable = v18;
  else
    Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B3B0]);
  v21 = Mutable;

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v22 = (void *)_IOHIDQueueCopyElements();
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v62 != v24)
          objc_enumerationMutation(v22);
        v26 = *(__IOHIDElement **)(*((_QWORD *)&v61 + 1) + 8 * i);
        objc_msgSend(v7, "member:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27 == 0;

        if (v28)
        {
          -[__CFSet member:](v21, "member:", v26);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v29 && IOHIDElementGetType(v26) != kIOHIDElementTypeInput_NULL)
          {
            unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, v50, v26);

          }
          -[__CFSet removeObject:](v21, "removeObject:", v26);
          IOHIDQueueRemoveElement(self->_queue, v26);

        }
      }
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
    }
    while (v23);
  }

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v30 = v7;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
  if (v31)
  {
    v32 = *(_QWORD *)v58;
    do
    {
      for (j = 0; j != v31; ++j)
      {
        if (*(_QWORD *)v58 != v32)
          objc_enumerationMutation(v30);
        v34 = *(__IOHIDElement **)(*((_QWORD *)&v57 + 1) + 8 * j);
        -[__CFSet member:](v21, "member:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v35 == 0;

        if (v36)
        {
          v37 = -[GCHIDInputElement initWithElement:]([GCHIDInputElement alloc], "initWithElement:", v34);
          -[__CFSet addObject:](v21, "addObject:", v37);
          IOHIDQueueAddElement(self->_queue, v34);

        }
      }
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
    }
    while (v31);
  }

  v38 = (void *)_IOHIDQueueCopyElements();
  v39 = objc_msgSend(v38, "count");
  v40 = v39 == -[__CFSet count](v21, "count");

  if (!v40)
  {
    unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)_IOHIDQueueCopyElements();
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, v50, objc_msgSend(v47, "count"), -[__CFSet count](v21, "count"));

  }
  -[GCHIDDeviceInput willChangeValueForKey:](v50, "willChangeValueForKey:", CFSTR("elements"));
  objc_setProperty(v50, a2, 56, v21, 1, 1);
  -[GCHIDDeviceInput didChangeValueForKey:](v50, "didChangeValueForKey:", CFSTR("elements"));
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v41 = v49;
  v42 = -[__CFArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v53, v69, 16);
  if (v42)
  {
    v43 = *(_QWORD *)v54;
    do
    {
      for (k = 0; k != v42; ++k)
      {
        if (*(_QWORD *)v54 != v43)
          objc_enumerationMutation(v41);
        IOHIDQueueAddElement(self->_queue, *(IOHIDElementRef *)(*((_QWORD *)&v53 + 1) + 8 * k));
      }
      v42 = -[__CFArray countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v53, v69, 16);
    }
    while (v42);
  }

  if (v50->_activated && !v50->_suspended)
    IOHIDQueueStart(self->_queue);

  objc_sync_exit(v50);
}

- (void)setInputElementMatching:(id)a3
{
  id v5;
  char isKindOfClass;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char **v14;
  uint64_t v15;
  const __CFDictionary *v16;
  __IOHIDDevice *Device;
  CFArrayRef v18;
  CFArrayRef v19;
  void *v20;
  uint64_t v21;
  __IOHIDDevice *v22;
  CFArrayRef v23;
  CFArrayRef v24;
  void *v25;
  SEL v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _QWORD v32[3];

  v32[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if (v5)
    {
      if ((isKindOfClass & 1) == 0)
      {
        unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCHIDDeviceInput.m"), 293, CFSTR("Unknown matching criteria: %@"), v5);

      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v5, "count"))
    {
      v32[0] = v5;
      +[NSArray arrayWithObjects:count:](&off_1F03A70A0, "arrayWithObjects:count:", v32, 1);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    goto LABEL_27;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v5, "count"))
    {
      v7 = v5;
LABEL_11:
      v8 = v7;
      v9 = (void *)objc_opt_new();
      if (v8)
      {
        v26 = a2;
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v10 = v8;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v28;
          v14 = &selRef_lastUpdateDate;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v28 != v13)
                objc_enumerationMutation(v10);
              v16 = *(const __CFDictionary **)(*((_QWORD *)&v27 + 1) + 8 * v15);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                Device = IOHIDQueueGetDevice(self->_queue);
                v18 = IOHIDDeviceCopyMatchingElements(Device, v16, 0);
                if (v18)
                {
                  v19 = v18;
                  objc_msgSend(v9, "addObjectsFromArray:", v18);
                  CFRelease(v19);
                }
              }
              else
              {
                objc_msgSend(v14[437], "currentHandler");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", v26, self, CFSTR("GCHIDDeviceInput.m"), 314, CFSTR("Invalid matching rule: %@"), v16);

                v14 = &selRef_lastUpdateDate;
              }
              ++v15;
            }
            while (v12 != v15);
            v21 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
            v12 = v21;
          }
          while (v21);
        }

LABEL_30:
        -[GCHIDDeviceInput setInputElements:](self, "setInputElements:", v9);
        goto LABEL_31;
      }
LABEL_28:
      v22 = IOHIDQueueGetDevice(self->_queue);
      v23 = IOHIDDeviceCopyMatchingElements(v22, 0, 0);
      if (v23)
      {
        v24 = v23;
        objc_msgSend(v9, "addObjectsFromArray:", v23);
        CFRelease(v24);
      }
      goto LABEL_30;
    }
LABEL_27:
    v9 = (void *)objc_opt_new();
    goto LABEL_28;
  }
  if (!v5)
    goto LABEL_27;
  unk_1F03A9A20(&off_1F03A9B88, "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GCHIDDeviceInput.m"), 306, CFSTR("Invalid matching criteria: %@"), v5);
LABEL_31:

}

- (BOOL)isSuspended
{
  return self->_suspended;
}

- (NSSet)elements
{
  return (NSSet *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_changedElements, 0);
  objc_storeStrong(&self->_inputHandler, 0);
  objc_storeStrong(&self->_cancelHandler, 0);
}

- (void)initWithIOHIDDevice:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DC79E000, a2, OS_LOG_TYPE_ERROR, "Failed to create IOHIDQueue for %@.", (uint8_t *)&v2, 0xCu);
}

- (void)setInputElements:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = 138412546;
  v5 = a1;
  v6 = 2048;
  v7 = objc_msgSend(a2, "count");
  _os_log_debug_impl(&dword_1DC79E000, a3, OS_LOG_TYPE_DEBUG, "%@: Track %zd elements.", (uint8_t *)&v4, 0x16u);
}

@end
