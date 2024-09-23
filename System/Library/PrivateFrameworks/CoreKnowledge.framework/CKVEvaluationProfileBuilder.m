@implementation CKVEvaluationProfileBuilder

- (CKVEvaluationProfileBuilder)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("init unsupported"), MEMORY[0x1E0C9AA70]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (CKVEvaluationProfileBuilder)initWithOmittedItemTypes:(id)a3
{
  id v4;
  CKVEvaluationProfileBuilder *v5;
  void *v6;
  objc_class *v7;
  uint64_t v8;
  CESRRawSpeechProfileConverter *converter;
  objc_super v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CKVEvaluationProfileBuilder;
  v5 = -[CKVEvaluationProfileBuilder init](&v11, sel_init);
  if (v5)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2050000000;
    v6 = (void *)getCESRRawSpeechProfileConverterClass_softClass;
    v16 = getCESRRawSpeechProfileConverterClass_softClass;
    if (!getCESRRawSpeechProfileConverterClass_softClass)
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __getCESRRawSpeechProfileConverterClass_block_invoke;
      v12[3] = &unk_1E4D29880;
      v12[4] = &v13;
      __getCESRRawSpeechProfileConverterClass_block_invoke((uint64_t)v12);
      v6 = (void *)v14[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v13, 8);
    v8 = objc_msgSend([v7 alloc], "initWithOmittedItemTypes:", v4);
    converter = v5->_converter;
    v5->_converter = (CESRRawSpeechProfileConverter *)v8;

  }
  return v5;
}

- (BOOL)setPrimaryRawSpeechProfile:(id)a3 rawSpeechProfileMetadata:(id)a4 error:(id *)a5
{
  return -[CESRRawSpeechProfileConverter setPrimaryRawSpeechProfile:error:](self->_converter, "setPrimaryRawSpeechProfile:error:", a3, a5);
}

- (BOOL)addCompanionRawSpeechProfile:(id)a3 rawSpeechProfileMetadata:(id)a4 deviceId:(id)a5 userId:(id)a6 error:(id *)a7
{
  return -[CESRRawSpeechProfileConverter addCompanionRawSpeechProfile:deviceId:userId:error:](self->_converter, "addCompanionRawSpeechProfile:deviceId:userId:error:", a3, a5, a6, a7);
}

- (id)buildWithError:(id *)a3
{
  return (id)-[CESRRawSpeechProfileConverter convertToKVProfileWithError:](self->_converter, "convertToKVProfileWithError:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_converter, 0);
}

@end
