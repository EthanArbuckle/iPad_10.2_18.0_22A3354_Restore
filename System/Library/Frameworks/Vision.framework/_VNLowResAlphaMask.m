@implementation _VNLowResAlphaMask

- (_VNLowResAlphaMask)initWithSingleAlphaMask:(__CVBuffer *)a3
{
  _VNLowResAlphaMask *v4;
  uint64_t v5;
  NSArray *instanceLowResMaskArray;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)_VNLowResAlphaMask;
  v4 = -[_VNLowResAlphaMask init](&v8, sel_init);
  if (v4)
  {
    v9[0] = a3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v5 = objc_claimAutoreleasedReturnValue();
    instanceLowResMaskArray = v4->_instanceLowResMaskArray;
    v4->_instanceLowResMaskArray = (NSArray *)v5;

    v4->_isSingleMask = 1;
  }
  return v4;
}

- (_VNLowResAlphaMask)initWithAlphaMaskArray:(id)a3
{
  id v4;
  _VNLowResAlphaMask *v5;
  uint64_t v6;
  NSArray *instanceLowResMaskArray;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_VNLowResAlphaMask;
  v5 = -[_VNLowResAlphaMask init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    instanceLowResMaskArray = v5->_instanceLowResMaskArray;
    v5->_instanceLowResMaskArray = (NSArray *)v6;

    v5->_isSingleMask = 0;
  }

  return v5;
}

- (__CVBuffer)_alphaMaskAtIndex:(unint64_t)a3
{
  NSArray *instanceLowResMaskArray;
  void *v6;

  instanceLowResMaskArray = self->_instanceLowResMaskArray;
  if (instanceLowResMaskArray && -[NSArray count](instanceLowResMaskArray, "count") > a3)
  {
    -[NSArray objectAtIndexedSubscript:](self->_instanceLowResMaskArray, "objectAtIndexedSubscript:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[VNError VNAssert:log:](VNError, "VNAssert:log:", 0, CFSTR("Internal object should not be nil"));
    return 0;
  }
  return (__CVBuffer *)v6;
}

- (_VNLowResAlphaMask)initWithCoder:(id)a3
{
  id v4;
  _VNLowResAlphaMask *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *instanceLowResMaskArray;
  _VNLowResAlphaMask *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_VNLowResAlphaMask;
  v5 = -[_VNLowResAlphaMask init](&v15, sel_init);
  if (!v5)
    goto LABEL_7;
  v5->_isSingleMask = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSingleMask"));
  v6 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("ILRMASize"));
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v6);
  if (!v6)
  {
LABEL_6:
    v11 = objc_msgSend(v7, "copy");
    instanceLowResMaskArray = v5->_instanceLowResMaskArray;
    v5->_instanceLowResMaskArray = (NSArray *)v11;

LABEL_7:
    v13 = v5;
    goto LABEL_8;
  }
  v8 = 0;
  while (1)
  {
    objc_msgSend(CFSTR("ILRMAE"), "stringByAppendingFormat:", CFSTR("%d"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v4, "vn_decodePixelBufferForKey:", v9);
    if (!v10)
      break;
    objc_msgSend(v7, "addObject:", v10);

    if (v6 == ++v8)
      goto LABEL_6;
  }

  v13 = 0;
LABEL_8:

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSUInteger v4;
  uint64_t i;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if (self)
    v4 = -[NSArray count](self->_instanceLowResMaskArray, "count");
  else
    v4 = 0;
  objc_msgSend(v8, "encodeBool:forKey:", self->_isSingleMask, CFSTR("isSingleMask"));
  objc_msgSend(v8, "encodeInt64:forKey:", v4, CFSTR("ILRMASize"));
  if (v4)
  {
    for (i = 0; i != v4; ++i)
    {
      objc_msgSend(CFSTR("ILRMAE"), "stringByAppendingFormat:", CFSTR("%d"), i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_instanceLowResMaskArray, "objectAtIndexedSubscript:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "vn_encodePixelBuffer:forKey:", v7, v6);
    }
  }

}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t i;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_VNLowResAlphaMask;
  v3 = -[_VNLowResAlphaMask hash](&v11, sel_hash);
  v4 = 43690;
  if (!self->_isSingleMask)
    v4 = 21845;
  v5 = v4 ^ __ROR8__(v3, 51);
  v6 = -[NSArray count](self->_instanceLowResMaskArray, "count");
  if (v6)
  {
    v7 = v6;
    for (i = 0; i != v7; ++i)
    {
      -[NSArray objectAtIndexedSubscript:](self->_instanceLowResMaskArray, "objectAtIndexedSubscript:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = +[VNCVPixelBufferConversionHelpers computeHashForCVPixelBuffer:](VNCVPixelBufferConversionHelpers, "computeHashForCVPixelBuffer:", v9) ^ __ROR8__(v5, 51);
    }
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _VNLowResAlphaMask *v4;
  _VNLowResAlphaMask *v5;
  NSUInteger v6;
  BOOL v7;
  NSUInteger i;
  void *v9;
  void *v10;

  v4 = (_VNLowResAlphaMask *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (self->_isSingleMask == v5->_isSingleMask
        && (v6 = -[NSArray count](self->_instanceLowResMaskArray, "count"),
            v6 == -[NSArray count](v5->_instanceLowResMaskArray, "count")))
      {
        if (v6)
        {
          v7 = 0;
          for (i = 0; i != v6; v7 = i >= v6)
          {
            -[NSArray objectAtIndexedSubscript:](self->_instanceLowResMaskArray, "objectAtIndexedSubscript:", i);
            v9 = (void *)objc_claimAutoreleasedReturnValue();

            -[NSArray objectAtIndexedSubscript:](v5->_instanceLowResMaskArray, "objectAtIndexedSubscript:", i);
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            if (!+[VNCVPixelBufferConversionHelpers isCVPixelBuffer:equalToCVPixelBuffer:](VNCVPixelBufferConversionHelpers, "isCVPixelBuffer:equalToCVPixelBuffer:", v9, v10))break;
            ++i;
          }
        }
        else
        {
          v7 = 1;
        }
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;

  if (!self->_isSingleMask)
    return -[_VNLowResAlphaMask initWithAlphaMaskArray:]([_VNLowResAlphaMask alloc], "initWithAlphaMaskArray:", self->_instanceLowResMaskArray);
  -[NSArray objectAtIndexedSubscript:](self->_instanceLowResMaskArray, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return -[_VNLowResAlphaMask initWithSingleAlphaMask:]([_VNLowResAlphaMask alloc], "initWithSingleAlphaMask:", v3);
}

- (BOOL)isSingleMask
{
  return self->_isSingleMask;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceLowResMaskArray, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
