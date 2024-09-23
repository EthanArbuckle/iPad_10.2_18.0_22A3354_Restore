@implementation AVFigRoutingContextCommandOutputDeviceConfigurationModification

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

- (AVFigRoutingContextCommandOutputDeviceConfigurationModification)init
{
  AVFigRoutingContextCommandOutputDeviceConfigurationModification *v2;
  AVFigRoutingContextCommandOutputDeviceConfigurationModification *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVFigRoutingContextCommandOutputDeviceConfigurationModification;
  v2 = -[AVFigRoutingContextCommandOutputDeviceConfigurationModification init](&v5, sel_init);
  if (v2)
  {
    v2->_payload = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
    v3 = v2;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)dealloc
{
  __CFDictionary *payload;
  objc_super v4;

  payload = self->_payload;
  if (payload)
    CFRelease(payload);
  v4.receiver = self;
  v4.super_class = (Class)AVFigRoutingContextCommandOutputDeviceConfigurationModification;
  -[AVFigRoutingContextCommandOutputDeviceConfigurationModification dealloc](&v4, sel_dealloc);
}

- (void)setDeviceName:(id)a3
{
  CFDictionarySetValue(self->_payload, (const void *)*MEMORY[0x1E0CA3920], a3);
}

- (void)setDevicePassword:(id)a3
{
  CFDictionarySetValue(self->_payload, (const void *)*MEMORY[0x1E0CA3938], a3);
}

- (void)startAutomaticallyAllowingConnectionsFromPeersInHomeGroupAndRejectOtherConnections:(BOOL)a3
{
  const void *UInt64;

  UInt64 = (const void *)FigCFNumberCreateUInt64();
  CFDictionarySetValue(self->_payload, (const void *)*MEMORY[0x1E0CA3928], (const void *)*MEMORY[0x1E0C9AE50]);
  CFDictionarySetValue(self->_payload, (const void *)*MEMORY[0x1E0CA3930], UInt64);
  if (UInt64)
    CFRelease(UInt64);
}

- (void)stopAutomaticallyAllowingConnectionsFromPeersInHomeGroup
{
  CFDictionarySetValue(self->_payload, (const void *)*MEMORY[0x1E0CA3928], (const void *)*MEMORY[0x1E0C9AE40]);
}

- (void)addPeerToHomeGroup:(id)a3
{
  const void *v5;
  const void *Value;
  __CFArray *v7;
  const __CFAllocator *v8;
  __CFDictionary *Mutable;
  const void *UInt64;

  v5 = (const void *)*MEMORY[0x1E0CA3908];
  Value = CFDictionaryGetValue(self->_payload, (const void *)*MEMORY[0x1E0CA3908]);
  if (Value)
    v7 = (__CFArray *)CFRetain(Value);
  else
    v7 = 0;
  v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  objc_msgSend(a3, "hasAdministratorPrivileges");
  UInt64 = (const void *)FigCFNumberCreateUInt64();
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CA38F0], (const void *)objc_msgSend(a3, "peerID"));
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CA3900], (const void *)objc_msgSend(a3, "publicKey"));
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CA38F8], UInt64);
  if (UInt64)
    CFRelease(UInt64);
  if (v7)
  {
    CFArrayAppendValue(v7, Mutable);
  }
  else
  {
    v7 = CFArrayCreateMutable(v8, 0, MEMORY[0x1E0C9B378]);
    CFDictionarySetValue(self->_payload, v5, v7);
    CFArrayAppendValue(v7, Mutable);
    if (!v7)
      goto LABEL_10;
  }
  CFRelease(v7);
LABEL_10:
  if (Mutable)
    CFRelease(Mutable);
}

- (void)removePeerWithIDFromHomeGroup:(id)a3
{
  const void *v4;
  const void *Value;
  void *Mutable;
  const __CFAllocator *v7;
  CFDictionaryRef v8;
  void *values;

  values = a3;
  v4 = (const void *)*MEMORY[0x1E0CA3910];
  Value = CFDictionaryGetValue(self->_payload, (const void *)*MEMORY[0x1E0CA3910]);
  if (!Value)
  {
    v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v8 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], MEMORY[0x1E0CA38F0], (const void **)&values, 1, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
LABEL_5:
    Mutable = CFArrayCreateMutable(v7, 0, MEMORY[0x1E0C9B378]);
    CFDictionarySetValue(self->_payload, v4, Mutable);
    CFArrayAppendValue((CFMutableArrayRef)Mutable, v8);
    if (!Mutable)
      goto LABEL_7;
    goto LABEL_6;
  }
  Mutable = (void *)CFRetain(Value);
  v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v8 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], MEMORY[0x1E0CA38F0], (const void **)&values, 1, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  if (!Mutable)
    goto LABEL_5;
  CFArrayAppendValue((CFMutableArrayRef)Mutable, v8);
LABEL_6:
  CFRelease(Mutable);
LABEL_7:
  if (v8)
    CFRelease(v8);
}

- (__CFDictionary)routingContextCommandPayload
{
  return self->_payload;
}

@end
