@implementation AXDeviceSupportsPencilHover

void __AXDeviceSupportsPencilHover_block_invoke()
{
  uint64_t v0;
  __IOHIDEventSystemClient *v1;
  void *v2;
  const __CFArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  double v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  _QWORD v15[2];
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v0 = IOHIDEventSystemClientCreateWithType();
  if (v0)
  {
    v1 = (__IOHIDEventSystemClient *)v0;
    v15[0] = CFSTR("PrimaryUsagePage");
    v15[1] = CFSTR("PrimaryUsage");
    v16[0] = &unk_1E24F79A0;
    v16[1] = &unk_1E24F79B8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    IOHIDEventSystemClientSetMatching();
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v3 = IOHIDEventSystemClientCopyServices(v1);
    v4 = -[__CFArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          v8 = (void *)IOHIDServiceClientCopyProperty(*(IOHIDServiceClientRef *)(*((_QWORD *)&v10 + 1) + 8 * i), CFSTR("MaxHoverHeight"));
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v8, "doubleValue", (_QWORD)v10);
            AXDeviceSupportsPencilHover_isSupported = v9 > 0.0;

            goto LABEL_12;
          }

        }
        v5 = -[__CFArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_12:

    CFRelease(v1);
  }
}

@end
