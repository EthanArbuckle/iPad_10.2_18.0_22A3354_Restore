@implementation VNDetectionprintTensor

- (VNDetectionprintTensor)initWithDescriptorData:(id)a3 elementType:(unint64_t)a4 elementCount:(unint64_t)a5 originatingRequestSpecifier:(id)a6
{
  VNDetectionprintTensor *v7;
  uint64_t v8;
  VisionCoreEspressoTensorShape *shape;
  objc_super v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)VNDetectionprintTensor;
  v7 = -[VNEspressoModelImageprint initWithDescriptorData:elementType:elementCount:originatingRequestSpecifier:](&v11, sel_initWithDescriptorData_elementType_elementCount_originatingRequestSpecifier_, a3, a4, a5, a6);
  if (v7)
  {
    v12[0] = a5;
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC6C50]), "initWithSizes:rank:", v12, 1);
    shape = v7->_shape;
    v7->_shape = (VisionCoreEspressoTensorShape *)v8;

  }
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VNDetectionprintTensor;
  -[VNEspressoModelImageprint encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_shape, CFSTR("shape"));

}

- (VNDetectionprintTensor)initWithCoder:(id)a3
{
  id v4;
  VNDetectionprintTensor *v5;
  uint64_t v6;
  VisionCoreEspressoTensorShape *shape;
  uint64_t v8;
  uint64_t v9;
  VisionCoreEspressoTensorShape *v10;
  VNDetectionprintTensor *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VNDetectionprintTensor;
  v5 = -[VNEspressoModelImageprint initWithCoder:](&v15, sel_initWithCoder_, v4);
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("shape")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shape"));
      v6 = objc_claimAutoreleasedReturnValue();
      shape = v5->_shape;
      v5->_shape = (VisionCoreEspressoTensorShape *)v6;

      if (!v5->_shape)
        goto LABEL_12;
    }
    else
    {
      v8 = -[VNEspressoModelImageprint elementCount](v5, "elementCount");
      if (v8 == 221952)
      {
        v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC6C50]), "initWithBatchNumber:channels:height:width:", 1, 768, 17, 17);
      }
      else
      {
        if (v8 != 352800)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unsupported %@"), v5);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          +[VNError errorForOperationFailedErrorWithLocalizedDescription:](VNError, "errorForOperationFailedErrorWithLocalizedDescription:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "failWithError:", v13);

LABEL_12:
          v11 = 0;
          goto LABEL_13;
        }
        v9 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC6C50]), "initWithBatchNumber:channels:height:width:", 1, 288, 35, 35);
      }
      v10 = v5->_shape;
      v5->_shape = (VisionCoreEspressoTensorShape *)v9;

    }
  }
  v11 = v5;
LABEL_13:

  return v11;
}

- (VisionCoreEspressoTensorShape)shape
{
  return self->_shape;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shape, 0);
}

+ (id)tensorFromCSUBuffer:(id)a3 originatingRequestSpecifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v8 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__17739;
  v28 = __Block_byref_object_dispose__17740;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__17739;
  v22 = __Block_byref_object_dispose__17740;
  v23 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __80__VNDetectionprintTensor_tensorFromCSUBuffer_originatingRequestSpecifier_error___block_invoke;
  v13[3] = &unk_1E4546130;
  v15 = &v24;
  v17 = a1;
  v9 = v8;
  v14 = v9;
  v16 = &v18;
  objc_msgSend(a3, "accessDataUsingBlock:", v13);
  v10 = (void *)v25[5];
  if (v10)
  {
    v11 = v10;
  }
  else if (a5)
  {
    *a5 = objc_retainAutorelease((id)v19[5]);
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v10;
}

+ (id)tensorFromEspressoBuffer:(id *)a3 originatingRequestSpecifier:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  __int128 v9;
  void *v10;
  id v11;
  id *v12;
  void *v13;
  uint64_t v15;
  __int128 v16;
  __int128 v17;

  v7 = a4;
  if (a3->var14 == 65568)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a3->var0, 4 * a3->var13);
    objc_msgSend((id)objc_opt_class(), "printWithDescriptorData:elementType:elementCount:originatingRequestSpecifier:error:", v8, 1, a3->var13, v7, a5);
    a5 = (id *)objc_claimAutoreleasedReturnValue();
    if (a5)
    {
      v15 = 0;
      v9 = *(_OWORD *)&a3->var6;
      v16 = *(_OWORD *)&a3->var4;
      v17 = v9;
      objc_msgSend(MEMORY[0x1E0DC6C50], "shapeForBlobDimensions:", &v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = a5[8];
      a5[8] = v10;

      v12 = a5;
    }

  }
  else if (a5)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unsupported element storage type of 0x%04X"), a3->var14);
    +[VNError errorForInvalidOperationWithLocalizedDescription:](VNError, "errorForInvalidOperationWithLocalizedDescription:", v13);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    a5 = 0;
  }

  return a5;
}

+ (id)defaultOriginatingRequestClassNameForRequestRevision:(unint64_t)a3
{
  return CFSTR("VNCreateDetectionprintRequest");
}

+ (id)currentVersion
{
  return CFSTR("1");
}

+ (unsigned)currentCodingVersion
{
  return 2;
}

+ (unint64_t)serializationMagicNumber
{
  return 1685349236;
}

+ (unint64_t)currentSerializationVersion
{
  return 3;
}

+ (BOOL)shouldIgnoreLagecyLabelsAndConfidenceForHeaderSerializationVersion:(unsigned int)a3
{
  return a3 == 1;
}

+ (BOOL)shouldAssumeOriginatingRequestClassForHeaderSerializationVersion:(unsigned int)a3
{
  return a3 < 3;
}

+ (unint64_t)confidenceTypeForOriginatingRequestSpecifier:(id)a3
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __80__VNDetectionprintTensor_tensorFromCSUBuffer_originatingRequestSpecifier_error___block_invoke(_QWORD *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  id obj;

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a2, a3);
  v10 = (void *)objc_opt_class();
  v11 = a3 >> 2;
  v12 = a1[4];
  v13 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v13 + 40);
  objc_msgSend(v10, "printWithDescriptorData:elementType:elementCount:originatingRequestSpecifier:error:", v9, 1, v11, v12, &obj);
  v14 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v13 + 40), obj);
  v15 = *(_QWORD *)(a1[5] + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

  if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6D00]), "initWithByteOffsets:rank:", a5, a4);
    v18 = *(_QWORD *)(a1[6] + 8);
    v26 = *(id *)(v18 + 40);
    objc_msgSend(v17, "shapeForPackedElementsOfType:error:", 65568, &v26);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v18 + 40), v26);
    if (v19)
    {
      v20 = objc_alloc(MEMORY[0x1E0DC6C50]);
      v21 = objc_retainAutorelease(v19);
      v22 = objc_msgSend(v20, "initWithSizes:rank:", objc_msgSend(v21, "sizes"), objc_msgSend(v21, "rank"));
      v23 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
      v24 = *(void **)(v23 + 64);
      *(_QWORD *)(v23 + 64) = v22;
    }
    else
    {
      v25 = *(_QWORD *)(a1[5] + 8);
      v24 = *(void **)(v25 + 40);
      *(_QWORD *)(v25 + 40) = 0;
    }

  }
}

- (id)VNEspressoModelImageprintMLMultiArrayWithConstraint:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[VNDetectionprintTensor shape](self, "shape");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "rank") == 4 && objc_msgSend(v7, "batchNumber") == 1)
  {
    objc_msgSend(v6, "shape");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count") != 3)
    {
      if (!a4)
        goto LABEL_17;
      v18 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v18, "initWithFormat:", CFSTR("MLMultiArrayConstraint has an unexpected shape of [ %@ ]"), v19);

      +[VNError errorForInvalidModelWithLocalizedDescription:](VNError, "errorForInvalidModelWithLocalizedDescription:", v20);
      v21 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
      *a4 = v21;

      a4 = 0;
      goto LABEL_17;
    }
    v9 = objc_retainAutorelease(v7);
    v10 = (_QWORD *)objc_msgSend(v9, "sizes");
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "integerValue") == v10[1])
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "integerValue") == v10[2])
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v13, "integerValue");
        v25 = v10[3];

        if (v26 == v25)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v10[3] * v10[2]);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v27[0] = v14;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v10[3]);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v27[1] = v15;
          v27[2] = &unk_1E459CAD8;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          -[VNEspressoModelImageprint _VNEspressoModelImageprintMLMultiArrayWithDataType:shape:strides:error:](self, "_VNEspressoModelImageprintMLMultiArrayWithDataType:shape:strides:error:", objc_msgSend(v6, "dataType"), v8, v16, a4);
          a4 = (id *)objc_claimAutoreleasedReturnValue();

LABEL_17:
          goto LABEL_18;
        }
        goto LABEL_14;
      }

    }
LABEL_14:
    if (!a4)
      goto LABEL_17;
    v22 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v22, "initWithFormat:", CFSTR("MLMultiArrayConstraint sizes of [ %@ ] does not align with tensor shape of %@"), v23, v9);

    +[VNError errorForInvalidModelWithLocalizedDescription:](VNError, "errorForInvalidModelWithLocalizedDescription:", v20);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if (a4)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ has an unsupported shape of %@"), self, v7);
    +[VNError errorForOperationFailedErrorWithLocalizedDescription:](VNError, "errorForOperationFailedErrorWithLocalizedDescription:", v17);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    a4 = 0;
  }
LABEL_18:

  return a4;
}

@end
