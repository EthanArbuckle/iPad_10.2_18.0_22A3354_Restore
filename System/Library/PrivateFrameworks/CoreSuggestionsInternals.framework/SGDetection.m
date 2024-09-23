@implementation SGDetection

- (SGDetection)initWithType:(unsigned int)a3 extraction:(id)a4 context:(id)a5 contextRangeOfInterest:(_NSRange)a6 label:(id)a7 hasPhoneLabel:(BOOL)a8 match:(_NSRange)a9 extractionInfo:(id)a10 isUnlikelyPhone:(BOOL)a11
{
  NSUInteger length;
  NSUInteger location;
  id v17;
  id v18;
  id v19;
  SGDetection *v20;
  SGDetection *v21;
  id v24;
  objc_super v25;

  length = a6.length;
  location = a6.location;
  v17 = a4;
  v18 = a5;
  v19 = a7;
  v24 = a10;
  v25.receiver = self;
  v25.super_class = (Class)SGDetection;
  v20 = -[SGDetection init](&v25, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_type = a3;
    objc_storeStrong((id *)&v20->_extraction, a4);
    objc_storeStrong((id *)&v21->_context, a5);
    v21->_contextRangeOfInterest.location = location;
    v21->_contextRangeOfInterest.length = length;
    objc_storeStrong((id *)&v21->_label, a7);
    v21->_hasPhoneLabel = a8;
    v21->_match = a9;
    objc_storeStrong((id *)&v21->_extractionInfo, a10);
    v21->_isUnlikelyPhone = a11;
  }

  return v21;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<SGDetection/%@ '%@'>"), self->_label, self->_extraction);
}

- (unsigned)type
{
  return self->_type;
}

- (NSString)extraction
{
  return self->_extraction;
}

- (NSString)context
{
  return self->_context;
}

- (_NSRange)contextRangeOfInterest
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_contextRangeOfInterest.length;
  location = self->_contextRangeOfInterest.location;
  result.length = length;
  result.location = location;
  return result;
}

- (NSString)label
{
  return self->_label;
}

- (BOOL)hasPhoneLabel
{
  return self->_hasPhoneLabel;
}

- (_NSRange)match
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_match.length;
  location = self->_match.location;
  result.length = length;
  result.location = location;
  return result;
}

- (SGExtractionInfo)extractionInfo
{
  return self->_extractionInfo;
}

- (BOOL)isUnlikelyPhone
{
  return self->_isUnlikelyPhone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extractionInfo, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_extraction, 0);
}

+ (id)detectionWithType:(unsigned int)a3 text:(id)a4 matchRange:(_NSRange)a5 matchString:(id)a6 label:(id)a7 hasPhoneLabel:(BOOL)a8 extractionInfo:(id)a9 isUnlikelyPhone:(BOOL)a10
{
  NSUInteger length;
  NSUInteger location;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  _QWORD v30[6];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;

  length = a5.length;
  location = a5.location;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a9;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v34 = objc_msgSend(v15, "length");
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __112__SGDetection_detectionWithType_text_matchRange_matchString_label_hasPhoneLabel_extractionInfo_isUnlikelyPhone___block_invoke;
  v30[3] = &unk_1E7DAE038;
  v30[4] = &v35;
  v30[5] = location;
  objc_msgSend(v15, "enumerateSubstringsInRange:options:usingBlock:", 0, location, 260, v30);
  objc_msgSend(v15, "length");
  v19 = objc_msgSend(v15, "enumerateSubstringsInRange:options:usingBlock:");
  if (v16)
  {
    v20 = v16;
  }
  else
  {
    v21 = (void *)MEMORY[0x1C3BD4F6C](v19);
    objc_msgSend(v15, "substringWithRange:", location, length);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v21);
  }
  v22 = objc_alloc((Class)a1);
  v23 = (void *)MEMORY[0x1C3BD4F6C]();
  objc_msgSend(v15, "substringWithRange:", v36[3], v32[3] - v36[3]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v23);
  LOBYTE(v28) = a10;
  LOBYTE(v27) = a8;
  v25 = (void *)objc_msgSend(v22, "initWithType:extraction:context:contextRangeOfInterest:label:hasPhoneLabel:match:extractionInfo:isUnlikelyPhone:", a3, v20, v24, location - v36[3], length, v17, v27, location, length, v18, v28);

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v35, 8);

  return v25;
}

uint64_t __112__SGDetection_detectionWithType_text_matchRange_matchString_label_hasPhoneLabel_extractionInfo_isUnlikelyPhone___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  if ((unint64_t)(*(_QWORD *)(result + 40) - a3) >= 0x50)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a3;
    *a7 = 1;
  }
  return result;
}

uint64_t __112__SGDetection_detectionWithType_text_matchRange_matchString_label_hasPhoneLabel_extractionInfo_isUnlikelyPhone___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7)
{
  if ((unint64_t)(a3 - *(_QWORD *)(result + 40)) >= 0x50)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a3;
    *a7 = 1;
  }
  return result;
}

@end
