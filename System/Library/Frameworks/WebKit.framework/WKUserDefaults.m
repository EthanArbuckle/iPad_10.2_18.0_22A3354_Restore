@implementation WKUserDefaults

- (WKUserDefaults)initWithSuiteName:(id)a3
{
  WKUserDefaults *v4;
  void *m_ptr;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WKUserDefaults;
  v4 = -[WKUserDefaults initWithSuiteName:](&v7, sel_initWithSuiteName_);
  if (v4)
  {
    if (a3)
      CFRetain(a3);
    m_ptr = v4->m_suiteName.m_ptr;
    v4->m_suiteName.m_ptr = a3;
    if (m_ptr)
      CFRelease(m_ptr);
    objc_storeWeak(&v4->m_observer.m_weakReference, 0);
  }
  return v4;
}

- (void)_notifyObserversOfChangeFromValuesForKeys:(id)a3 toValuesForKeys:(id)a4
{
  WTF *v7;
  NSObject *global_queue;
  CFTypeRef v9;
  CFTypeRef v10;
  CFTypeRef v11;
  _QWORD v12[5];
  CFTypeRef v13;
  CFTypeRef v14;
  CFTypeRef cf;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)WKUserDefaults;
  v7 = (WTF *)-[WKUserDefaults _notifyObserversOfChangeFromValuesForKeys:toValuesForKeys:](&v16, sel__notifyObserversOfChangeFromValuesForKeys_toValuesForKeys_);
  if ((WTF::isMainRunLoop(v7) & 1) == 0)
  {
    -[WKUserDefaults findPreferenceChangesAndNotifyForKeys:toValuesForKeys:](self, "findPreferenceChangesAndNotifyForKeys:toValuesForKeys:", a3, a4);
    return;
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3321888768;
  v12[2] = __76__WKUserDefaults__notifyObserversOfChangeFromValuesForKeys_toValuesForKeys___block_invoke;
  v12[3] = &__block_descriptor_64_e8_32c89_ZTSKZ76__WKUserDefaults__notifyObserversOfChangeFromValuesForKeys_toValuesForKeys__E3__1_e5_v8__0l;
  if (self)
    CFRetain(self);
  if (a3)
    CFRetain(a3);
  if (a4)
    CFRetain(a4);
  v12[4] = self;
  v13 = self;
  if (self)
    CFRetain(self);
  v14 = a3;
  if (a3)
    CFRetain(a3);
  cf = a4;
  if (!a4)
  {
    dispatch_async(global_queue, v12);
    if (!a3)
      goto LABEL_15;
    goto LABEL_14;
  }
  CFRetain(a4);
  dispatch_async(global_queue, v12);
  CFRelease(a4);
  if (a3)
LABEL_14:
    CFRelease(a3);
LABEL_15:
  if (self)
    CFRelease(self);
  v9 = cf;
  cf = 0;
  if (v9)
    CFRelease(v9);
  v10 = v14;
  v14 = 0;
  if (v10)
    CFRelease(v10);
  v11 = v13;
  v13 = 0;
  if (v11)
    CFRelease(v11);
}

- (void)findPreferenceChangesAndNotifyForKeys:(id)a3 toValuesForKeys:(id)a4
{
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t i;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  id v18;
  const __CFString *v19;
  void *v20;
  char v21;
  char v22;
  void *v23;
  id v24;
  const __CFString *v25;
  const __CFString *userName;
  WeakObjCPtr<WKPreferenceObserver> *location;
  CFStringRef hostName;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  location = &self->m_observer;
  if (objc_loadWeak(&self->m_observer.m_weakReference))
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v32 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v32)
    {
      v31 = *(_QWORD *)v35;
      v6 = (const __CFString *)*MEMORY[0x1E0C9B228];
      userName = (const __CFString *)*MEMORY[0x1E0C9B240];
      hostName = (CFStringRef)*MEMORY[0x1E0C9B230];
      v7 = (const __CFString *)*MEMORY[0x1E0C9B260];
      v24 = a3;
      v25 = (const __CFString *)*MEMORY[0x1E0C9B228];
      v8 = (const __CFString *)*MEMORY[0x1E0C9B230];
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v35 != v31)
            objc_enumerationMutation(a3);
          v10 = *(const __CFString **)(*((_QWORD *)&v34 + 1) + 8 * i);
          v11 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", v10, v24, v25);
          v12 = objc_msgSend(a4, "objectForKeyedSubscript:", v10);
          if ((objc_msgSend(v11, "isEqual:", v12) & 1) == 0)
          {
            if (v12)
            {
              if (!objc_msgSend((id)objc_opt_class(), "supportsSecureCoding"))
                continue;
              v33 = 0;
              v13 = (void *)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, &v33);
              v14 = v13;
              if (v13)
                CFRetain(v13);
              v30 = objc_msgSend(v14, "base64EncodedStringWithOptions:", 0);
              v15 = hostName;
              if (v14)
                CFRelease(v14);
            }
            else
            {
              v30 = 0;
              v15 = hostName;
            }
            v16 = (void *)CFPreferencesCopyValue(v10, v6, userName, v15);
            v17 = (void *)CFPreferencesCopyValue(v10, v6, v7, v8);
            v18 = a4;
            v19 = v7;
            v20 = (void *)CFPreferencesCopyValue(v10, (CFStringRef)self->m_suiteName.m_ptr, v7, v8);
            if (v16 == (void *)v12
              || ((v21 = objc_msgSend(v16, "isEqual:", v12), v17 == (void *)v12) ? (v22 = 1) : (v22 = v21),
                  (v22 & 1) != 0 || objc_msgSend(v17, "isEqual:", v12)))
            {
              objc_msgSend(objc_loadWeak(&location->m_weakReference), "preferenceDidChange:key:encodedValue:", 0, v10, v30);
            }
            if (v20 == (void *)v12 || objc_msgSend(v20, "isEqual:", v12))
              objc_msgSend(objc_loadWeak(&location->m_weakReference), "preferenceDidChange:key:encodedValue:", self->m_suiteName.m_ptr, v10, v30);
            if (v20)
              CFRelease(v20);
            if (v17)
              CFRelease(v17);
            v23 = v18;
            a3 = v24;
            v6 = v25;
            v7 = v19;
            a4 = v23;
            if (v16)
              CFRelease(v16);
          }
        }
        v32 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v32);
    }
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 5) = 0;
  *((_QWORD *)self + 6) = 0;
  return self;
}

uint64_t __76__WKUserDefaults__notifyObserversOfChangeFromValuesForKeys_toValuesForKeys___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "findPreferenceChangesAndNotifyForKeys:toValuesForKeys:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void).cxx_destruct
{
  void *m_ptr;

  objc_destroyWeak(&self->m_observer.m_weakReference);
  m_ptr = self->m_suiteName.m_ptr;
  self->m_suiteName.m_ptr = 0;
  if (m_ptr)
    CFRelease(m_ptr);
}

@end
