@implementation _BKSCATransform3DContainer

- (_BKSCATransform3DContainer)init
{
  _BKSCATransform3DContainer *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_BKSCATransform3DContainer;
  result = -[_BKSCATransform3DContainer init](&v3, sel_init);
  if (result)
  {
    result->_transform.m11 = 1.0;
    *(_OWORD *)&result->_transform.m12 = 0u;
    *(_OWORD *)&result->_transform.m14 = 0u;
    result->_transform.m22 = 1.0;
    *(_OWORD *)&result->_transform.m23 = 0u;
    *(_OWORD *)&result->_transform.m31 = 0u;
    result->_transform.m33 = 1.0;
    *(_OWORD *)&result->_transform.m34 = 0u;
    *(_OWORD *)&result->_transform.m42 = 0u;
    result->_transform.m44 = 1.0;
  }
  return result;
}

- (_BKSCATransform3DContainer)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _BKSCATransform3DContainer *v6;
  NSObject *v7;
  NSObject *v8;
  id v10;
  uint8_t buf[4];
  NSObject *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("self"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    BKLogEventDelivery();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18A0F0000, v7, OS_LOG_TYPE_ERROR, "transform container data decode failure", buf, 2u);
    }
    goto LABEL_8;
  }
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0D01838], "decodeObjectOfClass:fromData:error:", objc_opt_class(), v5, &v10);
  v6 = (_BKSCATransform3DContainer *)objc_claimAutoreleasedReturnValue();
  v7 = v10;
  if (!v6)
  {
    BKLogEventDelivery();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v7;
      _os_log_error_impl(&dword_18A0F0000, v8, OS_LOG_TYPE_ERROR, "transform container protobuf decode failure: %{public}@", buf, 0xCu);
    }

LABEL_8:
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  _BKSCATransform3DContainer *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0D01838], "encodeObject:error:", self, &v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("transform container encode error: %@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v14 = v9;
      v15 = 2114;
      v16 = v11;
      v17 = 2048;
      v18 = self;
      v19 = 2114;
      v20 = CFSTR("BKSTouchEventService.m");
      v21 = 1024;
      v22 = 89;
      v23 = 2114;
      v24 = v8;
      _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

    }
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x18A1489E8);
  }
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("self"));

}

- (CATransform3D)transform
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v3 = *(_OWORD *)&self->m34;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self->m32;
  *(_OWORD *)&retstr->m33 = v3;
  v4 = *(_OWORD *)&self->m44;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self->m42;
  *(_OWORD *)&retstr->m43 = v4;
  v5 = *(_OWORD *)&self->m14;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self->m12;
  *(_OWORD *)&retstr->m13 = v5;
  v6 = *(_OWORD *)&self->m24;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self->m22;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (void)setTransform:(CATransform3D *)a3
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v3 = *(_OWORD *)&a3->m11;
  v4 = *(_OWORD *)&a3->m13;
  v5 = *(_OWORD *)&a3->m21;
  *(_OWORD *)&self->_transform.m23 = *(_OWORD *)&a3->m23;
  *(_OWORD *)&self->_transform.m21 = v5;
  *(_OWORD *)&self->_transform.m13 = v4;
  *(_OWORD *)&self->_transform.m11 = v3;
  v6 = *(_OWORD *)&a3->m31;
  v7 = *(_OWORD *)&a3->m33;
  v8 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&self->_transform.m43 = *(_OWORD *)&a3->m43;
  *(_OWORD *)&self->_transform.m41 = v8;
  *(_OWORD *)&self->_transform.m33 = v7;
  *(_OWORD *)&self->_transform.m31 = v6;
}

+ (id)protobufSchema
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44___BKSCATransform3DContainer_protobufSchema__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (protobufSchema_onceToken_10360 != -1)
    dispatch_once(&protobufSchema_onceToken_10360, block);
  return (id)protobufSchema_schema_10361;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
