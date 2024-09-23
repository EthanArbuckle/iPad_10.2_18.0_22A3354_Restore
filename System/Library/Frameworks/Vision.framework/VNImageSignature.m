@implementation VNImageSignature

- (VNImageSignature)initWithImageBuffer:(id)a3 regionOfInterest:(CGRect)a4 error:(id *)a5
{
  unint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  VNImageSignature *v15;
  VNImageSignature *v16;
  id v17;
  id v18;
  VNImageSignature *v19;
  VNImageSignature *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  __CVBuffer *v25;
  __CVBuffer *v26;
  int8x16_t *BaseAddressOfPlane;
  size_t WidthOfPlane;
  size_t HeightOfPlane;
  size_t BytesPerRowOfPlane;
  uint64_t SignatureBuffersForImageDimension;
  float *piRow;
  float *piCol;
  BOOL v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  char v38;
  char v39;
  uint64_t v40;
  char v41;
  id v42;
  VNImageSignature *v43;
  float *sumSqTable;
  float *sumTable;
  objc_super v47;
  int32x4_t block;
  void *v49;
  void *v50;
  unint64_t *v51;
  CGRect v52;
  CGRect v53;

  v5 = MEMORY[0x1E0C80A78](self).n128_u64[0];
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = *(double *)&v5;
  v16 = v15;
  STACK[0x7E38] = *MEMORY[0x1E0C80C00];
  v18 = v17;
  if (v18)
  {
    v47.receiver = v16;
    v47.super_class = (Class)VNImageSignature;
    v19 = -[VNImageSignature init](&v47, sel_init);
    v20 = v19;
    if (v19)
    {
      v19->_signature._memoryContainer = 0;
      v21 = objc_msgSend(v18, "width");
      v22 = objc_msgSend(v18, "height");
      v23 = v21 & 0xFFFFFFFFFFFFFFFELL;
      v24 = 2;
      if ((v21 & 0xFFFFFFFFFFFFFFFELL) == 0)
        v23 = 2;
      if ((v22 & 0xFFFFFFFFFFFFFFFELL) != 0)
        v24 = v22 & 0xFFFFFFFFFFFFFFFELL;
      v52.origin.x = v14 * (double)v23;
      v52.size.width = v11 * (double)v23;
      v52.origin.y = v13 * (double)v24;
      v52.size.height = v9 * (double)v24;
      v53 = CGRectIntegral(v52);
      v25 = (__CVBuffer *)objc_msgSend(v18, "croppedBufferWithWidth:height:format:cropRect:options:error:", (unint64_t)v53.size.width, (unint64_t)v53.size.height, 875704422, 0, v7, v53.origin.x, v53.origin.y);
      v26 = v25;
      if (!v25)
        goto LABEL_44;
      CVPixelBufferLockBaseAddress(v25, 1uLL);
      BaseAddressOfPlane = (int8x16_t *)CVPixelBufferGetBaseAddressOfPlane(v26, 0);
      WidthOfPlane = CVPixelBufferGetWidthOfPlane(v26, 0);
      HeightOfPlane = CVPixelBufferGetHeightOfPlane(v26, 0);
      BytesPerRowOfPlane = CVPixelBufferGetBytesPerRowOfPlane(v26, 0);
      SignatureBuffersForImageDimension = FastRegistration_allocateSignatureBuffersForImageDimension((uint64_t)&v20->_signature, WidthOfPlane, HeightOfPlane);
      if (SignatureBuffersForImageDimension != 4736)
        goto LABEL_40;
      piRow = v20->_signature.piRow;
      piCol = v20->_signature.piCol;
      if (HeightOfPlane & 1 | WidthOfPlane & 0x1F)
        v34 = 0;
      else
        v34 = (BytesPerRowOfPlane & 0x1F | BaseAddressOfPlane & 0xF) == 0;
      if (v34)
      {
        if (!PixelSumASM(BaseAddressOfPlane, WidthOfPlane, HeightOfPlane, BytesPerRowOfPlane, (int32x4_t *)&STACK[0x3F20], &block))
        {
          vDSP_vflt32((const int *)&STACK[0x3F20], 1, piRow, 1, (int)HeightOfPlane);
          vDSP_vflt32(block.i32, 1, piCol, 1, (int)WidthOfPlane);
          v37 = 4736;
          goto LABEL_31;
        }
        v37 = 4732;
      }
      else
      {
        STACK[0x3F20] = (unint64_t)BaseAddressOfPlane;
        LODWORD(STACK[0x3F28]) = WidthOfPlane;
        LODWORD(STACK[0x3F2C]) = (int)HeightOfPlane >> 1;
        STACK[0x3F30] = BytesPerRowOfPlane;
        LODWORD(STACK[0x3F38]) = 1;
        STACK[0x3F40] = (unint64_t)piRow;
        STACK[0x3F50] = (unint64_t)BaseAddressOfPlane->u64
                      + BytesPerRowOfPlane * ((uint64_t)(int)HeightOfPlane >> 1);
        LODWORD(STACK[0x3F58]) = WidthOfPlane;
        LODWORD(STACK[0x3F5C]) = (int)HeightOfPlane >> 1;
        STACK[0x3F60] = BytesPerRowOfPlane;
        LODWORD(STACK[0x3F68]) = 1;
        STACK[0x3F70] = (unint64_t)&piRow[(int)HeightOfPlane >> 1];
        block.i64[0] = MEMORY[0x1E0C809B0];
        block.i64[1] = 0x40000000;
        v49 = __Projections_projectionCols_planar8UtoF_block_invoke;
        v50 = &__block_descriptor_tmp_1_32793;
        v51 = &STACK[0x3F20];
        dispatch_apply(2uLL, 0, &block);
        v35 = 0;
        v36 = 0;
        do
        {
          v37 = *(&STACK[0x3F20] + 6 * v36 + 5);
          if (v37 != 4736)
            break;
          v38 = v35;
          v35 = 1;
          v36 = 1;
        }
        while ((v38 & 1) == 0);
        if ((v37 & 0x80) != 0)
        {
          STACK[0x3F20] = (unint64_t)BaseAddressOfPlane;
          LODWORD(STACK[0x3F28]) = (int)WidthOfPlane >> 1;
          LODWORD(STACK[0x3F2C]) = HeightOfPlane;
          STACK[0x3F30] = BytesPerRowOfPlane;
          LODWORD(STACK[0x3F38]) = 1;
          STACK[0x3F40] = (unint64_t)piCol;
          STACK[0x3F50] = (unint64_t)BaseAddressOfPlane->u64 + ((int)WidthOfPlane >> 1);
          LODWORD(STACK[0x3F58]) = (int)WidthOfPlane >> 1;
          LODWORD(STACK[0x3F5C]) = HeightOfPlane;
          STACK[0x3F60] = BytesPerRowOfPlane;
          LODWORD(STACK[0x3F68]) = 1;
          STACK[0x3F70] = (unint64_t)&piCol[(int)WidthOfPlane >> 1];
          block.i64[0] = MEMORY[0x1E0C809B0];
          block.i64[1] = 0x40000000;
          v49 = __Projections_projectionRows_planar8UtoF_block_invoke;
          v50 = &__block_descriptor_tmp_32791;
          v51 = &STACK[0x3F20];
          dispatch_apply(2uLL, 0, &block);
          v39 = 0;
          v40 = 0;
          do
          {
            v37 = *(&STACK[0x3F20] + 6 * v40 + 5);
            if (v37 != 4736)
              break;
            v41 = v39;
            v39 = 1;
            v40 = 1;
          }
          while ((v41 & 1) == 0);
        }
      }
      if ((v37 & 0x80) == 0)
      {
LABEL_37:
        if (v37 == 4736)
          goto LABEL_38;
        SignatureBuffersForImageDimension = 4710;
LABEL_40:
        CVPixelBufferUnlockBaseAddress(v26, 1uLL);
        CVPixelBufferRelease(v26);
        if (SignatureBuffersForImageDimension == 4736)
        {
          v16 = v20;
          v43 = v16;
          goto LABEL_46;
        }
        if (v7)
        {
          +[CVML_Error createNSErrorWithStatus:andMessage:](CVML_Error, "createNSErrorWithStatus:andMessage:", SignatureBuffersForImageDimension, CFSTR("Error while trying to allocate VNImageSignature object"));
          v43 = 0;
          *v7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_45:
          v16 = v20;
          goto LABEL_46;
        }
LABEL_44:
        v43 = 0;
        goto LABEL_45;
      }
LABEL_31:
      v20->_signature.nPiCol = WidthOfPlane;
      v20->_signature.nPiRow = HeightOfPlane;
      if (v20->_signature.piRowTable.sumSqTable)
      {
        if (v20->_signature.piRowTable.sumTable)
        {
          sumSqTable = v20->_signature.piColTable.sumSqTable;
          if (sumSqTable)
          {
            sumTable = v20->_signature.piColTable.sumTable;
            if (sumTable)
            {
              Projections_computeMeanStdTable(v20->_signature.piCol, WidthOfPlane, sumTable, sumSqTable);
              Projections_computeMeanStdTable(v20->_signature.piRow, v20->_signature.nPiRow, v20->_signature.piRowTable.sumTable, v20->_signature.piRowTable.sumSqTable);
LABEL_38:
              SignatureBuffersForImageDimension = 4736;
              goto LABEL_40;
            }
          }
        }
      }
      goto LABEL_37;
    }
    if (v7)
    {
      +[VNError errorForMemoryAllocationFailure](VNError, "errorForMemoryAllocationFailure");
      v42 = (id)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      goto LABEL_25;
    }
    v16 = 0;
LABEL_27:
    v43 = 0;
    goto LABEL_46;
  }
  if (!v7)
    goto LABEL_27;
  +[VNError errorWithCode:message:](VNError, "errorWithCode:message:", 14, CFSTR("nil buffer passed into initWithImageBuffer"));
  v42 = (id)objc_claimAutoreleasedReturnValue();
LABEL_25:
  v43 = 0;
  *v7 = v42;
LABEL_46:

  return v43;
}

- (VNImageSignature)initWithCoder:(id)a3
{
  id v4;
  id v5;
  size_t v6;
  _QWORD *v7;
  id v8;
  size_t v9;
  VNImageSignature *v10;
  VNImageSignature *v11;
  float *piRow;
  id v13;
  float *piCol;
  id v15;
  void *v16;
  float *sumTable;
  id v18;
  void *v19;
  float *v20;
  id v21;
  void *v22;
  float *sumSqTable;
  void *v24;
  float *v25;
  VNImageSignature *v26;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rowProjections"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");
  v7 = (_QWORD *)MEMORY[0x1E0C99768];
  if ((v6 & 3) != 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("inconsistent row data"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("colProjections"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");
  if ((v9 & 3) != 0)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v7, CFSTR("inconsistent column data"));
  v10 = -[VNImageSignature init](self, "init");
  v11 = v10;
  if (v10
    && FastRegistration_allocateSignatureBuffersForImageDimension((uint64_t)&v10->_signature, v9 >> 2, v6 >> 2) == 4736)
  {
    piRow = v11->_signature.piRow;
    v13 = objc_retainAutorelease(v5);
    memcpy(piRow, (const void *)objc_msgSend(v13, "bytes"), v6);
    piCol = v11->_signature.piCol;
    v15 = objc_retainAutorelease(v8);
    memcpy(piCol, (const void *)objc_msgSend(v15, "bytes"), v9);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rowSum"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "length") != v6)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v7, CFSTR("inconsistent row data"));
    sumTable = v11->_signature.piRowTable.sumTable;
    v18 = objc_retainAutorelease(v16);
    memcpy(sumTable, (const void *)objc_msgSend(v18, "bytes"), v6);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("colSum"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v19, "length") != v9)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v7, CFSTR("inconsistent column data"));
    v20 = v11->_signature.piColTable.sumTable;
    v21 = objc_retainAutorelease(v19);
    memcpy(v20, (const void *)objc_msgSend(v21, "bytes"), v9);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rowSumSq"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v22, "length") != v6)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v7, CFSTR("inconsistent row data"));
    sumSqTable = v11->_signature.piRowTable.sumSqTable;
    v5 = objc_retainAutorelease(v22);
    memcpy(sumSqTable, (const void *)objc_msgSend(v5, "bytes"), v6);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("colSumSq"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v24, "length") != v9)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *v7, CFSTR("inconsistent column data"));
    v25 = v11->_signature.piColTable.sumSqTable;
    v8 = objc_retainAutorelease(v24);
    memcpy(v25, (const void *)objc_msgSend(v8, "bytes"), v9);
    v26 = v11;
  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  float *piRow;
  unint64_t nPiRow;
  id v7;
  void *v8;
  float *sumTable;
  unint64_t v10;
  id v11;
  void *v12;
  float *sumSqTable;
  unint64_t v14;
  id v15;
  void *v16;
  float *piCol;
  unint64_t nPiCol;
  id v19;
  void *v20;
  float *v21;
  unint64_t v22;
  id v23;
  void *v24;
  float *v25;
  unint64_t v26;
  void *v27;
  id v28;

  v4 = a3;
  piRow = self->_signature.piRow;
  nPiRow = self->_signature.nPiRow;
  v7 = v4;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", piRow, 4 * nPiRow, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v8, CFSTR("rowProjections"));

  v10 = self->_signature.nPiRow;
  sumTable = self->_signature.piRowTable.sumTable;
  v11 = v7;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", sumTable, 4 * v10, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v12, CFSTR("rowSum"));

  sumSqTable = self->_signature.piRowTable.sumSqTable;
  v14 = self->_signature.nPiRow;
  v15 = v11;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", sumSqTable, 4 * v14, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "encodeObject:forKey:", v16, CFSTR("rowSumSq"));

  piCol = self->_signature.piCol;
  nPiCol = self->_signature.nPiCol;
  v19 = v15;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", piCol, 4 * nPiCol, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "encodeObject:forKey:", v20, CFSTR("colProjections"));

  v22 = self->_signature.nPiCol;
  v21 = self->_signature.piColTable.sumTable;
  v23 = v19;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v21, 4 * v22, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "encodeObject:forKey:", v24, CFSTR("colSum"));

  v25 = self->_signature.piColTable.sumSqTable;
  v26 = self->_signature.nPiCol;
  v28 = v23;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v25, 4 * v26, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "encodeObject:forKey:", v27, CFSTR("colSumSq"));

}

- (void)dealloc
{
  objc_super v3;

  free(self->_signature._memoryContainer);
  self->_signature._memoryContainer = 0;
  v3.receiver = self;
  v3.super_class = (Class)VNImageSignature;
  -[VNImageSignature dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  unint64_t nPiRow;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  nPiRow = self->_signature.nPiRow;
  v4 = 4 * nPiRow;
  v5 = VNHashMemory((uint64_t)self->_signature.piRow, 4 * nPiRow) ^ __ROR8__(self->_signature.nPiCol | (nPiRow << 15), 51);
  v6 = VNHashMemory((uint64_t)self->_signature.piRowTable.sumTable, v4) ^ __ROR8__(v5, 51);
  v7 = 4 * self->_signature.nPiCol;
  v8 = VNHashMemory((uint64_t)self->_signature.piCol, v7) ^ __ROR8__(v6, 51);
  return VNHashMemory((uint64_t)self->_signature.piColTable.sumSqTable, v7) ^ __ROR8__(v8, 51);
}

- (BOOL)isEqual:(id)a3
{
  VNImageSignature *v4;
  unint64_t nPiRow;
  unint64_t nPiCol;
  size_t v7;
  BOOL v8;

  v4 = (VNImageSignature *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    v8 = (objc_opt_isKindOfClass() & 1) != 0
      && (nPiRow = self->_signature.nPiRow, nPiRow == v4->_signature.nPiRow)
      && (nPiCol = self->_signature.nPiCol, nPiCol == v4->_signature.nPiCol)
      && (v7 = 4 * nPiRow, !memcmp(self->_signature.piRow, v4->_signature.piRow, 4 * nPiRow))
      && !memcmp(self->_signature.piRowTable.sumTable, v4->_signature.piRowTable.sumTable, v7)
      && !memcmp(self->_signature.piRowTable.sumSqTable, v4->_signature.piRowTable.sumSqTable, v7)
      && !memcmp(self->_signature.piCol, v4->_signature.piCol, 4 * nPiCol)
      && !memcmp(self->_signature.piColTable.sumTable, v4->_signature.piColTable.sumTable, 4 * nPiCol)
      && memcmp(self->_signature.piColTable.sumSqTable, v4->_signature.piColTable.sumSqTable, 4 * nPiCol) == 0;
  }

  return v8;
}

- (const)signature
{
  return &self->_signature;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
