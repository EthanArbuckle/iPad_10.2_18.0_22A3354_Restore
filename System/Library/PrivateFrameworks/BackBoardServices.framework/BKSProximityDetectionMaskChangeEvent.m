@implementation BKSProximityDetectionMaskChangeEvent

- (unsigned)detectionMask
{
  return self->_detectionMask;
}

+ (id)build:(id)a3
{
  void (**v3)(id, id);
  id v4;
  void *v5;

  v3 = (void (**)(id, id))a3;
  v4 = -[BKSProximityDetectionMaskChangeEvent _init]([BKSMutableProximityEvent alloc]);
  v3[2](v3, v4);

  v5 = (void *)objc_msgSend(v4, "copy");
  return v5;
}

- (id)_init
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  objc_super v5;

  if (result)
  {
    v1 = result;
    v2 = objc_opt_class();
    if (v2 != objc_opt_class())
    {
      v3 = objc_opt_class();
      if (v3 != objc_opt_class())
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel__init, v1, CFSTR("BKSProximityDetectionMaskChangeEvent.m"), 46, CFSTR("BKSProximityDetectionMaskChangeEvent cannot be subclassed"));

      }
    }
    v5.receiver = v1;
    v5.super_class = (Class)BKSProximityDetectionMaskChangeEvent;
    return objc_msgSendSuper2(&v5, sel_init);
  }
  return result;
}

- (void)_initWithCopyOf:(void *)a1
{
  _DWORD *v3;
  id v4;

  v3 = a2;
  if (a1)
  {
    v4 = -[BKSProximityDetectionMaskChangeEvent _init](a1);
    a1 = v4;
    if (v4)
    {
      *((_DWORD *)v4 + 2) = v3[2];
      *((_DWORD *)v4 + 3) = v3[3];
      *((_QWORD *)v4 + 2) = *((_QWORD *)v3 + 2);
    }
  }

  return a1;
}

- (BKSProximityDetectionMaskChangeEvent)init
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[BKSProximityDetectionMaskChangeEvent init]");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("BKSProximityDetectionMaskChangeEvent.m"), 35, CFSTR("cannot directly allocate BKSProximityDetectionMaskChangeEvent"));

  return 0;
}

- (BKSProximityDetectionMaskChangeEvent)initWithCoder:(id)a3
{
  id v3;
  BKSProximityDetectionMaskChangeEvent *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKSProximityDetectionMaskChangeEvent;
  v3 = a3;
  v4 = -[BKSProximityDetectionMaskChangeEvent init](&v7, sel_init);
  v4->_detectionMask = objc_msgSend(v3, "decodeInt32ForKey:", CFSTR("detectionMask"), v7.receiver, v7.super_class);
  v4->_mode = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("mode"));
  v5 = objc_msgSend(v3, "decodeInt64ForKey:", CFSTR("timestamp"));

  v4->_timestamp = v5;
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t detectionMask;
  id v5;

  detectionMask = self->_detectionMask;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", detectionMask, CFSTR("detectionMask"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_mode, CFSTR("mode"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_timestamp, CFSTR("timestamp"));

}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_detectionMask);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hash");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", self->_mode);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hash");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hash");

  return BSHashPurifyNS();
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _DWORD *v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = v5[2] == self->_detectionMask && v5[3] == self->_mode && *((_QWORD *)v5 + 2) == self->_timestamp;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[BKSProximityDetectionMaskChangeEvent _initWithCopyOf:]([BKSMutableProximityEvent alloc], self);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;

  v7 = a3;
  v4 = (id)objc_msgSend(v7, "appendInteger:withName:", self->_detectionMask, CFSTR("detectionMask"));
  v5 = (id)objc_msgSend(v7, "appendInteger:withName:", self->_mode, CFSTR("mode"));
  v6 = (id)objc_msgSend(v7, "appendInt64:withName:", self->_timestamp, CFSTR("timestamp"));

}

- (int)mode
{
  return self->_mode;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

+ (id)new
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[BKSProximityDetectionMaskChangeEvent new]");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("BKSProximityDetectionMaskChangeEvent.m"), 40, CFSTR("cannot directly allocate BKSProximityDetectionMaskChangeEvent"));

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
