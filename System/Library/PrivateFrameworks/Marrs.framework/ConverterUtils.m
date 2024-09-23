@implementation ConverterUtils

+ (Reader)getCppReaderFromObjCObject:(SEL)a3
{
  const unsigned __int8 *v5;
  Reader *result;
  id v7;

  objc_msgSend(a4, "data");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (const unsigned __int8 *)objc_msgSend(v7, "bytes");
  objc_msgSend(v7, "length");
  PB::Reader::Reader((PB::Reader *)retstr, v5);

  return result;
}

+ (unique_ptr<sirinluinternalmention_detector::MentionDetectorRequest,)convertMentionDetectorRequestFromObjCToCpp:(id)a3
{
  uint64_t *v3;
  uint64_t *v5;
  id v6;
  sirinluinternalmention_detector::MentionDetectorRequest *v7;
  uint64_t v8;
  unique_ptr<sirinluinternalmention_detector::MentionDetectorRequest, std::default_delete<sirinluinternalmention_detector::MentionDetectorRequest>> v9;
  uint64_t v10;

  v5 = v3;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(a1, "getCppReaderFromObjCObject:", v6);
    v7 = (sirinluinternalmention_detector::MentionDetectorRequest *)operator new();
    v8 = sirinluinternalmention_detector::MentionDetectorRequest::MentionDetectorRequest(v7);
    *v5 = v8;
    (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v8 + 16))(v8, &v10);
  }
  else
  {
    *v5 = 0;
  }

  return v9;
}

+ (unique_ptr<sirinluinternalmention_resolver::MentionResolverRequest,)convertMentionResolverRequestFromObjCToCpp:(id)a3
{
  uint64_t *v3;
  uint64_t *v5;
  id v6;
  sirinluinternalmention_resolver::MentionResolverRequest *v7;
  uint64_t v8;
  unique_ptr<sirinluinternalmention_resolver::MentionResolverRequest, std::default_delete<sirinluinternalmention_resolver::MentionResolverRequest>> v9;
  uint64_t v10;

  v5 = v3;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(a1, "getCppReaderFromObjCObject:", v6);
    v7 = (sirinluinternalmention_resolver::MentionResolverRequest *)operator new();
    v8 = sirinluinternalmention_resolver::MentionResolverRequest::MentionResolverRequest(v7);
    *v5 = v8;
    (*(void (**)(uint64_t, uint64_t *))(*(_QWORD *)v8 + 16))(v8, &v10);
  }
  else
  {
    *v5 = 0;
  }

  return v9;
}

+ (id)convertMentionResolverResponseFromCppToObjC:(void *)a3
{
  PB::Writer *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;

  if (*(_QWORD *)a3)
  {
    v4 = (PB::Writer *)operator new();
    PB::Writer::Writer(v4);
    (*(void (**)(_QWORD, PB::Writer *))(**(_QWORD **)a3 + 24))(*(_QWORD *)a3, v4);
    v5 = *((_QWORD *)v4 + 1);
    v6 = objc_alloc(MEMORY[0x1E0D9F9F8]);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v5, *(_QWORD *)v4 - *((_QWORD *)v4 + 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithData:", v7);

    PB::Writer::~Writer(v4);
    MEMORY[0x1C3BC5C7C]();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (id)convertMentionDetectorResponseFromCppToObjC:(void *)a3
{
  PB::Writer *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;

  if (*(_QWORD *)a3)
  {
    v4 = (PB::Writer *)operator new();
    PB::Writer::Writer(v4);
    (*(void (**)(_QWORD, PB::Writer *))(**(_QWORD **)a3 + 24))(*(_QWORD *)a3, v4);
    v5 = *((_QWORD *)v4 + 1);
    v6 = objc_alloc(MEMORY[0x1E0D9F9E8]);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v5, *(_QWORD *)v4 - *((_QWORD *)v4 + 1));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithData:", v7);

    PB::Writer::~Writer(v4);
    MEMORY[0x1C3BC5C7C]();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

@end
