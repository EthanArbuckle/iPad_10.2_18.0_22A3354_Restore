@implementation AXXPCUtilities

+ (id)dictionaryFromXPCMessage:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString **v9;
  uint64_t *v10;
  Class Class;
  void *v12;
  void *v13;
  CFTypeID v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a4)
  {
    *a4 = 0;
    if (!v5)
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v22 = *MEMORY[0x1E0CB2D50];
      v23 = CFSTR("XPC object was NULL");
      v8 = (void *)MEMORY[0x1E0C99D80];
      v9 = &v23;
      v10 = &v22;
LABEL_16:
      objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("AXCoreUtilitiesXPCError"), 0, v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
  }
  else if (!v5)
  {
LABEL_18:
    a4 = 0;
    goto LABEL_19;
  }
  Class = object_getClass(v5);
  if (Class == (Class)MEMORY[0x1E0C812F8])
  {
    v12 = (void *)_CFXPCCreateCFObjectFromXPCMessage();
    if (v12)
    {
      v13 = v12;
      v14 = CFGetTypeID(v12);
      if (v14 == CFDictionaryGetTypeID())
      {
        a4 = (id *)objc_msgSend(v13, "copy");
      }
      else if (a4)
      {
        v19 = (void *)MEMORY[0x1E0CB35C8];
        v30 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Converted XPC object is not a dictionary; instead it has the following type ID: %lu."),
          v14);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = v20;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("AXCoreUtilitiesXPCError"), 0, v21);
        *a4 = (id)objc_claimAutoreleasedReturnValue();

        a4 = 0;
      }
      CFRelease(v13);
    }
    else if (a4)
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v28 = *MEMORY[0x1E0CB2D50];
      v29 = CFSTR("Failed converting XPC object to a Foundation level dictionary");
      v8 = (void *)MEMORY[0x1E0C99D80];
      v9 = &v29;
      v10 = &v28;
      goto LABEL_16;
    }
  }
  else if (Class == (Class)MEMORY[0x1E0C81310])
  {
    if (a4)
    {
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v26 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unexpected error: %s."), xpc_dictionary_get_string(v6, (const char *)*MEMORY[0x1E0C81270]));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("AXCoreUtilitiesXPCError"), 0, v17);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_17:
      goto LABEL_18;
    }
  }
  else if (a4)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0CB2D50];
    v25 = CFSTR("Unexpected type for XPC object");
    v8 = (void *)MEMORY[0x1E0C99D80];
    v9 = &v25;
    v10 = &v24;
    goto LABEL_16;
  }
LABEL_19:

  return a4;
}

+ (id)copyXPCMessageFromDictionary:(id)a3 inReplyToXPCMessage:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString **v12;
  uint64_t *v13;
  xpc_object_t reply;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString **v20;
  uint64_t *v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  const __CFString *v29;
  uint64_t v30;
  const __CFString *v31;
  uint64_t v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (a5)
  {
    *a5 = 0;
    if (!v7)
    {
      v10 = (void *)MEMORY[0x1E0CB35C8];
      v32 = *MEMORY[0x1E0CB2D50];
      v33[0] = CFSTR("No XPC dictionary");
      v11 = (void *)MEMORY[0x1E0C99D80];
      v12 = (const __CFString **)v33;
      v13 = &v32;
LABEL_9:
      objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, 1);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("AXCoreUtilitiesXPCError"), 0, v16);
      v15 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:

      goto LABEL_26;
    }
  }
  else if (!v7)
  {
    v15 = 0;
    goto LABEL_26;
  }
  if (!v8)
  {
    v15 = 0;
    goto LABEL_12;
  }
  reply = xpc_dictionary_create_reply(v8);
  v15 = reply;
  if (a5 && !reply)
  {
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v30 = *MEMORY[0x1E0CB2D50];
    v31 = CFSTR("Failed to allocate new XPC dictionary");
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = &v31;
    v13 = &v30;
    goto LABEL_9;
  }
  if (reply)
  {
LABEL_12:
    v17 = (void *)_CFXPCCreateXPCMessageWithCFObject();
    v16 = v17;
    if (v17)
    {
      if (object_getClass(v17) == (Class)MEMORY[0x1E0C812F8])
      {
        if (v9)
        {
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = __73__AXXPCUtilities_copyXPCMessageFromDictionary_inReplyToXPCMessage_error___block_invoke;
          v24[3] = &unk_1E28C3D48;
          v15 = v15;
          v25 = v15;
          xpc_dictionary_apply(v16, v24);

        }
        else
        {
          v16 = v16;
          v15 = v16;
        }
        goto LABEL_25;
      }
      if (!a5)
      {
LABEL_20:
        if (v15)
        {

          v15 = 0;
        }
        goto LABEL_25;
      }
      v18 = (void *)MEMORY[0x1E0CB35C8];
      v28 = *MEMORY[0x1E0CB2D50];
      v29 = CFSTR("Unexpected type for XPC object after conversion from Foundation level dictionary");
      v19 = (void *)MEMORY[0x1E0C99D80];
      v20 = &v29;
      v21 = &v28;
    }
    else
    {
      if (!a5)
        goto LABEL_20;
      v18 = (void *)MEMORY[0x1E0CB35C8];
      v26 = *MEMORY[0x1E0CB2D50];
      v27 = CFSTR("Failed converting Foundation level dictionary to an XPC object");
      v19 = (void *)MEMORY[0x1E0C99D80];
      v20 = &v27;
      v21 = &v26;
    }
    objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("AXCoreUtilitiesXPCError"), 0, v22);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_20;
  }
LABEL_26:

  return v15;
}

uint64_t __73__AXXPCUtilities_copyXPCMessageFromDictionary_inReplyToXPCMessage_error___block_invoke(uint64_t a1, const char *a2, void *a3)
{
  xpc_dictionary_set_value(*(xpc_object_t *)(a1 + 32), a2, a3);
  return 1;
}

@end
