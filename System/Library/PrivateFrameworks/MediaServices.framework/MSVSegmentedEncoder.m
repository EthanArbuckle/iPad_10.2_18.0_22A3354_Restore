@implementation MSVSegmentedEncoder

- (MSVSegmentedEncoder)initWithCodingPackage:(id)a3
{
  return -[MSVSegmentedEncoder initWithCodingPackage:userInfo:](self, "initWithCodingPackage:userInfo:", a3, 0);
}

- (MSVSegmentedEncoder)initWithCodingPackage:(id)a3 userInfo:(id)a4
{
  id v7;
  id v8;
  MSVSegmentedEncoder *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSMutableDictionary *subcoders;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MSVSegmentedEncoder;
  v9 = -[MSVSegmentedEncoder init](&v16, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    v11 = (void *)v10;
    if (v10)
      v12 = (void *)v10;
    else
      v12 = (void *)MEMORY[0x1E0C9AA70];
    objc_storeStrong((id *)&v9->_userInfo, v12);

    objc_storeStrong((id *)&v9->_package, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    subcoders = v9->_subcoders;
    v9->_subcoders = (NSMutableDictionary *)v13;

  }
  return v9;
}

- (void)finishEncoding
{
  if (!-[MSVSegmentedEncoder hasFinished](self, "hasFinished"))
  {
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_subcoders, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_498);
    -[MSVSegmentedEncoder setHasFinished:](self, "setHasFinished:", 1);
  }
}

- (void)encodeRootObject:(id)a3
{
  id v5;
  MSVSegmentedCoding *rootObject;
  id v7;
  void *v8;

  v5 = a3;
  if (!objc_msgSend(v5, "conformsToProtocol:", &unk_1EE5B7940)
    || (objc_msgSend((id)objc_opt_class(), "supportsSecureCoding") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSVSegmentedEncoder.m"), 64, CFSTR("Root objects must support segmented and secure coding."));

  }
  -[MSVSegmentedCodingPackage setArchivedClass:](self->_package, "setArchivedClass:", objc_opt_class());
  rootObject = self->_rootObject;
  self->_rootObject = (MSVSegmentedCoding *)v5;
  v7 = v5;

  objc_msgSend(v7, "encodeWithCoder:", self);
  -[MSVSegmentedEncoder finishEncoding](self, "finishEncoding");
}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[MSVSegmentedEncoder _coderForKey:](self, "_coderForKey:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, v6);

}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[MSVSegmentedEncoder _coderForKey:](self, "_coderForKey:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeBool:forKey:", v4, v6);

}

- (void)encodeInt:(int)a3 forKey:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[MSVSegmentedEncoder _coderForKey:](self, "_coderForKey:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeInt:forKey:", v4, v6);

}

- (void)encodeInt32:(int)a3 forKey:(id)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[MSVSegmentedEncoder _coderForKey:](self, "_coderForKey:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeInt32:forKey:", v4, v6);

}

- (void)encodeInt64:(int64_t)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[MSVSegmentedEncoder _coderForKey:](self, "_coderForKey:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeInt64:forKey:", a3, v6);

}

- (void)encodeFloat:(float)a3 forKey:(id)a4
{
  id v6;
  double v7;
  id v8;

  v6 = a4;
  -[MSVSegmentedEncoder _coderForKey:](self, "_coderForKey:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v7 = a3;
  objc_msgSend(v8, "encodeFloat:forKey:", v6, v7);

}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[MSVSegmentedEncoder _coderForKey:](self, "_coderForKey:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeDouble:forKey:", v6, a3);

}

- (void)encodeBytes:(const char *)a3 length:(unint64_t)a4 forKey:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  -[MSVSegmentedEncoder _coderForKey:](self, "_coderForKey:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeBytes:length:forKey:", a3, a4, v8);

}

- (id)msv_userInfo
{
  if (self->_userInfo)
    return self->_userInfo;
  else
    return MEMORY[0x1E0C9AA70];
}

- (void)msv_setUserInfo:(id)a3
{
  id v4;
  NSDictionary *v5;
  NSDictionary *userInfo;
  NSMutableDictionary *subcoders;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (NSDictionary *)objc_msgSend(v4, "copy");
  userInfo = self->_userInfo;
  self->_userInfo = v5;

  subcoders = self->_subcoders;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39__MSVSegmentedEncoder_msv_setUserInfo___block_invoke;
  v9[3] = &unk_1E43E86E8;
  v10 = v4;
  v8 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](subcoders, "enumerateKeysAndObjectsUsingBlock:", v9);

}

- (id)_coderForKey:(id)a3
{
  void *v4;
  void *v5;

  -[MSVSegmentedCoding segmentForCodingKey:](self->_rootObject, "segmentForCodingKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_subcoders, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[MSVSegmentedCodingPackage encoderForSegment:version:](self->_package, "encoderForSegment:version:", v4, -[MSVSegmentedCoding versionForSegment:](self->_rootObject, "versionForSegment:", v4));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_subcoders, "setObject:forKeyedSubscript:", v5, v4);
      objc_msgSend(v5, "msv_setUserInfo:", self->_userInfo);
      objc_msgSend(v5, "beginEncodingPartialTopLevelObject:", self->_rootObject);
    }
  }

  return v5;
}

- (BOOL)hasFinished
{
  return self->_hasFinished;
}

- (void)setHasFinished:(BOOL)a3
{
  self->_hasFinished = a3;
}

- (MSVSegmentedCodingPackage)package
{
  return self->_package;
}

- (void)setPackage:(id)a3
{
  objc_storeStrong((id *)&self->_package, a3);
}

- (MSVSegmentedCoding)rootObject
{
  return self->_rootObject;
}

- (void)setRootObject:(id)a3
{
  objc_storeStrong((id *)&self->_rootObject, a3);
}

- (NSMutableDictionary)subcoders
{
  return self->_subcoders;
}

- (void)setSubcoders:(id)a3
{
  objc_storeStrong((id *)&self->_subcoders, a3);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_subcoders, 0);
  objc_storeStrong((id *)&self->_rootObject, 0);
  objc_storeStrong((id *)&self->_package, 0);
}

uint64_t __39__MSVSegmentedEncoder_msv_setUserInfo___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "msv_setUserInfo:", *(_QWORD *)(a1 + 32));
}

uint64_t __37__MSVSegmentedEncoder_finishEncoding__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "finishEncodingPartialTopLevelObject");
}

@end
