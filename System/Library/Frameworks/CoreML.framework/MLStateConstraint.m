@implementation MLStateConstraint

- (MLStateConstraint)initWithShape:(id)a3 dataType:(int64_t)a4 shapeConstraint:(id)a5 defaultOptionalValue:(id)a6
{
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  NSObject *v15;
  NSObject *v16;
  MLStateConstraint *v17;
  MLStateConstraint *v18;
  objc_super v20;
  uint8_t buf[16];

  v11 = a3;
  v12 = a5;
  v13 = a6;
  v14 = (_QWORD *)MEMORY[0x1E0C99778];
  if (v12)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19C486000, v15, OS_LOG_TYPE_ERROR, "MLState doesn't support shape constraint.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v14, CFSTR("MLState doesn't support shape constraint."));
  }
  if (v13)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19C486000, v16, OS_LOG_TYPE_ERROR, "MLState doesn't support default optional value.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v14, CFSTR("MLState doesn't support default optional value."));
  }
  v20.receiver = self;
  v20.super_class = (Class)MLStateConstraint;
  v17 = -[MLStateConstraint init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_bufferShape, a3);
    v18->_dataType = a4;
  }

  return v18;
}

- (BOOL)isAllowedShape:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  char v7;

  v5 = a3;
  -[MLStateConstraint bufferShape](self, "bufferShape");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToArray:", v5);

  return v7;
}

- (BOOL)isAllowedDataType:(int64_t)a3 error:(id *)a4
{
  int64_t dataType;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  dataType = self->_dataType;
  if (dataType != a3)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      +[MLMultiArrayUtils stringForDataType:](MLMultiArrayUtils, "stringForDataType:", self->_dataType);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLMultiArrayUtils stringForDataType:](MLMultiArrayUtils, "stringForDataType:", a3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = v16;
      v22 = 2112;
      v23 = v17;
      _os_log_error_impl(&dword_19C486000, v8, OS_LOG_TYPE_ERROR, "State array dataType should be %@ but is %@", buf, 0x16u);

    }
    if (a4)
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0CB2D50];
      v10 = (void *)MEMORY[0x1E0CB3940];
      +[MLMultiArrayUtils stringForDataType:](MLMultiArrayUtils, "stringForDataType:", self->_dataType);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[MLMultiArrayUtils stringForDataType:](MLMultiArrayUtils, "stringForDataType:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("State array dataType should be %@ but is %@"), v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 1, v14);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  return dataType == a3;
}

- (BOOL)isAllowedValue:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[7];
  uint8_t buf[8];
  uint8_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "isUndefined"))
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19C486000, v7, OS_LOG_TYPE_ERROR, "StateConstraint cannot check undefined values", buf, 2u);
    }

    if (a4)
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v31 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("StateConstraint cannot check undefined values"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 1, v10);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

LABEL_15:
      LOBYTE(a4) = 0;
    }
  }
  else if (objc_msgSend(v6, "type") == 8)
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v28 = 0;
    *(_QWORD *)buf = 0;
    v20 = buf;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__26108;
    v23 = __Block_byref_object_dispose__26109;
    v24 = 0;
    objc_msgSend(v6, "internalStateValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __42__MLStateConstraint_isAllowedValue_error___block_invoke;
    v18[3] = &unk_1E3D66F70;
    v18[4] = self;
    v18[5] = &v25;
    v18[6] = buf;
    objc_msgSend(v11, "internalGetMultiArrayWithHandler:", v18);

    v12 = *((unsigned __int8 *)v26 + 24);
    if (a4 && !*((_BYTE *)v26 + 24))
    {
      *a4 = objc_retainAutorelease(*((id *)v20 + 5));
      v12 = *((unsigned __int8 *)v26 + 24);
    }
    LOBYTE(a4) = v12 != 0;
    _Block_object_dispose(buf, 8);

    _Block_object_dispose(&v25, 8);
  }
  else
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19C486000, v13, OS_LOG_TYPE_ERROR, "StateConstraint only allows State Feature Values", buf, 2u);
    }

    if (a4)
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v29 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("StateConstraint only allows State Feature Values"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 1, v16);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_15;
    }
  }

  return (char)a4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MLStateConstraint *v4;
  void *v5;
  MLStateConstraint *v6;

  v4 = +[MLStateConstraint allocWithZone:](MLStateConstraint, "allocWithZone:", a3);
  -[MLStateConstraint bufferShape](self, "bufferShape");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MLStateConstraint initWithShape:dataType:shapeConstraint:defaultOptionalValue:](v4, "initWithShape:dataType:shapeConstraint:defaultOptionalValue:", v5, -[MLStateConstraint dataType](self, "dataType"), 0, 0);

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  +[MLMultiArrayUtils stringForDataType:](MLMultiArrayUtils, "stringForDataType:", self->_dataType);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MLStateConstraint bufferShape](self, "bufferShape");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(" × "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MLStateConstraint bufferShape](self, "bufferShape");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("shape"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[MLStateConstraint dataType](self, "dataType"), CFSTR("dataType"));
}

- (MLStateConstraint)initWithCoder:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  MLStateConstraint *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0C99E20];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v7, v13, v14);

  objc_msgSend(v5, "allowedClasses");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v8);

  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v6, CFSTR("shape"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("dataType"));

  v11 = -[MLStateConstraint initWithShape:dataType:shapeConstraint:defaultOptionalValue:](self, "initWithShape:dataType:shapeConstraint:defaultOptionalValue:", v9, v10, 0, 0);
  return v11;
}

- (NSArray)bufferShape
{
  return self->_bufferShape;
}

- (int64_t)dataType
{
  return self->_dataType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferShape, 0);
}

void __42__MLStateConstraint_isAllowedValue_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id obj;
  uint8_t buf[16];

  v3 = a2;
  if (!v3)
  {
    +[MLLogging coreChannel](MLLogging, "coreChannel");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19C486000, v4, OS_LOG_TYPE_ERROR, "Error while trying to get multiArray from state value.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Error while trying to get multiArray from state value."));
  }
  v7 = (void *)a1[4];
  objc_msgSend(v3, "shape");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v6 + 40);
  LODWORD(v7) = objc_msgSend(v7, "isAllowedShape:error:", v5, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if ((_DWORD)v7)
  {
    v7 = (void *)a1[4];
    v8 = objc_msgSend(v3, "dataType");
    v9 = *(_QWORD *)(a1[6] + 8);
    v10 = *(id *)(v9 + 40);
    LOBYTE(v7) = objc_msgSend(v7, "isAllowedDataType:error:", v8, &v10);
    objc_storeStrong((id *)(v9 + 40), v10);
  }
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = (_BYTE)v7;

}

+ (MLStateConstraint)constraintWithBufferShape:(id)a3 dataType:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithShape:dataType:shapeConstraint:defaultOptionalValue:", v6, a4, 0, 0);

  return (MLStateConstraint *)v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
