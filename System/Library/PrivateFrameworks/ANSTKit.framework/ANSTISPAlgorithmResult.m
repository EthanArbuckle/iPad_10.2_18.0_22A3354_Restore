@implementation ANSTISPAlgorithmResult

+ (ANSTISPAlgorithmResult)new
{
  ANSTISPAlgorithmResult *result;

  result = (ANSTISPAlgorithmResult *)objc_msgSend_doesNotRecognizeSelector_(a1, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (ANSTISPAlgorithmResult)init
{
  ANSTISPAlgorithmResult *result;

  result = (ANSTISPAlgorithmResult *)objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2);
  __break(1u);
  return result;
}

- (id)_init
{
  return (id)((uint64_t (*)(ANSTISPAlgorithmResult *, char *))MEMORY[0x24BEDD108])(self, sel_init);
}

- (ANSTISPAlgorithmResult)initWithAcResult:(id *)a3 personMask:(__CVBuffer *)a4 salientPersonMask:(__CVBuffer *)a5 skinMask:(__CVBuffer *)a6 hairMask:(__CVBuffer *)a7 skyMask:(__CVBuffer *)a8 saliencyMask:(__CVBuffer *)a9
{
  ANSTISPAlgorithmResult *v15;
  $F9BD1179853AD15ECE2EC7F416DEEB2F *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)ANSTISPAlgorithmResult;
  v15 = -[ANSTResult _init](&v18, sel__init);
  if (v15)
  {
    if (a3)
    {
      v16 = ($F9BD1179853AD15ECE2EC7F416DEEB2F *)malloc_type_malloc(0x5228uLL, 0x10000400CAA2813uLL);
      v15->_acResult = v16;
      memcpy(v16, a3, sizeof($F9BD1179853AD15ECE2EC7F416DEEB2F));
    }
    v15->_personMask = CVPixelBufferRetain(a4);
    v15->_salientPersonMask = CVPixelBufferRetain(a5);
    v15->_skinMask = CVPixelBufferRetain(a6);
    v15->_hairMask = CVPixelBufferRetain(a7);
    v15->_skyMask = CVPixelBufferRetain(a8);
    v15->_saliencyMask = CVPixelBufferRetain(a9);
  }
  return v15;
}

- (void)dealloc
{
  $F9BD1179853AD15ECE2EC7F416DEEB2F *acResult;
  objc_super v4;

  acResult = self->_acResult;
  if (acResult)
    free(acResult);
  CVPixelBufferRelease(self->_personMask);
  CVPixelBufferRelease(self->_salientPersonMask);
  CVPixelBufferRelease(self->_skinMask);
  CVPixelBufferRelease(self->_hairMask);
  CVPixelBufferRelease(self->_skyMask);
  CVPixelBufferRelease(self->_saliencyMask);
  v4.receiver = self;
  v4.super_class = (Class)ANSTISPAlgorithmResult;
  -[ANSTISPAlgorithmResult dealloc](&v4, sel_dealloc);
}

- (int)smudgeConfidence
{
  return self->_acResult->var6;
}

- (id)detectedObjectsForCategory:(id)a3
{
  __CFString *v4;
  const char *v5;
  __CFString *v6;
  $F9BD1179853AD15ECE2EC7F416DEEB2F *acResult;
  const char *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  ANSTFace *v13;
  const char *v14;
  void *v15;
  const char *v16;
  const char *v17;
  $F9BD1179853AD15ECE2EC7F416DEEB2F *v18;
  unint64_t v19;
  uint64_t v20;
  ANSTHand *v21;
  const char *v22;
  void *v23;
  const char *v24;
  unint64_t v25;
  uint64_t v26;
  ANSTObject *v27;
  const char *v28;
  void *v29;
  const char *v30;
  void *v31;
  NSObject *v32;

  v4 = (__CFString *)a3;
  v6 = v4;
  acResult = self->_acResult;
  if (!acResult)
    goto LABEL_51;
  if (CFSTR("Face") == v4)
    goto LABEL_5;
  if (!objc_msgSend_isEqualToString_(v4, v5, (uint64_t)CFSTR("Face")))
  {
    if (CFSTR("Hand") == v6 || objc_msgSend_isEqualToString_(v6, v5, (uint64_t)CFSTR("Hand")))
    {
      v10 = (void *)objc_opt_new();
      v18 = self->_acResult;
      if (v18->var4)
      {
        v19 = 0;
        v20 = 16476;
        do
        {
          if ((*(_DWORD *)(&v18->var0.var0 + v20) & 0xFFFFFFFE) == 0xA)
          {
            v21 = [ANSTHand alloc];
            v23 = (void *)objc_msgSend_initWithAcObject_(v21, v22, (uint64_t)self->_acResult + v20 - 8);
            objc_msgSend_addObject_(v10, v24, (uint64_t)v23);

            v18 = self->_acResult;
          }
          ++v19;
          v20 += 36;
        }
        while (v19 < v18->var4);
      }
      goto LABEL_22;
    }
    if (CFSTR("Saliency") == v6 || objc_msgSend_isEqualToString_(v6, v17, (uint64_t)CFSTR("Saliency")))
    {
      objc_msgSend_arrayWithCapacity_(MEMORY[0x24BDBCEB8], v17, self->_acResult->var7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_acResult->var7)
      {
        v25 = 0;
        v26 = 17916;
        do
        {
          v27 = [ANSTObject alloc];
          v29 = (void *)objc_msgSend_initWithAcObject_(v27, v28, (uint64_t)self->_acResult + v26);
          objc_msgSend_addObject_(v10, v30, (uint64_t)v29);

          ++v25;
          v26 += 36;
        }
        while (v25 < self->_acResult->var7);
      }
      goto LABEL_22;
    }
    if (CFSTR("Body") == v6 || objc_msgSend_isEqualToString_(v6, v17, (uint64_t)CFSTR("Body")))
    {
      objc_msgSend__objectsOfCategory_fromAcResult_(self, v17, 1, self->_acResult);
LABEL_47:
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_52;
    }
    if (CFSTR("FullBody") == v6 || objc_msgSend_isEqualToString_(v6, v17, (uint64_t)CFSTR("FullBody")))
    {
      objc_msgSend__objectsOfCategory_fromAcResult_(self, v17, 9, self->_acResult);
      goto LABEL_47;
    }
    if (CFSTR("CatBody") == v6 || objc_msgSend_isEqualToString_(v6, v17, (uint64_t)CFSTR("CatBody")))
    {
      objc_msgSend__objectsOfCategory_fromAcResult_(self, v17, 2, self->_acResult);
      goto LABEL_47;
    }
    if (CFSTR("CatHead") == v6 || objc_msgSend_isEqualToString_(v6, v17, (uint64_t)CFSTR("CatHead")))
    {
      objc_msgSend__objectsOfCategory_fromAcResult_(self, v17, 3, self->_acResult);
      goto LABEL_47;
    }
    if (CFSTR("DogBody") == v6 || objc_msgSend_isEqualToString_(v6, v17, (uint64_t)CFSTR("DogBody")))
    {
      objc_msgSend__objectsOfCategory_fromAcResult_(self, v17, 4, self->_acResult);
      goto LABEL_47;
    }
    if (CFSTR("DogHead") == v6 || objc_msgSend_isEqualToString_(v6, v17, (uint64_t)CFSTR("DogHead")))
    {
      objc_msgSend__objectsOfCategory_fromAcResult_(self, v17, 5, self->_acResult);
      goto LABEL_47;
    }
    if (CFSTR("OtherAnimal") == v6
      || objc_msgSend_isEqualToString_(v6, v17, (uint64_t)CFSTR("OtherAnimal")))
    {
      objc_msgSend__objectsOfCategory_fromAcResult_(self, v17, 7, self->_acResult);
      goto LABEL_47;
    }
    if (CFSTR("Sportsball") == v6 || objc_msgSend_isEqualToString_(v6, v17, (uint64_t)CFSTR("Sportsball")))
    {
      objc_msgSend__objectsOfCategory_fromAcResult_(self, v17, 8, self->_acResult);
      goto LABEL_47;
    }
    _ANSTLoggingGetOSLogForCategoryANSTKit();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      sub_235911B5C();

LABEL_51:
    v31 = 0;
    goto LABEL_52;
  }
  acResult = self->_acResult;
LABEL_5:
  objc_msgSend_arrayWithCapacity_(MEMORY[0x24BDBCEB8], v5, acResult->var2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_acResult->var2)
  {
    v11 = 0;
    v12 = 224;
    do
    {
      v13 = [ANSTFace alloc];
      v15 = (void *)objc_msgSend_initWithAcFace_(v13, v14, (uint64_t)self->_acResult + v12);
      objc_msgSend_addObject_(v10, v16, (uint64_t)v15);

      ++v11;
      v12 += 1624;
    }
    while (v11 < self->_acResult->var2);
  }
LABEL_22:
  v31 = (void *)objc_msgSend_copy(v10, v8, v9);

LABEL_52:
  return v31;
}

- (id)_objectsOfCategory:(int)a3 fromAcResult:(id *)a4
{
  const char *v6;
  uint64_t v7;
  void *v8;
  unsigned int *p_var4;
  unint64_t var4;
  unint64_t v11;
  $E9E4153CDFA31608C3F51DE770B9551B *var5;
  __int128 v13;
  ANSTObject *v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  _OWORD v20[2];
  int v21;

  v8 = (void *)objc_opt_new();
  p_var4 = &a4->var4;
  var4 = a4->var4;
  if ((_DWORD)var4)
  {
    v11 = 0;
    var5 = a4->var5;
    do
    {
      v13 = *(_OWORD *)&var5->var3.var1;
      v20[0] = *(_OWORD *)&var5->var0;
      v20[1] = v13;
      v21 = var5->var5;
      if (DWORD2(v20[0]) == a3)
      {
        v14 = [ANSTObject alloc];
        v16 = (void *)objc_msgSend_initWithAcObject_(v14, v15, (uint64_t)v20);
        objc_msgSend_addObject_(v8, v17, (uint64_t)v16, *(_QWORD *)&v20[0]);

        var4 = *p_var4;
      }
      ++v11;
      ++var5;
    }
    while (v11 < var4);
  }
  v18 = (void *)objc_msgSend_copy(v8, v6, v7, *(_QWORD *)&v20[0]);

  return v18;
}

- (__CVBuffer)maskForSemanticCategory:(id)a3
{
  __CFString *v4;
  const char *v5;
  __CFString *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  __CVBuffer *v13;
  NSObject *v15;

  v4 = (__CFString *)a3;
  v6 = v4;
  if (CFSTR("Person") == v4 || objc_msgSend_isEqualToString_(v4, v5, (uint64_t)CFSTR("Person")))
  {
    v8 = 16;
LABEL_19:
    v13 = *(Class *)((char *)&self->super.super.isa + v8);
    goto LABEL_20;
  }
  if (CFSTR("SalientPerson") == v6
    || objc_msgSend_isEqualToString_(v6, v7, (uint64_t)CFSTR("SalientPerson")))
  {
    v8 = 24;
    goto LABEL_19;
  }
  if (CFSTR("Skin") == v6 || objc_msgSend_isEqualToString_(v6, v9, (uint64_t)CFSTR("Skin")))
  {
    v8 = 32;
    goto LABEL_19;
  }
  if (CFSTR("Hair") == v6 || objc_msgSend_isEqualToString_(v6, v10, (uint64_t)CFSTR("Hair")))
  {
    v8 = 40;
    goto LABEL_19;
  }
  if (CFSTR("Sky") == v6 || objc_msgSend_isEqualToString_(v6, v11, (uint64_t)CFSTR("Sky")))
  {
    v8 = 48;
    goto LABEL_19;
  }
  if (CFSTR("Saliency") == v6 || objc_msgSend_isEqualToString_(v6, v12, (uint64_t)CFSTR("Saliency")))
  {
    v8 = 56;
    goto LABEL_19;
  }
  _ANSTLoggingGetOSLogForCategoryANSTKit();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    sub_235911BCC();

  v13 = 0;
LABEL_20:

  return v13;
}

@end
