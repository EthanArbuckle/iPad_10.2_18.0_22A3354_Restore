@implementation BKHIDScrollEventProcessor

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  id v8;
  id v9;
  __IOHIDEvent *v10;
  void *v11;
  void *v12;
  int64_t v13;

  v8 = a4;
  v9 = a5;
  v10 = *a3;
  if (IOHIDEventGetType() == 6)
  {
    objc_msgSend(v9, "destinationsForEvent:fromSender:", v10, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKHIDScrollEventProcessor _dispatchEvent:sender:dispatcher:destinations:](self, "_dispatchEvent:sender:dispatcher:destinations:", v10, v8, v9, v11);

    objc_msgSend(v8, "displayUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _BKHIDNoteUserEventOccurredOnDisplay();

    v13 = 1;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)_dispatchEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5 destinations:(id)a6
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const void *Copy;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = a6;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14);
        Copy = (const void *)IOHIDEventCreateCopy();
        objc_msgSend(v8, "eventSource");
        BKSHIDEventSetSimpleDeliveryInfo();
        objc_msgSend(v9, "postEvent:toDestination:", Copy, v15);
        CFRelease(Copy);
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

}

@end
