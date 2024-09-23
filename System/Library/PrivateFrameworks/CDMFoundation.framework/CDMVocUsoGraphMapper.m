@implementation CDMVocUsoGraphMapper

+ (id)settingVocLabel
{
  if (+[CDMVocUsoGraphMapper settingVocLabel]::onceToken != -1)
    dispatch_once(&+[CDMVocUsoGraphMapper settingVocLabel]::onceToken, &__block_literal_global_9039);
  return (id)+[CDMVocUsoGraphMapper settingVocLabel]::value;
}

+ (id)emergencyPhonePersonSemantic
{
  if (+[CDMVocUsoGraphMapper emergencyPhonePersonSemantic]::onceToken != -1)
    dispatch_once(&+[CDMVocUsoGraphMapper emergencyPhonePersonSemantic]::onceToken, &__block_literal_global_46);
  return (id)+[CDMVocUsoGraphMapper emergencyPhonePersonSemantic]::value;
}

+ (id)listPositionSemantic
{
  if (+[CDMVocUsoGraphMapper listPositionSemantic]::onceToken != -1)
    dispatch_once(&+[CDMVocUsoGraphMapper listPositionSemantic]::onceToken, &__block_literal_global_59);
  return (id)+[CDMVocUsoGraphMapper listPositionSemantic]::value;
}

+ (id)ordinalsSemantic
{
  if (+[CDMVocUsoGraphMapper ordinalsSemantic]::onceToken != -1)
    dispatch_once(&+[CDMVocUsoGraphMapper ordinalsSemantic]::onceToken, &__block_literal_global_74);
  return (id)+[CDMVocUsoGraphMapper ordinalsSemantic]::value;
}

+ (id)emergencyPhoneNumberSemantic
{
  if (+[CDMVocUsoGraphMapper emergencyPhoneNumberSemantic]::onceToken != -1)
    dispatch_once(&+[CDMVocUsoGraphMapper emergencyPhoneNumberSemantic]::onceToken, &__block_literal_global_125);
  return (id)+[CDMVocUsoGraphMapper emergencyPhoneNumberSemantic]::value;
}

+ (id)buildContactTypeUSOGraphWithIdentifier:(id)a3 withSemantic:(id)a4 withInput:(id)a5 withStartCharIndex:(unsigned int)a6 withEndCharIndex:(unsigned int)a7 withTokenCount:(unsigned int)a8
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v14;
  siri::ontology::oname::graph::ontology_init *v15;
  siri::ontology::oname::graph::ontology_init *EntityNode;
  uint64_t v17;
  id v18;
  uint64_t v19;
  siri::ontology::oname::graph::ontology_init *v20;
  siri::ontology::oname::graph::ontology_init *v21;
  void *v22;
  uint64_t v23;
  id v25;
  id v26;
  id v27;
  void **v28;
  uint64_t v29;
  void *__p;
  int v31;
  char v32;
  char v33;
  uint64_t v34;

  v8 = *(_QWORD *)&a8;
  v9 = *(_QWORD *)&a7;
  v10 = *(_QWORD *)&a6;
  v27 = a3;
  v26 = a4;
  v25 = a5;
  v14 = operator new();
  __p = 0;
  v31 = 0;
  v15 = (siri::ontology::oname::graph::ontology_init *)MEMORY[0x220743D50](v14, &__p);
  v34 = v14;
  siri::ontology::oname::graph::ontology_init::common_Person(v15);
  EntityNode = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraph::createEntityNode();
  v17 = v8;
  siri::ontology::oname::graph::ontology_init::common_ContactAddress(EntityNode);
  siri::ontology::UsoGraph::createEntityNode();
  v18 = objc_retainAutorelease(v25);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v18, "UTF8String", v25));
  v33 = 1;
  siri::ontology::UsoGraph::createStringNode();
  if (v33 && v32 < 0)
    operator delete(__p);
  siri::ontology::UsoEntityNode::addUtteranceAlignment();
  objc_msgSend(a1, "buildIdentifierWithSemantic:withVocLabel:", v26, v27);
  siri::ontology::UsoEntityNode::addIdentifier();
  if (v29)
    std::default_delete<siri::ontology::UsoIdentifier>::operator()[abi:ne180100](v29);
  v19 = +[CDMFeatureFlags isUsoEntitySpanEnabled](CDMFeatureFlags, "isUsoEntitySpanEnabled");
  if ((_DWORD)v19)
  {
    objc_msgSend(a1, "buildEntitySpanWithSemantic:withVocLabel:withStartIndex:withEndIndex:withTokenCount:", v26, v27, v10, v9, v17);
    siri::ontology::UsoEntityNode::addEntitySpan();
    v19 = (uint64_t)v28;
    if (v28)
    {
      siri::ontology::UsoEntitySpan::~UsoEntitySpan(v28);
      v19 = MEMORY[0x22074408C]();
    }
  }
  siri::ontology::oname::graph::ontology_init::Argument_label((siri::ontology::oname::graph::ontology_init *)v19);
  v20 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraphNode::setSuccessor();
  siri::ontology::oname::graph::ontology_init::Argument_specifyingContactAddress(v20);
  v21 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraphNode::setSuccessor();
  siri::ontology::oname::graph::ontology_init::Argument_entity(v21);
  siri::ontology::UsoGraphNode::setSuccessor();
  objc_msgSend(MEMORY[0x24BE9E330], "convertCppGraph:", v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x220743D5C](v14);
  MEMORY[0x22074408C](v23, 0x10A0C403D23BABBLL);

  return v22;
}

+ (id)buildEmailContactUSOGraphWithIdentifier:(id)a3 withSemantic:(id)a4 withInput:(id)a5 withStartCharIndex:(unsigned int)a6 withEndCharIndex:(unsigned int)a7 withTokenCount:(unsigned int)a8
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v14;
  siri::ontology::oname::graph::ontology_init *v15;
  siri::ontology::oname::graph::ontology_init *EntityNode;
  uint64_t v17;
  id v18;
  uint64_t v19;
  siri::ontology::oname::graph::ontology_init *v20;
  siri::ontology::oname::graph::ontology_init *v21;
  void *v22;
  uint64_t v23;
  id v25;
  id v26;
  id v27;
  void **v28;
  uint64_t v29;
  void *__p;
  int v31;
  char v32;
  char v33;
  uint64_t v34;

  v8 = *(_QWORD *)&a8;
  v9 = *(_QWORD *)&a7;
  v10 = *(_QWORD *)&a6;
  v27 = a3;
  v26 = a4;
  v25 = a5;
  v14 = operator new();
  __p = 0;
  v31 = 0;
  v15 = (siri::ontology::oname::graph::ontology_init *)MEMORY[0x220743D50](v14, &__p);
  v34 = v14;
  siri::ontology::oname::graph::ontology_init::common_Person(v15);
  EntityNode = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraph::createEntityNode();
  v17 = v8;
  siri::ontology::oname::graph::ontology_init::common_EmailAddress(EntityNode);
  siri::ontology::UsoGraph::createEntityNode();
  v18 = objc_retainAutorelease(v25);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v18, "UTF8String", v25));
  v33 = 1;
  siri::ontology::UsoGraph::createStringNode();
  if (v33 && v32 < 0)
    operator delete(__p);
  siri::ontology::UsoEntityNode::addUtteranceAlignment();
  objc_msgSend(a1, "buildIdentifierWithSemantic:withVocLabel:", v26, v27);
  siri::ontology::UsoEntityNode::addIdentifier();
  if (v29)
    std::default_delete<siri::ontology::UsoIdentifier>::operator()[abi:ne180100](v29);
  v19 = +[CDMFeatureFlags isUsoEntitySpanEnabled](CDMFeatureFlags, "isUsoEntitySpanEnabled");
  if ((_DWORD)v19)
  {
    objc_msgSend(a1, "buildEntitySpanWithSemantic:withVocLabel:withStartIndex:withEndIndex:withTokenCount:", v26, v27, v10, v9, v17);
    siri::ontology::UsoEntityNode::addEntitySpan();
    v19 = (uint64_t)v28;
    if (v28)
    {
      siri::ontology::UsoEntitySpan::~UsoEntitySpan(v28);
      v19 = MEMORY[0x22074408C]();
    }
  }
  siri::ontology::oname::graph::ontology_init::Argument_label((siri::ontology::oname::graph::ontology_init *)v19);
  v20 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraphNode::setSuccessor();
  siri::ontology::oname::graph::ontology_init::Argument_specifyingContactAddress(v20);
  v21 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraphNode::setSuccessor();
  siri::ontology::oname::graph::ontology_init::Argument_entity(v21);
  siri::ontology::UsoGraphNode::setSuccessor();
  objc_msgSend(MEMORY[0x24BE9E330], "convertCppGraph:", v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x220743D5C](v14);
  MEMORY[0x22074408C](v23, 0x10A0C403D23BABBLL);

  return v22;
}

+ (id)buildPhoneContactUSOGraphWithIdentifier:(id)a3 withSemantic:(id)a4 withInput:(id)a5 withStartCharIndex:(unsigned int)a6 withEndCharIndex:(unsigned int)a7 withTokenCount:(unsigned int)a8
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v14;
  siri::ontology::oname::graph::ontology_init *v15;
  siri::ontology::oname::graph::ontology_init *EntityNode;
  uint64_t v17;
  id v18;
  uint64_t v19;
  siri::ontology::oname::graph::ontology_init *v20;
  siri::ontology::oname::graph::ontology_init *v21;
  void *v22;
  uint64_t v23;
  id v25;
  id v26;
  id v27;
  void **v28;
  uint64_t v29;
  void *__p;
  int v31;
  char v32;
  char v33;
  uint64_t v34;

  v8 = *(_QWORD *)&a8;
  v9 = *(_QWORD *)&a7;
  v10 = *(_QWORD *)&a6;
  v27 = a3;
  v26 = a4;
  v25 = a5;
  v14 = operator new();
  __p = 0;
  v31 = 0;
  v15 = (siri::ontology::oname::graph::ontology_init *)MEMORY[0x220743D50](v14, &__p);
  v34 = v14;
  siri::ontology::oname::graph::ontology_init::common_Person(v15);
  EntityNode = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraph::createEntityNode();
  v17 = v8;
  siri::ontology::oname::graph::ontology_init::common_PhoneNumber(EntityNode);
  siri::ontology::UsoGraph::createEntityNode();
  v18 = objc_retainAutorelease(v25);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v18, "UTF8String", v25));
  v33 = 1;
  siri::ontology::UsoGraph::createStringNode();
  if (v33 && v32 < 0)
    operator delete(__p);
  siri::ontology::UsoEntityNode::addUtteranceAlignment();
  objc_msgSend(a1, "buildIdentifierWithSemantic:withVocLabel:", v26, v27);
  siri::ontology::UsoEntityNode::addIdentifier();
  if (v29)
    std::default_delete<siri::ontology::UsoIdentifier>::operator()[abi:ne180100](v29);
  v19 = +[CDMFeatureFlags isUsoEntitySpanEnabled](CDMFeatureFlags, "isUsoEntitySpanEnabled");
  if ((_DWORD)v19)
  {
    objc_msgSend(a1, "buildEntitySpanWithSemantic:withVocLabel:withStartIndex:withEndIndex:withTokenCount:", v26, v27, v10, v9, v17);
    siri::ontology::UsoEntityNode::addEntitySpan();
    v19 = (uint64_t)v28;
    if (v28)
    {
      siri::ontology::UsoEntitySpan::~UsoEntitySpan(v28);
      v19 = MEMORY[0x22074408C]();
    }
  }
  siri::ontology::oname::graph::ontology_init::Argument_label((siri::ontology::oname::graph::ontology_init *)v19);
  v20 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraphNode::setSuccessor();
  siri::ontology::oname::graph::ontology_init::Argument_specifyingContactAddress(v20);
  v21 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraphNode::setSuccessor();
  siri::ontology::oname::graph::ontology_init::Argument_entity(v21);
  siri::ontology::UsoGraphNode::setSuccessor();
  objc_msgSend(MEMORY[0x24BE9E330], "convertCppGraph:", v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x220743D5C](v14);
  MEMORY[0x22074408C](v23, 0x10A0C403D23BABBLL);

  return v22;
}

+ (id)buildAppNameUSOGraphWithIdentifier:(id)a3 withSemantic:(id)a4 withInput:(id)a5 withStartCharIndex:(unsigned int)a6 withEndCharIndex:(unsigned int)a7 withTokenCount:(unsigned int)a8
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v14;
  uint64_t v15;
  siri::ontology::oname::graph::ontology_init *v16;
  id v17;
  uint64_t v18;
  siri::ontology::oname::graph::ontology_init *v19;
  void *v20;
  uint64_t v21;
  id v23;
  id v24;
  void **v25;
  uint64_t v26;
  void *__p;
  int v28;
  char v29;
  char v30;
  uint64_t v31;

  v8 = *(_QWORD *)&a8;
  v9 = *(_QWORD *)&a7;
  v10 = *(_QWORD *)&a6;
  v24 = a3;
  v14 = a4;
  v23 = a5;
  v15 = operator new();
  __p = 0;
  v28 = 0;
  v16 = (siri::ontology::oname::graph::ontology_init *)MEMORY[0x220743D50](v15, &__p);
  v31 = v15;
  siri::ontology::oname::graph::ontology_init::common_App(v16);
  siri::ontology::UsoGraph::createEntityNode();
  v17 = objc_retainAutorelease(v23);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v17, "UTF8String"));
  v30 = 1;
  siri::ontology::UsoGraph::createStringNode();
  if (v30 && v29 < 0)
    operator delete(__p);
  siri::ontology::UsoEntityNode::addUtteranceAlignment();
  objc_msgSend(a1, "buildIdentifierWithSemantic:withVocLabel:", v14, v24);
  siri::ontology::UsoEntityNode::addIdentifier();
  if (v26)
    std::default_delete<siri::ontology::UsoIdentifier>::operator()[abi:ne180100](v26);
  v18 = +[CDMFeatureFlags isUsoEntitySpanEnabled](CDMFeatureFlags, "isUsoEntitySpanEnabled");
  if ((_DWORD)v18)
  {
    objc_msgSend(a1, "buildEntitySpanWithSemantic:withVocLabel:withStartIndex:withEndIndex:withTokenCount:", v14, v24, v10, v9, v8);
    siri::ontology::UsoEntityNode::addEntitySpan();
    v18 = (uint64_t)v25;
    if (v25)
    {
      siri::ontology::UsoEntitySpan::~UsoEntitySpan(v25);
      v18 = MEMORY[0x22074408C]();
    }
  }
  siri::ontology::oname::graph::ontology_init::Argument_name((siri::ontology::oname::graph::ontology_init *)v18);
  v19 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraphNode::setSuccessor();
  siri::ontology::oname::graph::ontology_init::Argument_entity(v19);
  siri::ontology::UsoGraphNode::setSuccessor();
  objc_msgSend(MEMORY[0x24BE9E330], "convertCppGraph:", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x220743D5C](v15);
  MEMORY[0x22074408C](v21, 0x10A0C403D23BABBLL);

  return v20;
}

+ (id)buildSettingUSOGraphWithIdentifier:(id)a3 withSemantic:(id)a4 withInput:(id)a5 withStartCharIndex:(unsigned int)a6 withEndCharIndex:(unsigned int)a7 withTokenCount:(unsigned int)a8
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v14;
  uint64_t v15;
  siri::ontology::oname::graph::ontology_init *v16;
  id v17;
  uint64_t v18;
  siri::ontology::oname::graph::ontology_init *v19;
  void *v20;
  uint64_t v21;
  id v23;
  id v24;
  void **v25;
  uint64_t v26;
  void *__p;
  int v28;
  char v29;
  char v30;
  uint64_t v31;

  v8 = *(_QWORD *)&a8;
  v9 = *(_QWORD *)&a7;
  v10 = *(_QWORD *)&a6;
  v24 = a3;
  v14 = a4;
  v23 = a5;
  v15 = operator new();
  __p = 0;
  v28 = 0;
  v16 = (siri::ontology::oname::graph::ontology_init *)MEMORY[0x220743D50](v15, &__p);
  v31 = v15;
  siri::ontology::oname::graph::ontology_init::common_Setting(v16);
  siri::ontology::UsoGraph::createEntityNode();
  v17 = objc_retainAutorelease(v23);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v17, "UTF8String"));
  v30 = 1;
  siri::ontology::UsoGraph::createStringNode();
  if (v30 && v29 < 0)
    operator delete(__p);
  siri::ontology::UsoEntityNode::addUtteranceAlignment();
  objc_msgSend(a1, "buildIdentifierWithSemantic:withVocLabel:", v14, v24);
  siri::ontology::UsoEntityNode::addIdentifier();
  if (v26)
    std::default_delete<siri::ontology::UsoIdentifier>::operator()[abi:ne180100](v26);
  v18 = +[CDMFeatureFlags isUsoEntitySpanEnabled](CDMFeatureFlags, "isUsoEntitySpanEnabled");
  if ((_DWORD)v18)
  {
    objc_msgSend(a1, "buildEntitySpanWithSemantic:withVocLabel:withStartIndex:withEndIndex:withTokenCount:", v14, v24, v10, v9, v8);
    siri::ontology::UsoEntityNode::addEntitySpan();
    v18 = (uint64_t)v25;
    if (v25)
    {
      siri::ontology::UsoEntitySpan::~UsoEntitySpan(v25);
      v18 = MEMORY[0x22074408C]();
    }
  }
  siri::ontology::oname::graph::ontology_init::Argument_name((siri::ontology::oname::graph::ontology_init *)v18);
  v19 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraphNode::setSuccessor();
  siri::ontology::oname::graph::ontology_init::Argument_entity(v19);
  siri::ontology::UsoGraphNode::setSuccessor();
  objc_msgSend(MEMORY[0x24BE9E330], "convertCppGraph:", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x220743D5C](v15);
  MEMORY[0x22074408C](v21, 0x10A0C403D23BABBLL);

  return v20;
}

+ (id)buildPersonRelationshipUSOGraphWithIdentifier:(id)a3 withSemantic:(id)a4 withInput:(id)a5 withStartCharIndex:(unsigned int)a6 withEndCharIndex:(unsigned int)a7 withTokenCount:(unsigned int)a8
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v14;
  siri::ontology::oname::graph::ontology_init *v15;
  siri::ontology::oname::graph::ontology_init *EntityNode;
  uint64_t v17;
  id v18;
  uint64_t v19;
  siri::ontology::oname::graph::ontology_init *v20;
  siri::ontology::oname::graph::ontology_init *v21;
  void *v22;
  uint64_t v23;
  id v25;
  id v26;
  id v27;
  void **v28;
  uint64_t v29;
  void *__p;
  int v31;
  char v32;
  char v33;
  uint64_t v34;

  v8 = *(_QWORD *)&a8;
  v9 = *(_QWORD *)&a7;
  v10 = *(_QWORD *)&a6;
  v27 = a3;
  v26 = a4;
  v25 = a5;
  v14 = operator new();
  __p = 0;
  v31 = 0;
  v15 = (siri::ontology::oname::graph::ontology_init *)MEMORY[0x220743D50](v14, &__p);
  v34 = v14;
  siri::ontology::oname::graph::ontology_init::common_Person(v15);
  EntityNode = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraph::createEntityNode();
  v17 = v8;
  siri::ontology::oname::graph::ontology_init::common_PersonRelationship(EntityNode);
  siri::ontology::UsoGraph::createEntityNode();
  v18 = objc_retainAutorelease(v25);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v18, "UTF8String", v25));
  v33 = 1;
  siri::ontology::UsoGraph::createStringNode();
  if (v33 && v32 < 0)
    operator delete(__p);
  siri::ontology::UsoEntityNode::addUtteranceAlignment();
  objc_msgSend(a1, "buildIdentifierWithSemantic:withVocLabel:", v26, v27);
  siri::ontology::UsoEntityNode::addIdentifier();
  if (v29)
    std::default_delete<siri::ontology::UsoIdentifier>::operator()[abi:ne180100](v29);
  v19 = +[CDMFeatureFlags isUsoEntitySpanEnabled](CDMFeatureFlags, "isUsoEntitySpanEnabled");
  if ((_DWORD)v19)
  {
    objc_msgSend(a1, "buildEntitySpanWithSemantic:withVocLabel:withStartIndex:withEndIndex:withTokenCount:", v26, v27, v10, v9, v17);
    siri::ontology::UsoEntityNode::addEntitySpan();
    v19 = (uint64_t)v28;
    if (v28)
    {
      siri::ontology::UsoEntitySpan::~UsoEntitySpan(v28);
      v19 = MEMORY[0x22074408C]();
    }
  }
  siri::ontology::oname::graph::ontology_init::Argument_relationshipType((siri::ontology::oname::graph::ontology_init *)v19);
  v20 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraphNode::setSuccessor();
  siri::ontology::oname::graph::ontology_init::Argument_identifyingRelationship(v20);
  v21 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraphNode::setSuccessor();
  siri::ontology::oname::graph::ontology_init::Argument_entity(v21);
  siri::ontology::UsoGraphNode::setSuccessor();
  objc_msgSend(MEMORY[0x24BE9E330], "convertCppGraph:", v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x220743D5C](v14);
  MEMORY[0x22074408C](v23, 0x10A0C403D23BABBLL);

  return v22;
}

+ (id)buildPhoneNumberRegexUSOGraphWithIdentifier:(id)a3 withInput:(id)a4 withStartCharIndex:(unsigned int)a5 withEndCharIndex:(unsigned int)a6
{
  id v6;
  uint64_t v7;
  siri::ontology::oname::graph::ontology_init *v8;
  id v9;
  siri::ontology::oname::graph::ontology_init *v10;
  siri::ontology::oname::graph::ontology_init *v11;
  void *v12;
  uint64_t v13;
  void *__p;
  int v16;
  char v17;
  char v18;
  uint64_t v19;

  v6 = a4;
  v7 = operator new();
  __p = 0;
  v16 = 0;
  v8 = (siri::ontology::oname::graph::ontology_init *)MEMORY[0x220743D50](v7, &__p);
  v19 = v7;
  siri::ontology::oname::graph::ontology_init::common_PhoneNumber(v8);
  siri::ontology::UsoGraph::createEntityNode();
  v9 = objc_retainAutorelease(v6);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v9, "UTF8String"));
  v18 = 1;
  siri::ontology::UsoGraph::createStringNode();
  if (v18 && v17 < 0)
    operator delete(__p);
  v10 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoEntityNode::addUtteranceAlignment();
  siri::ontology::oname::graph::ontology_init::Argument_value(v10);
  v11 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraphNode::setSuccessor();
  siri::ontology::oname::graph::ontology_init::Argument_entity(v11);
  siri::ontology::UsoGraphNode::setSuccessor();
  objc_msgSend(MEMORY[0x24BE9E330], "convertCppGraph:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x220743D5C](v7);
  MEMORY[0x22074408C](v13, 0x10A0C403D23BABBLL);

  return v12;
}

+ (id)buildDeviceCategoryUSOGraphWithIdentifier:(id)a3 withSemantic:(id)a4 withInput:(id)a5 withStartCharIndex:(unsigned int)a6 withEndCharIndex:(unsigned int)a7 withTokenCount:(unsigned int)a8
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v14;
  uint64_t v15;
  siri::ontology::oname::graph::ontology_init *v16;
  id v17;
  uint64_t v18;
  siri::ontology::oname::graph::ontology_init *v19;
  void *v20;
  uint64_t v21;
  id v23;
  id v24;
  void **v25;
  uint64_t v26;
  void *__p;
  int v28;
  char v29;
  char v30;
  uint64_t v31;

  v8 = *(_QWORD *)&a8;
  v9 = *(_QWORD *)&a7;
  v10 = *(_QWORD *)&a6;
  v24 = a3;
  v14 = a4;
  v23 = a5;
  v15 = operator new();
  __p = 0;
  v28 = 0;
  v16 = (siri::ontology::oname::graph::ontology_init *)MEMORY[0x220743D50](v15, &__p);
  v31 = v15;
  siri::ontology::oname::graph::ontology_init::common_DeviceCategory(v16);
  siri::ontology::UsoGraph::createEntityNode();
  v17 = objc_retainAutorelease(v23);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v17, "UTF8String"));
  v30 = 1;
  siri::ontology::UsoGraph::createStringNode();
  if (v30 && v29 < 0)
    operator delete(__p);
  siri::ontology::UsoEntityNode::addUtteranceAlignment();
  objc_msgSend(a1, "buildIdentifierWithSemantic:withVocLabel:", v14, v24);
  siri::ontology::UsoEntityNode::addIdentifier();
  if (v26)
    std::default_delete<siri::ontology::UsoIdentifier>::operator()[abi:ne180100](v26);
  v18 = +[CDMFeatureFlags isUsoEntitySpanEnabled](CDMFeatureFlags, "isUsoEntitySpanEnabled");
  if ((_DWORD)v18)
  {
    objc_msgSend(a1, "buildEntitySpanWithSemantic:withVocLabel:withStartIndex:withEndIndex:withTokenCount:", v14, v24, v10, v9, v8);
    siri::ontology::UsoEntityNode::addEntitySpan();
    v18 = (uint64_t)v25;
    if (v25)
    {
      siri::ontology::UsoEntitySpan::~UsoEntitySpan(v25);
      v18 = MEMORY[0x22074408C]();
    }
  }
  siri::ontology::oname::graph::ontology_init::Argument_name((siri::ontology::oname::graph::ontology_init *)v18);
  v19 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraphNode::setSuccessor();
  siri::ontology::oname::graph::ontology_init::Argument_entity(v19);
  siri::ontology::UsoGraphNode::setSuccessor();
  objc_msgSend(MEMORY[0x24BE9E330], "convertCppGraph:", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x220743D5C](v15);
  MEMORY[0x22074408C](v21, 0x10A0C403D23BABBLL);

  return v20;
}

+ (id)buildEmailAddressRegexUSOGraphWithIdentifier:(id)a3 withInput:(id)a4 withStartCharIndex:(unsigned int)a5 withEndCharIndex:(unsigned int)a6
{
  id v6;
  uint64_t v7;
  siri::ontology::oname::graph::ontology_init *v8;
  id v9;
  siri::ontology::oname::graph::ontology_init *v10;
  siri::ontology::oname::graph::ontology_init *v11;
  void *v12;
  uint64_t v13;
  void *__p;
  int v16;
  char v17;
  char v18;
  uint64_t v19;

  v6 = a4;
  v7 = operator new();
  __p = 0;
  v16 = 0;
  v8 = (siri::ontology::oname::graph::ontology_init *)MEMORY[0x220743D50](v7, &__p);
  v19 = v7;
  siri::ontology::oname::graph::ontology_init::common_EmailAddress(v8);
  siri::ontology::UsoGraph::createEntityNode();
  v9 = objc_retainAutorelease(v6);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v9, "UTF8String"));
  v18 = 1;
  siri::ontology::UsoGraph::createStringNode();
  if (v18 && v17 < 0)
    operator delete(__p);
  v10 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoEntityNode::addUtteranceAlignment();
  siri::ontology::oname::graph::ontology_init::Argument_value(v10);
  v11 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraphNode::setSuccessor();
  siri::ontology::oname::graph::ontology_init::Argument_entity(v11);
  siri::ontology::UsoGraphNode::setSuccessor();
  objc_msgSend(MEMORY[0x24BE9E330], "convertCppGraph:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x220743D5C](v7);
  MEMORY[0x22074408C](v13, 0x10A0C403D23BABBLL);

  return v12;
}

+ (id)buildDecimalRegexUSOGraphWithIdentifier:(id)a3 withInput:(id)a4 withStartCharIndex:(unsigned int)a5 withEndCharIndex:(unsigned int)a6
{
  id v6;
  uint64_t v7;
  siri::ontology::oname::graph::ontology_init *v8;
  id v9;
  siri::ontology::oname::graph::ontology_init *v10;
  siri::ontology::oname::graph::ontology_init *v11;
  void *v12;
  uint64_t v13;
  void *__p;
  int v16;
  char v17;
  char v18;
  uint64_t v19;

  v6 = a4;
  v7 = operator new();
  __p = 0;
  v16 = 0;
  v8 = (siri::ontology::oname::graph::ontology_init *)MEMORY[0x220743D50](v7, &__p);
  v19 = v7;
  siri::ontology::oname::graph::ontology_init::common_Decimal(v8);
  siri::ontology::UsoGraph::createEntityNode();
  v9 = objc_retainAutorelease(v6);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v9, "UTF8String"));
  v18 = 1;
  siri::ontology::UsoGraph::createStringNode();
  if (v18 && v17 < 0)
    operator delete(__p);
  v10 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoEntityNode::addUtteranceAlignment();
  siri::ontology::oname::graph::ontology_init::Argument_canonicalString(v10);
  v11 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraphNode::setSuccessor();
  siri::ontology::oname::graph::ontology_init::Argument_entity(v11);
  siri::ontology::UsoGraphNode::setSuccessor();
  objc_msgSend(MEMORY[0x24BE9E330], "convertCppGraph:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x220743D5C](v7);
  MEMORY[0x22074408C](v13, 0x10A0C403D23BABBLL);

  return v12;
}

+ (id)buildIntegerRegexUSOGraphWithIdentifier:(id)a3 withInput:(id)a4 withStartCharIndex:(unsigned int)a5 withEndCharIndex:(unsigned int)a6
{
  id v6;
  uint64_t v7;
  siri::ontology::oname::graph::ontology_init *v8;
  siri::ontology::oname::graph::ontology_init *v9;
  siri::ontology::oname::graph::ontology_init *v10;
  void *v11;
  uint64_t v12;
  uint64_t v14;
  int v15;

  v6 = a4;
  v7 = operator new();
  v14 = 0;
  v15 = 0;
  v8 = (siri::ontology::oname::graph::ontology_init *)MEMORY[0x220743D50](v7, &v14);
  siri::ontology::oname::graph::ontology_init::common_Integer(v8);
  siri::ontology::UsoGraph::createEntityNode();
  objc_msgSend(v6, "integerValue");
  siri::ontology::UsoGraph::createIntNode();
  v9 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoEntityNode::addUtteranceAlignment();
  siri::ontology::oname::graph::ontology_init::Argument_integerValue(v9);
  v10 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraphNode::setSuccessor();
  siri::ontology::oname::graph::ontology_init::Argument_entity(v10);
  siri::ontology::UsoGraphNode::setSuccessor();
  objc_msgSend(MEMORY[0x24BE9E330], "convertCppGraph:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x220743D5C](v7);
  MEMORY[0x22074408C](v12, 0x10A0C403D23BABBLL);

  return v11;
}

+ (id)buildVocUSOGraphForHandsFreeListPosition:(id)a3 withSemantic:(id)a4 withInput:(id)a5 withStartCharIndex:(unsigned int)a6 withEndCharIndex:(unsigned int)a7
{
  id v7;
  uint64_t v8;
  siri::ontology::oname::graph::ontology_init *v9;
  siri::ontology::oname::graph::ontology_init *v10;
  siri::ontology::oname::graph::ontology_init *v11;
  siri::ontology::oname::graph::ontology_init *v12;
  siri::ontology::oname::graph::ontology_init *v13;
  siri::ontology::oname::graph::ontology_init *v14;
  siri::ontology::oname::graph::ontology_init *v15;
  siri::ontology::oname::graph::ontology_init *v16;
  siri::ontology::oname::graph::ontology_init *v17;
  siri::ontology::oname::graph::ontology_init *v18;
  siri::ontology::oname::graph::ontology_init *v19;
  siri::ontology::oname::graph::ontology_init *v20;
  siri::ontology::oname::graph::ontology_init *v21;
  siri::ontology::oname::graph::ontology_init *v22;
  siri::ontology::oname::graph::ontology_init *v23;
  siri::ontology::oname::graph::ontology_init *v24;
  void *v25;
  uint64_t v26;
  uint64_t v28;
  int v29;

  v7 = a4;
  v8 = operator new();
  v28 = 0;
  v29 = 0;
  v9 = (siri::ontology::oname::graph::ontology_init *)MEMORY[0x220743D50](v8, &v28);
  siri::ontology::oname::graph::ontology_init::common_ListPosition(v9);
  siri::ontology::UsoGraph::createEntityNode();
  v10 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v7, "isEqualToString:", CFSTR("current"));
  if ((_DWORD)v10)
  {
    v11 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(v10);
    siri::ontology::oname::graph::ontology_init::common_ListPosition_Current(v11);
    siri::ontology::UsoGraph::createEntityNode();
    siri::ontology::UsoGraphNode::setSuccessor();
  }
  v12 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v7, "isEqualToString:", CFSTR("last"));
  if ((_DWORD)v12)
  {
    v13 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(v12);
    siri::ontology::oname::graph::ontology_init::common_ListPosition_Last(v13);
    siri::ontology::UsoGraph::createEntityNode();
    siri::ontology::UsoGraphNode::setSuccessor();
  }
  v14 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v7, "isEqualToString:", CFSTR("next"));
  if ((_DWORD)v14)
  {
    v15 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(v14);
    siri::ontology::oname::graph::ontology_init::common_ListPosition_Next(v15);
    siri::ontology::UsoGraph::createEntityNode();
    siri::ontology::UsoGraphNode::setSuccessor();
  }
  v16 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v7, "isEqualToString:", CFSTR("previous"));
  if ((_DWORD)v16)
  {
    v17 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(v16);
    siri::ontology::oname::graph::ontology_init::common_ListPosition_Previous(v17);
    siri::ontology::UsoGraph::createEntityNode();
    siri::ontology::UsoGraphNode::setSuccessor();
  }
  v18 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v7, "isEqualToString:", CFSTR("middle"));
  if ((_DWORD)v18)
  {
    v19 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(v18);
    siri::ontology::oname::graph::ontology_init::common_ListPosition_Middle(v19);
    siri::ontology::UsoGraph::createEntityNode();
    siri::ontology::UsoGraphNode::setSuccessor();
  }
  v20 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v7, "isEqualToString:", CFSTR("secondToLast"));
  if ((_DWORD)v20)
  {
    v21 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(v20);
    siri::ontology::oname::graph::ontology_init::common_ListPosition_SecondToLast(v21);
    siri::ontology::UsoGraph::createEntityNode();
    siri::ontology::UsoGraphNode::setSuccessor();
  }
  v22 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v7, "isEqualToString:", CFSTR("thirdToLast"));
  if ((_DWORD)v22)
  {
    v23 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(v22);
    siri::ontology::oname::graph::ontology_init::common_ListPosition_ThirdToLast(v23);
    siri::ontology::UsoGraph::createEntityNode();
    siri::ontology::UsoGraphNode::setSuccessor();
  }
  v24 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoEntityNode::addUtteranceAlignment();
  siri::ontology::oname::graph::ontology_init::Argument_entity(v24);
  siri::ontology::UsoGraphNode::setSuccessor();
  objc_msgSend(MEMORY[0x24BE9E330], "convertCppGraph:", v8);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x220743D5C](v8);
  MEMORY[0x22074408C](v26, 0x10A0C403D23BABBLL);

  return v25;
}

+ (id)buildSmsAttributesUSOGraph:(id)a3 withFractionSemantic:(id)a4 withStartCharIndex:(unsigned int)a5 withEndCharIndex:(unsigned int)a6
{
  id v6;
  uint64_t v7;
  siri::ontology::oname::graph::ontology_init *v8;
  siri::ontology::oname::graph::ontology_init *v9;
  siri::ontology::oname::graph::ontology_init *v10;
  siri::ontology::oname::graph::ontology_init *v11;
  siri::ontology::oname::graph::ontology_init *v12;
  siri::ontology::oname::graph::ontology_init *v13;
  siri::ontology::oname::graph::ontology_init *v14;
  siri::ontology::oname::graph::ontology_init *v15;
  siri::ontology::oname::graph::ontology_init *v16;
  siri::ontology::oname::graph::ontology_init *v17;
  siri::ontology::oname::graph::ontology_init *v18;
  siri::ontology::oname::graph::ontology_init *v19;
  siri::ontology::oname::graph::ontology_init *v20;
  siri::ontology::oname::graph::ontology_init *v21;
  siri::ontology::oname::graph::ontology_init *v22;
  siri::ontology::oname::graph::ontology_init *v23;
  siri::ontology::oname::graph::ontology_init *v24;
  siri::ontology::oname::graph::ontology_init *v25;
  siri::ontology::oname::graph::ontology_init *v26;
  siri::ontology::oname::graph::ontology_init *v27;
  siri::ontology::oname::graph::ontology_init *v28;
  siri::ontology::oname::graph::ontology_init *v29;
  siri::ontology::oname::graph::ontology_init *v30;
  siri::ontology::oname::graph::ontology_init *v31;
  siri::ontology::oname::graph::ontology_init *v32;
  siri::ontology::oname::graph::ontology_init *v33;
  siri::ontology::oname::graph::ontology_init *v34;
  siri::ontology::oname::graph::ontology_init *v35;
  siri::ontology::oname::graph::ontology_init *v36;
  siri::ontology::oname::graph::ontology_init *v37;
  siri::ontology::oname::graph::ontology_init *v38;
  siri::ontology::oname::graph::ontology_init *v39;
  siri::ontology::oname::graph::ontology_init *v40;
  siri::ontology::oname::graph::ontology_init *v41;
  siri::ontology::oname::graph::ontology_init *v42;
  siri::ontology::oname::graph::ontology_init *v43;
  siri::ontology::oname::graph::ontology_init *v44;
  siri::ontology::oname::graph::ontology_init *v45;
  siri::ontology::oname::graph::ontology_init *v46;
  siri::ontology::oname::graph::ontology_init *v47;
  siri::ontology::oname::graph::ontology_init *v48;
  siri::ontology::oname::graph::ontology_init *v49;
  siri::ontology::oname::graph::ontology_init *v50;
  siri::ontology::oname::graph::ontology_init *v51;
  siri::ontology::oname::graph::ontology_init *v52;
  siri::ontology::oname::graph::ontology_init *v53;
  siri::ontology::oname::graph::ontology_init *v54;
  siri::ontology::oname::graph::ontology_init *v55;
  siri::ontology::oname::graph::ontology_init *v56;
  siri::ontology::oname::graph::ontology_init *v57;
  siri::ontology::oname::graph::ontology_init *v58;
  siri::ontology::oname::graph::ontology_init *v59;
  siri::ontology::oname::graph::ontology_init *v60;
  siri::ontology::oname::graph::ontology_init *v61;
  siri::ontology::oname::graph::ontology_init *v62;
  siri::ontology::oname::graph::ontology_init *v63;
  siri::ontology::oname::graph::ontology_init *v64;
  siri::ontology::oname::graph::ontology_init *v65;
  siri::ontology::oname::graph::ontology_init *v66;
  siri::ontology::oname::graph::ontology_init *v67;
  void *v68;
  uint64_t v69;
  uint64_t v71;
  int v72;

  v6 = a4;
  v7 = operator new();
  v71 = 0;
  v72 = 0;
  v8 = (siri::ontology::oname::graph::ontology_init *)MEMORY[0x220743D50](v7, &v71);
  siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute(v8);
  siri::ontology::UsoGraph::createEntityNode();
  v9 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("new"));
  if ((_DWORD)v9)
  {
    v10 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(v9);
    siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesNew(v10);
    siri::ontology::UsoGraph::createEntityNode();
  }
  else
  {
    v11 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("read"));
    if ((_DWORD)v11)
    {
      v12 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(v11);
      siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesRead(v12);
      siri::ontology::UsoGraph::createEntityNode();
    }
    else
    {
      v13 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("unread"));
      if ((_DWORD)v13)
      {
        v14 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(v13);
        siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesUnread(v14);
        siri::ontology::UsoGraph::createEntityNode();
      }
      else
      {
        v15 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("flagged"));
        if ((_DWORD)v15)
        {
          v16 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(v15);
          siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesFlagged(v16);
          siri::ontology::UsoGraph::createEntityNode();
        }
        else
        {
          v17 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("unflagged"));
          if ((_DWORD)v17)
          {
            v18 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(v17);
            siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesUnflagged(v18);
            siri::ontology::UsoGraph::createEntityNode();
          }
          else
          {
            v19 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("saved"));
            if ((_DWORD)v19)
            {
              v20 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(v19);
              siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesSaved(v20);
              siri::ontology::UsoGraph::createEntityNode();
            }
            else
            {
              v21 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("unsaved"));
              if ((_DWORD)v21)
              {
                v22 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(v21);
                siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesUnsaved(v22);
                siri::ontology::UsoGraph::createEntityNode();
              }
              else
              {
                v23 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("sent"));
                if ((_DWORD)v23)
                {
                  v24 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(v23);
                  siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesSent(v24);
                  siri::ontology::UsoGraph::createEntityNode();
                }
                else
                {
                  v25 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("received"));
                  if ((_DWORD)v25)
                  {
                    v26 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(v25);
                    siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesReceived(v26);
                    siri::ontology::UsoGraph::createEntityNode();
                  }
                  else
                  {
                    v27 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("latest"));
                    if ((_DWORD)v27)
                    {
                      v28 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(v27);
                      siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesLatest(v28);
                      siri::ontology::UsoGraph::createEntityNode();
                    }
                    else
                    {
                      v29 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("subject"));
                      if ((_DWORD)v29)
                      {
                        v30 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(v29);
                        siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesSubject(v30);
                        siri::ontology::UsoGraph::createEntityNode();
                      }
                      else
                      {
                        v31 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("attachment"));
                        if ((_DWORD)v31)
                        {
                          v32 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(v31);
                          siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesAttachment(v32);
                          siri::ontology::UsoGraph::createEntityNode();
                        }
                        else
                        {
                          v33 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("invisible_ink_effect"));
                          if ((_DWORD)v33)
                          {
                            v34 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(v33);
                            siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesInvisibleInkEffect(v34);
                            siri::ontology::UsoGraph::createEntityNode();
                          }
                          else
                          {
                            v35 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("slam_effect"));
                            if ((_DWORD)v35)
                            {
                              v36 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(v35);
                              siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesSlamEffect(v36);
                              siri::ontology::UsoGraph::createEntityNode();
                            }
                            else
                            {
                              v37 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("loud_effect"));
                              if ((_DWORD)v37)
                              {
                                v38 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(v37);
                                siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesLoudEffect(v38);
                                siri::ontology::UsoGraph::createEntityNode();
                              }
                              else
                              {
                                v39 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("gentle_effect"));
                                if ((_DWORD)v39)
                                {
                                  v40 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(v39);
                                  siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesGentleEffect(v40);
                                  siri::ontology::UsoGraph::createEntityNode();
                                }
                                else
                                {
                                  v41 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("echo_effect"));
                                  if ((_DWORD)v41)
                                  {
                                    v42 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(v41);
                                    siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesEchoEffect(v42);
                                    siri::ontology::UsoGraph::createEntityNode();
                                  }
                                  else
                                  {
                                    v43 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("spotlight_effect"));
                                    if ((_DWORD)v43)
                                    {
                                      v44 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(v43);
                                      siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesSpotlightEffect(v44);
                                      siri::ontology::UsoGraph::createEntityNode();
                                    }
                                    else
                                    {
                                      v45 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("balloons_effect"));
                                      if ((_DWORD)v45)
                                      {
                                        v46 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(v45);
                                        siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesBalloonsEffect(v46);
                                        siri::ontology::UsoGraph::createEntityNode();
                                      }
                                      else
                                      {
                                        v47 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("confetti_effect"));
                                        if ((_DWORD)v47)
                                        {
                                          v48 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(v47);
                                          siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesConfettiEffect(v48);
                                          siri::ontology::UsoGraph::createEntityNode();
                                        }
                                        else
                                        {
                                          v49 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("love_effect"));
                                          if ((_DWORD)v49)
                                          {
                                            v50 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(v49);
                                            siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesLoveEffect(v50);
                                            siri::ontology::UsoGraph::createEntityNode();
                                          }
                                          else
                                          {
                                            v51 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("lasers_effect"));
                                            if ((_DWORD)v51)
                                            {
                                              v52 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(v51);
                                              siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesLasersEffect(v52);
                                              siri::ontology::UsoGraph::createEntityNode();
                                            }
                                            else
                                            {
                                              v53 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("fireworks_effect"));
                                              if ((_DWORD)v53)
                                              {
                                                v54 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(v53);
                                                siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesFireworksEffect(v54);
                                                siri::ontology::UsoGraph::createEntityNode();
                                              }
                                              else
                                              {
                                                v55 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("shooting_star_effect"));
                                                if ((_DWORD)v55)
                                                {
                                                  v56 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(v55);
                                                  siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesShootingStarEffect(v56);
                                                  siri::ontology::UsoGraph::createEntityNode();
                                                }
                                                else
                                                {
                                                  v57 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("celebration_effect"));
                                                  if ((_DWORD)v57)
                                                  {
                                                    v58 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(v57);
                                                    siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesCelebrationEffect(v58);
                                                    siri::ontology::UsoGraph::createEntityNode();
                                                  }
                                                  else
                                                  {
                                                    v59 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("digital_touch"));
                                                    if ((_DWORD)v59)
                                                    {
                                                      v60 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(v59);
                                                      siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesDigitalTouch(v60);
                                                      siri::ontology::UsoGraph::createEntityNode();
                                                    }
                                                    else
                                                    {
                                                      v61 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("handwritten"));
                                                      if ((_DWORD)v61)
                                                      {
                                                        v62 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(v61);
                                                        siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesHandwritten(v62);
                                                        siri::ontology::UsoGraph::createEntityNode();
                                                      }
                                                      else
                                                      {
                                                        v63 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("music_sharing"));
                                                        if ((_DWORD)v63)
                                                        {
                                                          v64 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(v63);
                                                          siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesMusicSharing(v64);
                                                          siri::ontology::UsoGraph::createEntityNode();
                                                        }
                                                        else
                                                        {
                                                          v65 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("tapback"));
                                                          if (!(_DWORD)v65)
                                                          {
                                                            v68 = 0;
                                                            goto LABEL_60;
                                                          }
                                                          v66 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(v65);
                                                          siri::ontology::oname::graph::ontology_init::appleMessage_MessageAttribute_SmsAttributesTapback(v66);
                                                          siri::ontology::UsoGraph::createEntityNode();
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  v67 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraphNode::setSuccessor();
  siri::ontology::oname::graph::ontology_init::Argument_entity(v67);
  siri::ontology::UsoGraphNode::setSuccessor();
  objc_msgSend(MEMORY[0x24BE9E330], "convertCppGraph:", v7);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_60:
  v69 = MEMORY[0x220743D5C](v7);
  MEMORY[0x22074408C](v69, 0x10A0C403D23BABBLL);

  return v68;
}

+ (id)buildAttachmentTypeUSOGraph:(id)a3 withSemantic:(id)a4 withStartCharIndex:(unsigned int)a5 withEndCharIndex:(unsigned int)a6
{
  id v6;
  uint64_t v7;
  siri::ontology::oname::graph::ontology_init *v8;
  siri::ontology::oname::graph::ontology_init *v9;
  siri::ontology::oname::graph::ontology_init *EntityNode;
  siri::ontology::oname::graph::ontology_init *v11;
  siri::ontology::oname::graph::ontology_init *v12;
  siri::ontology::oname::graph::ontology_init *v13;
  siri::ontology::oname::graph::ontology_init *v14;
  siri::ontology::oname::graph::ontology_init *v15;
  siri::ontology::oname::graph::ontology_init *v16;
  siri::ontology::oname::graph::ontology_init *v17;
  siri::ontology::oname::graph::ontology_init *v18;
  siri::ontology::oname::graph::ontology_init *v19;
  siri::ontology::oname::graph::ontology_init *v20;
  siri::ontology::oname::graph::ontology_init *v21;
  siri::ontology::oname::graph::ontology_init *v22;
  siri::ontology::oname::graph::ontology_init *v23;
  siri::ontology::oname::graph::ontology_init *v24;
  siri::ontology::oname::graph::ontology_init *v25;
  siri::ontology::oname::graph::ontology_init *v26;
  siri::ontology::oname::graph::ontology_init *v27;
  siri::ontology::oname::graph::ontology_init *v28;
  siri::ontology::oname::graph::ontology_init *v29;
  siri::ontology::oname::graph::ontology_init *v30;
  siri::ontology::oname::graph::ontology_init *v31;
  siri::ontology::oname::graph::ontology_init *v32;
  siri::ontology::oname::graph::ontology_init *v33;
  siri::ontology::oname::graph::ontology_init *v34;
  siri::ontology::oname::graph::ontology_init *v35;
  siri::ontology::oname::graph::ontology_init *v36;
  siri::ontology::oname::graph::ontology_init *v37;
  siri::ontology::oname::graph::ontology_init *v38;
  siri::ontology::oname::graph::ontology_init *v39;
  siri::ontology::oname::graph::ontology_init *v40;
  siri::ontology::oname::graph::ontology_init *v41;
  siri::ontology::oname::graph::ontology_init *v42;
  siri::ontology::oname::graph::ontology_init *v43;
  siri::ontology::oname::graph::ontology_init *v44;
  siri::ontology::oname::graph::ontology_init *v45;
  siri::ontology::oname::graph::ontology_init *v46;
  siri::ontology::oname::graph::ontology_init *v47;
  siri::ontology::oname::graph::ontology_init *v48;
  siri::ontology::oname::graph::ontology_init *v49;
  siri::ontology::oname::graph::ontology_init *v50;
  siri::ontology::oname::graph::ontology_init *v51;
  siri::ontology::oname::graph::ontology_init *v52;
  siri::ontology::oname::graph::ontology_init *v53;
  void *v54;
  uint64_t v55;
  uint64_t v57;
  int v58;

  v6 = a4;
  v7 = operator new();
  v57 = 0;
  v58 = 0;
  v8 = (siri::ontology::oname::graph::ontology_init *)MEMORY[0x220743D50](v7, &v57);
  siri::ontology::oname::graph::ontology_init::common_AttachmentType(v8);
  siri::ontology::UsoGraph::createEntityNode();
  v9 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("album"));
  if ((_DWORD)v9)
  {
    siri::ontology::oname::graph::ontology_init::common_AttachmentType_Album(v9);
    EntityNode = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraph::createEntityNode();
    siri::ontology::oname::graph::ontology_init::Argument_definedValue(EntityNode);
    siri::ontology::UsoGraphNode::setSuccessor();
  }
  else
  {
    v11 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("app"));
    if ((_DWORD)v11)
    {
      siri::ontology::oname::graph::ontology_init::common_AttachmentType_App(v11);
      v12 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraph::createEntityNode();
      siri::ontology::oname::graph::ontology_init::Argument_definedValue(v12);
      siri::ontology::UsoGraphNode::setSuccessor();
    }
    else
    {
      v13 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("article"));
      if ((_DWORD)v13)
      {
        siri::ontology::oname::graph::ontology_init::common_AttachmentType_Article(v13);
        v14 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraph::createEntityNode();
        siri::ontology::oname::graph::ontology_init::Argument_definedValue(v14);
        siri::ontology::UsoGraphNode::setSuccessor();
      }
      else
      {
        v15 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("book"));
        if ((_DWORD)v15)
        {
          siri::ontology::oname::graph::ontology_init::common_AttachmentType_Book(v15);
          v16 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraph::createEntityNode();
          siri::ontology::oname::graph::ontology_init::Argument_definedValue(v16);
          siri::ontology::UsoGraphNode::setSuccessor();
        }
        else
        {
          v17 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("episode"));
          if ((_DWORD)v17)
          {
            siri::ontology::oname::graph::ontology_init::common_AttachmentType_Episode(v17);
            v18 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraph::createEntityNode();
            siri::ontology::oname::graph::ontology_init::Argument_definedValue(v18);
            siri::ontology::UsoGraphNode::setSuccessor();
          }
          else
          {
            v19 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("movie"));
            if ((_DWORD)v19)
            {
              siri::ontology::oname::graph::ontology_init::common_AttachmentType_Movie(v19);
              v20 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraph::createEntityNode();
              siri::ontology::oname::graph::ontology_init::Argument_definedValue(v20);
              siri::ontology::UsoGraphNode::setSuccessor();
            }
            else
            {
              v21 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("myLocation"));
              if ((_DWORD)v21)
              {
                siri::ontology::oname::graph::ontology_init::common_AttachmentType_MyLocation(v21);
                v22 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraph::createEntityNode();
                siri::ontology::oname::graph::ontology_init::Argument_definedValue(v22);
                siri::ontology::UsoGraphNode::setSuccessor();
              }
              else
              {
                v23 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("photo"));
                if ((_DWORD)v23)
                {
                  siri::ontology::oname::graph::ontology_init::common_AttachmentType_Photo(v23);
                  v24 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraph::createEntityNode();
                  siri::ontology::oname::graph::ontology_init::Argument_definedValue(v24);
                  siri::ontology::UsoGraphNode::setSuccessor();
                }
                else
                {
                  v25 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("playlist"));
                  if ((_DWORD)v25)
                  {
                    siri::ontology::oname::graph::ontology_init::common_AttachmentType_Playlist(v25);
                    v26 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraph::createEntityNode();
                    siri::ontology::oname::graph::ontology_init::Argument_definedValue(v26);
                    siri::ontology::UsoGraphNode::setSuccessor();
                  }
                  else
                  {
                    v27 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("screenshot"));
                    if ((_DWORD)v27)
                    {
                      siri::ontology::oname::graph::ontology_init::common_AttachmentType_Screenshot(v27);
                      v28 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraph::createEntityNode();
                      siri::ontology::oname::graph::ontology_init::Argument_definedValue(v28);
                      siri::ontology::UsoGraphNode::setSuccessor();
                    }
                    else
                    {
                      v29 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("show"));
                      if ((_DWORD)v29)
                      {
                        siri::ontology::oname::graph::ontology_init::common_AttachmentType_Show(v29);
                        v30 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraph::createEntityNode();
                        siri::ontology::oname::graph::ontology_init::Argument_definedValue(v30);
                        siri::ontology::UsoGraphNode::setSuccessor();
                      }
                      else
                      {
                        v31 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("song"));
                        if ((_DWORD)v31)
                        {
                          siri::ontology::oname::graph::ontology_init::common_AttachmentType_Song(v31);
                          v32 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraph::createEntityNode();
                          siri::ontology::oname::graph::ontology_init::Argument_definedValue(v32);
                          siri::ontology::UsoGraphNode::setSuccessor();
                        }
                        else
                        {
                          v33 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("video"));
                          if ((_DWORD)v33)
                          {
                            siri::ontology::oname::graph::ontology_init::common_AttachmentType_Video(v33);
                            v34 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraph::createEntityNode();
                            siri::ontology::oname::graph::ontology_init::Argument_definedValue(v34);
                            siri::ontology::UsoGraphNode::setSuccessor();
                          }
                          else
                          {
                            v35 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("webpage"));
                            if ((_DWORD)v35)
                            {
                              siri::ontology::oname::graph::ontology_init::common_AttachmentType_Webpage(v35);
                              v36 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraph::createEntityNode();
                              siri::ontology::oname::graph::ontology_init::Argument_definedValue(v36);
                              siri::ontology::UsoGraphNode::setSuccessor();
                            }
                            else
                            {
                              v37 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("audio_message"));
                              if ((_DWORD)v37)
                              {
                                siri::ontology::oname::graph::ontology_init::common_AttachmentType_AudioMessage(v37);
                                v38 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraph::createEntityNode();
                                siri::ontology::oname::graph::ontology_init::Argument_definedValue(v38);
                                siri::ontology::UsoGraphNode::setSuccessor();
                              }
                              else
                              {
                                v39 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("podcast"));
                                if ((_DWORD)v39)
                                {
                                  siri::ontology::oname::graph::ontology_init::common_AttachmentType_Podcast(v39);
                                  v40 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraph::createEntityNode();
                                  siri::ontology::oname::graph::ontology_init::Argument_definedValue(v40);
                                  siri::ontology::UsoGraphNode::setSuccessor();
                                }
                                else
                                {
                                  v41 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("url"));
                                  if ((_DWORD)v41)
                                  {
                                    siri::ontology::oname::graph::ontology_init::common_AttachmentType_URL(v41);
                                    v42 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraph::createEntityNode();
                                    siri::ontology::oname::graph::ontology_init::Argument_definedValue(v42);
                                    siri::ontology::UsoGraphNode::setSuccessor();
                                  }
                                  else
                                  {
                                    v43 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("document"));
                                    if ((_DWORD)v43)
                                    {
                                      siri::ontology::oname::graph::ontology_init::common_AttachmentType_Document(v43);
                                      v44 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraph::createEntityNode();
                                      siri::ontology::oname::graph::ontology_init::Argument_definedValue(v44);
                                      siri::ontology::UsoGraphNode::setSuccessor();
                                    }
                                    else
                                    {
                                      v45 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("location"));
                                      if ((_DWORD)v45)
                                      {
                                        siri::ontology::oname::graph::ontology_init::common_AttachmentType_Location(v45);
                                        v46 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraph::createEntityNode();
                                        siri::ontology::oname::graph::ontology_init::Argument_definedValue(v46);
                                        siri::ontology::UsoGraphNode::setSuccessor();
                                      }
                                      else
                                      {
                                        v47 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("currency_amount"));
                                        if ((_DWORD)v47)
                                        {
                                          siri::ontology::oname::graph::ontology_init::common_AttachmentType_CurrencyAmount(v47);
                                          v48 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraph::createEntityNode();
                                          siri::ontology::oname::graph::ontology_init::Argument_definedValue(v48);
                                          siri::ontology::UsoGraphNode::setSuccessor();
                                        }
                                        else
                                        {
                                          v49 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("email"));
                                          if ((_DWORD)v49)
                                          {
                                            siri::ontology::oname::graph::ontology_init::common_AttachmentType_Email(v49);
                                            v50 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraph::createEntityNode();
                                            siri::ontology::oname::graph::ontology_init::Argument_definedValue(v50);
                                            siri::ontology::UsoGraphNode::setSuccessor();
                                          }
                                          else
                                          {
                                            v51 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("phoneNumber"));
                                            if (!(_DWORD)v51)
                                            {
                                              v54 = 0;
                                              goto LABEL_46;
                                            }
                                            siri::ontology::oname::graph::ontology_init::common_AttachmentType_PhoneNumber(v51);
                                            v52 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraph::createEntityNode();
                                            siri::ontology::oname::graph::ontology_init::Argument_definedValue(v52);
                                            siri::ontology::UsoGraphNode::setSuccessor();
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  v53 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoEntityNode::addUtteranceAlignment();
  siri::ontology::oname::graph::ontology_init::Argument_entity(v53);
  siri::ontology::UsoGraphNode::setSuccessor();
  objc_msgSend(MEMORY[0x24BE9E330], "convertCppGraph:", v7);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_46:
  v55 = MEMORY[0x220743D5C](v7);
  MEMORY[0x22074408C](v55, 0x10A0C403D23BABBLL);

  return v54;
}

+ (id)buildFractionNumberUSOGraphWithIdentifier:(id)a3 withFractionSemantic:(id)a4 withStartCharIndex:(unsigned int)a5 withEndCharIndex:(unsigned int)a6
{
  id v6;
  uint64_t v7;
  siri::ontology::oname::graph::ontology_init *v8;
  siri::ontology::oname::graph::ontology_init *v9;
  siri::ontology::oname::graph::ontology_init *v10;
  siri::ontology::oname::graph::ontology_init *v11;
  void *v12;
  uint64_t v13;
  uint64_t v15;
  int v16;

  v6 = a4;
  v7 = operator new();
  v15 = 0;
  v16 = 0;
  v8 = (siri::ontology::oname::graph::ontology_init *)MEMORY[0x220743D50](v7, &v15);
  siri::ontology::oname::graph::ontology_init::common_MixedFraction(v8);
  siri::ontology::UsoGraph::createEntityNode();
  v9 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("0.1"));
  if (!(_DWORD)v9)
  {
    v9 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("0.111111"));
    if (!(_DWORD)v9)
    {
      v9 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("0.125"));
      if (!(_DWORD)v9)
      {
        v9 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("0.142857"));
        if (!(_DWORD)v9)
        {
          v9 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("0.1666666"));
          if (!(_DWORD)v9)
          {
            v9 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("0.2"));
            if (!(_DWORD)v9)
            {
              v9 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("0.222222"));
              if (!(_DWORD)v9)
              {
                v9 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("0.25"));
                if (!(_DWORD)v9)
                {
                  v9 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("0.28571"));
                  if (!(_DWORD)v9)
                  {
                    v9 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("0.3"));
                    if (!(_DWORD)v9)
                    {
                      v9 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("0.333333"));
                      if (!(_DWORD)v9)
                      {
                        v9 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("0.375"));
                        if (!(_DWORD)v9)
                        {
                          v9 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("0.4"));
                          if (!(_DWORD)v9)
                          {
                            v9 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("0.42857"));
                            if (!(_DWORD)v9)
                            {
                              v9 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("0.444444"));
                              if (!(_DWORD)v9)
                              {
                                v9 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("0.5"));
                                if (!(_DWORD)v9)
                                {
                                  v9 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("0.555555"));
                                  if (!(_DWORD)v9)
                                  {
                                    v9 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("0.57142857"));
                                    if (!(_DWORD)v9)
                                    {
                                      v9 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("0.6"));
                                      if (!(_DWORD)v9)
                                      {
                                        v9 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("0.625"));
                                        if (!(_DWORD)v9)
                                        {
                                          v9 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("0.666666"));
                                          if (!(_DWORD)v9)
                                          {
                                            v9 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("0.7"));
                                            if (!(_DWORD)v9)
                                            {
                                              v9 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("0.7142857"));
                                              if (!(_DWORD)v9)
                                              {
                                                v9 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("0.75"));
                                                if (!(_DWORD)v9)
                                                {
                                                  v9 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("0.777777"));
                                                  if (!(_DWORD)v9)
                                                  {
                                                    v9 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("0.8"));
                                                    if (!(_DWORD)v9)
                                                    {
                                                      v9 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("0.8333333"));
                                                      if (!(_DWORD)v9)
                                                      {
                                                        v9 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("0.85714"));
                                                        if (!(_DWORD)v9)
                                                        {
                                                          v9 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("0.875"));
                                                          if (!(_DWORD)v9)
                                                          {
                                                            v9 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("0.888888"));
                                                            if (!(_DWORD)v9)
                                                            {
                                                              v9 = (siri::ontology::oname::graph::ontology_init *)objc_msgSend(v6, "isEqualToString:", CFSTR("0.9"));
                                                              if (!(_DWORD)v9)
                                                              {
                                                                v12 = 0;
                                                                goto LABEL_48;
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  siri::ontology::oname::graph::ontology_init::Argument_numeratorValue(v9);
  siri::ontology::UsoGraph::createIntNode();
  v10 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraphNode::setSuccessor();
  siri::ontology::oname::graph::ontology_init::Argument_denominatorValue(v10);
  siri::ontology::UsoGraph::createIntNode();
  siri::ontology::UsoGraphNode::setSuccessor();
  v11 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoEntityNode::addUtteranceAlignment();
  siri::ontology::oname::graph::ontology_init::Argument_entity(v11);
  siri::ontology::UsoGraphNode::setSuccessor();
  objc_msgSend(MEMORY[0x24BE9E330], "convertCppGraph:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
LABEL_48:
    v13 = MEMORY[0x220743D5C](v7);
    MEMORY[0x22074408C](v13, 0x10A0C403D23BABBLL);
  }

  return v12;
}

+ (id)buildVocUSOGraphForRegexOrdinal:(unsigned int)a3 withVocLabel:(id)a4 withInput:(id)a5 withStartCharIndex:(unsigned int)a6 withEndCharIndex:(unsigned int)a7
{
  uint64_t v8;
  siri::ontology::oname::graph::ontology_init *v9;
  siri::ontology::oname::graph::ontology_init *EntityNode;
  siri::ontology::oname::graph::ontology_init *v11;
  siri::ontology::oname::graph::ontology_init *v12;
  void *v13;
  uint64_t v14;
  siri::ontology::oname::graph::ontology_init *v16;
  siri::ontology::oname::graph::ontology_init *v17;
  siri::ontology::oname::graph::ontology_init *v18;
  siri::ontology::oname::graph::ontology_init *v19;
  siri::ontology::oname::graph::ontology_init *v20;
  siri::ontology::oname::graph::ontology_init *v21;
  siri::ontology::oname::graph::ontology_init *v22;
  siri::ontology::oname::graph::ontology_init *v23;
  siri::ontology::oname::graph::ontology_init *v24;
  siri::ontology::oname::graph::ontology_init *v25;
  siri::ontology::oname::graph::ontology_init *v26;
  siri::ontology::oname::graph::ontology_init *v27;
  siri::ontology::oname::graph::ontology_init *v28;
  siri::ontology::oname::graph::ontology_init *v29;
  siri::ontology::oname::graph::ontology_init *v30;
  siri::ontology::oname::graph::ontology_init *v31;
  siri::ontology::oname::graph::ontology_init *v32;
  siri::ontology::oname::graph::ontology_init *v33;
  siri::ontology::oname::graph::ontology_init *v34;
  siri::ontology::oname::graph::ontology_init *v35;
  siri::ontology::oname::graph::ontology_init *v36;
  siri::ontology::oname::graph::ontology_init *v37;
  siri::ontology::oname::graph::ontology_init *v38;
  siri::ontology::oname::graph::ontology_init *v39;
  uint64_t v40;
  int v41;

  v8 = operator new();
  v40 = 0;
  v41 = 0;
  v9 = (siri::ontology::oname::graph::ontology_init *)MEMORY[0x220743D50](v8, &v40);
  siri::ontology::oname::graph::ontology_init::common_ListPosition(v9);
  EntityNode = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraph::createEntityNode();
  if (a3 > 0x19)
  {
    siri::ontology::oname::graph::ontology_init::Argument_offsetToReference(EntityNode);
    siri::ontology::UsoGraph::createIntNode();
LABEL_5:
    siri::ontology::UsoGraphNode::setSuccessor();
  }
  else
  {
    switch(a3)
    {
      case 1u:
        v11 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(EntityNode);
        siri::ontology::oname::graph::ontology_init::common_ListPosition_First(v11);
        siri::ontology::UsoGraph::createEntityNode();
        goto LABEL_5;
      case 2u:
        v16 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(EntityNode);
        siri::ontology::oname::graph::ontology_init::common_ListPosition_Second(v16);
        siri::ontology::UsoGraph::createEntityNode();
        goto LABEL_5;
      case 3u:
        v17 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(EntityNode);
        siri::ontology::oname::graph::ontology_init::common_ListPosition_Third(v17);
        siri::ontology::UsoGraph::createEntityNode();
        goto LABEL_5;
      case 4u:
        v18 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(EntityNode);
        siri::ontology::oname::graph::ontology_init::common_ListPosition_Fourth(v18);
        siri::ontology::UsoGraph::createEntityNode();
        goto LABEL_5;
      case 5u:
        v19 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(EntityNode);
        siri::ontology::oname::graph::ontology_init::common_ListPosition_Fifth(v19);
        siri::ontology::UsoGraph::createEntityNode();
        goto LABEL_5;
      case 6u:
        v20 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(EntityNode);
        siri::ontology::oname::graph::ontology_init::common_ListPosition_Sixth(v20);
        siri::ontology::UsoGraph::createEntityNode();
        goto LABEL_5;
      case 7u:
        v21 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(EntityNode);
        siri::ontology::oname::graph::ontology_init::common_ListPosition_Seventh(v21);
        siri::ontology::UsoGraph::createEntityNode();
        goto LABEL_5;
      case 8u:
        v22 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(EntityNode);
        siri::ontology::oname::graph::ontology_init::common_ListPosition_Eighth(v22);
        siri::ontology::UsoGraph::createEntityNode();
        goto LABEL_5;
      case 9u:
        v23 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(EntityNode);
        siri::ontology::oname::graph::ontology_init::common_ListPosition_Ninth(v23);
        siri::ontology::UsoGraph::createEntityNode();
        goto LABEL_5;
      case 0xAu:
        v24 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(EntityNode);
        siri::ontology::oname::graph::ontology_init::common_ListPosition_Tenth(v24);
        siri::ontology::UsoGraph::createEntityNode();
        goto LABEL_5;
      case 0xBu:
        v25 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(EntityNode);
        siri::ontology::oname::graph::ontology_init::common_ListPosition_Eleventh(v25);
        siri::ontology::UsoGraph::createEntityNode();
        goto LABEL_5;
      case 0xCu:
        v26 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(EntityNode);
        siri::ontology::oname::graph::ontology_init::common_ListPosition_Twelfth(v26);
        siri::ontology::UsoGraph::createEntityNode();
        goto LABEL_5;
      case 0xDu:
        v27 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(EntityNode);
        siri::ontology::oname::graph::ontology_init::common_ListPosition_Thirteenth(v27);
        siri::ontology::UsoGraph::createEntityNode();
        goto LABEL_5;
      case 0xEu:
        v28 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(EntityNode);
        siri::ontology::oname::graph::ontology_init::common_ListPosition_Fourteenth(v28);
        siri::ontology::UsoGraph::createEntityNode();
        goto LABEL_5;
      case 0xFu:
        v29 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(EntityNode);
        siri::ontology::oname::graph::ontology_init::common_ListPosition_Fifteenth(v29);
        siri::ontology::UsoGraph::createEntityNode();
        goto LABEL_5;
      case 0x10u:
        v30 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(EntityNode);
        siri::ontology::oname::graph::ontology_init::common_ListPosition_Sixteenth(v30);
        siri::ontology::UsoGraph::createEntityNode();
        goto LABEL_5;
      case 0x11u:
        v31 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(EntityNode);
        siri::ontology::oname::graph::ontology_init::common_ListPosition_Seventeenth(v31);
        siri::ontology::UsoGraph::createEntityNode();
        goto LABEL_5;
      case 0x12u:
        v32 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(EntityNode);
        siri::ontology::oname::graph::ontology_init::common_ListPosition_Eighteenth(v32);
        siri::ontology::UsoGraph::createEntityNode();
        goto LABEL_5;
      case 0x13u:
        v33 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(EntityNode);
        siri::ontology::oname::graph::ontology_init::common_ListPosition_Nineteenth(v33);
        siri::ontology::UsoGraph::createEntityNode();
        goto LABEL_5;
      case 0x14u:
        v34 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(EntityNode);
        siri::ontology::oname::graph::ontology_init::common_ListPosition_Twentieth(v34);
        siri::ontology::UsoGraph::createEntityNode();
        goto LABEL_5;
      case 0x15u:
        v35 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(EntityNode);
        siri::ontology::oname::graph::ontology_init::common_ListPosition_TwentyFirst(v35);
        siri::ontology::UsoGraph::createEntityNode();
        goto LABEL_5;
      case 0x16u:
        v36 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(EntityNode);
        siri::ontology::oname::graph::ontology_init::common_ListPosition_TwentySecond(v36);
        siri::ontology::UsoGraph::createEntityNode();
        goto LABEL_5;
      case 0x17u:
        v37 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(EntityNode);
        siri::ontology::oname::graph::ontology_init::common_ListPosition_TwentyThird(v37);
        siri::ontology::UsoGraph::createEntityNode();
        goto LABEL_5;
      case 0x18u:
        v38 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(EntityNode);
        siri::ontology::oname::graph::ontology_init::common_ListPosition_TwentyFourth(v38);
        siri::ontology::UsoGraph::createEntityNode();
        goto LABEL_5;
      case 0x19u:
        v39 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::oname::graph::ontology_init::Argument_definedValue(EntityNode);
        siri::ontology::oname::graph::ontology_init::common_ListPosition_TwentyFifth(v39);
        siri::ontology::UsoGraph::createEntityNode();
        goto LABEL_5;
      default:
        break;
    }
  }
  v12 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoEntityNode::addUtteranceAlignment();
  siri::ontology::oname::graph::ontology_init::Argument_entity(v12);
  siri::ontology::UsoGraphNode::setSuccessor();
  objc_msgSend(MEMORY[0x24BE9E330], "convertCppGraph:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x220743D5C](v8);
  MEMORY[0x22074408C](v14, 0x10A0C403D23BABBLL);
  return v13;
}

+ (id)buildEmergencyPhoneNumberUSOGraphWithIdentifier:(id)a3 withSemantic:(id)a4 withInput:(id)a5 withStartCharIndex:(unsigned int)a6 withEndCharIndex:(unsigned int)a7 withTokenCount:(unsigned int)a8
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v14;
  uint64_t v15;
  siri::ontology::oname::graph::ontology_init *v16;
  id v17;
  uint64_t v18;
  siri::ontology::oname::graph::ontology_init *v19;
  void *v20;
  uint64_t v21;
  id v23;
  id v24;
  void **v25;
  uint64_t v26;
  void *__p;
  int v28;
  char v29;
  char v30;
  uint64_t v31;

  v8 = *(_QWORD *)&a8;
  v9 = *(_QWORD *)&a7;
  v10 = *(_QWORD *)&a6;
  v24 = a3;
  v14 = a4;
  v23 = a5;
  v15 = operator new();
  __p = 0;
  v28 = 0;
  v16 = (siri::ontology::oname::graph::ontology_init *)MEMORY[0x220743D50](v15, &__p);
  v31 = v15;
  siri::ontology::oname::graph::ontology_init::common_PhoneNumber(v16);
  siri::ontology::UsoGraph::createEntityNode();
  v17 = objc_retainAutorelease(v23);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v17, "UTF8String"));
  v30 = 1;
  siri::ontology::UsoGraph::createStringNode();
  if (v30 && v29 < 0)
    operator delete(__p);
  siri::ontology::UsoEntityNode::addUtteranceAlignment();
  objc_msgSend(a1, "buildIdentifierWithSemantic:withVocLabel:", v14, v24);
  siri::ontology::UsoEntityNode::addIdentifier();
  if (v26)
    std::default_delete<siri::ontology::UsoIdentifier>::operator()[abi:ne180100](v26);
  v18 = +[CDMFeatureFlags isUsoEntitySpanEnabled](CDMFeatureFlags, "isUsoEntitySpanEnabled");
  if ((_DWORD)v18)
  {
    objc_msgSend(a1, "buildEntitySpanWithSemantic:withVocLabel:withStartIndex:withEndIndex:withTokenCount:", v14, v24, v10, v9, v8);
    siri::ontology::UsoEntityNode::addEntitySpan();
    v18 = (uint64_t)v25;
    if (v25)
    {
      siri::ontology::UsoEntitySpan::~UsoEntitySpan(v25);
      v18 = MEMORY[0x22074408C]();
    }
  }
  siri::ontology::oname::graph::ontology_init::Argument_value((siri::ontology::oname::graph::ontology_init *)v18);
  v19 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraphNode::setSuccessor();
  siri::ontology::oname::graph::ontology_init::Argument_entity(v19);
  siri::ontology::UsoGraphNode::setSuccessor();
  objc_msgSend(MEMORY[0x24BE9E330], "convertCppGraph:", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x220743D5C](v15);
  MEMORY[0x22074408C](v21, 0x10A0C403D23BABBLL);

  return v20;
}

+ (id)buildEmergencyPhonePersonUSOGraphWithIdentifier:(id)a3 withSemantic:(id)a4 withInput:(id)a5 withStartCharIndex:(unsigned int)a6 withEndCharIndex:(unsigned int)a7 withTokenCount:(unsigned int)a8
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v14;
  uint64_t v15;
  siri::ontology::oname::graph::ontology_init *v16;
  id v17;
  uint64_t v18;
  siri::ontology::oname::graph::ontology_init *v19;
  void *v20;
  uint64_t v21;
  id v23;
  id v24;
  void **v25;
  uint64_t v26;
  void *__p;
  int v28;
  char v29;
  char v30;
  uint64_t v31;

  v8 = *(_QWORD *)&a8;
  v9 = *(_QWORD *)&a7;
  v10 = *(_QWORD *)&a6;
  v24 = a3;
  v14 = a4;
  v23 = a5;
  v15 = operator new();
  __p = 0;
  v28 = 0;
  v16 = (siri::ontology::oname::graph::ontology_init *)MEMORY[0x220743D50](v15, &__p);
  v31 = v15;
  siri::ontology::oname::graph::ontology_init::common_Person(v16);
  siri::ontology::UsoGraph::createEntityNode();
  v17 = objc_retainAutorelease(v23);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v17, "UTF8String"));
  v30 = 1;
  siri::ontology::UsoGraph::createStringNode();
  if (v30 && v29 < 0)
    operator delete(__p);
  siri::ontology::UsoEntityNode::addUtteranceAlignment();
  objc_msgSend(a1, "buildIdentifierWithSemantic:withVocLabel:", v14, v24);
  siri::ontology::UsoEntityNode::addIdentifier();
  if (v26)
    std::default_delete<siri::ontology::UsoIdentifier>::operator()[abi:ne180100](v26);
  v18 = +[CDMFeatureFlags isUsoEntitySpanEnabled](CDMFeatureFlags, "isUsoEntitySpanEnabled");
  if ((_DWORD)v18)
  {
    objc_msgSend(a1, "buildEntitySpanWithSemantic:withVocLabel:withStartIndex:withEndIndex:withTokenCount:", v14, v24, v10, v9, v8);
    siri::ontology::UsoEntityNode::addEntitySpan();
    v18 = (uint64_t)v25;
    if (v25)
    {
      siri::ontology::UsoEntitySpan::~UsoEntitySpan(v25);
      v18 = MEMORY[0x22074408C]();
    }
  }
  siri::ontology::oname::graph::ontology_init::Argument_name((siri::ontology::oname::graph::ontology_init *)v18);
  v19 = (siri::ontology::oname::graph::ontology_init *)siri::ontology::UsoGraphNode::setSuccessor();
  siri::ontology::oname::graph::ontology_init::Argument_entity(v19);
  siri::ontology::UsoGraphNode::setSuccessor();
  objc_msgSend(MEMORY[0x24BE9E330], "convertCppGraph:", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = MEMORY[0x220743D5C](v15);
  MEMORY[0x22074408C](v21, 0x10A0C403D23BABBLL);

  return v20;
}

+ (unique_ptr<siri::ontology::UsoIdentifier,)buildIdentifierWithSemantic:(id)a3 withVocLabel:(id)a4
{
  uint64_t *v4;
  uint64_t *v6;
  id v7;
  id v8;
  id v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  id v16;
  unique_ptr<siri::ontology::UsoIdentifier, std::default_delete<siri::ontology::UsoIdentifier>> v17;
  __n128 v18;
  char v19;
  char v20;
  __int128 v21;
  char v22;
  std::string v23;
  std::string v24;
  std::string __p;
  char v26;
  std::string v27;
  std::string v28;
  std::string v29;
  char v30;
  std::string v31;
  std::string v32;

  v6 = v4;
  v7 = a3;
  v8 = a4;
  v9 = objc_retainAutorelease(v7);
  v10 = (char *)objc_msgSend(v9, "UTF8String");
  v11 = appName();
  v12 = operator new();
  std::string::basic_string[abi:ne180100]<0>(&v24, v10);
  if (*(char *)(v11 + 23) < 0)
    std::string::__init_copy_ctor_external(&v23, *(const std::string::value_type **)v11, *(_QWORD *)(v11 + 8));
  else
    v23 = *(std::string *)v11;
  LOBYTE(v21) = 0;
  v22 = 0;
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v28, v24.__r_.__value_.__l.__data_, v24.__r_.__value_.__l.__size_);
  else
    v28 = v24;
  v13 = SHIBYTE(v23.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v27, v23.__r_.__value_.__l.__data_, v23.__r_.__value_.__l.__size_);
  else
    v27 = v23;
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&__p, &v21);
  v14 = SHIBYTE(v28.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v32, v28.__r_.__value_.__l.__data_, v28.__r_.__value_.__l.__size_);
  else
    v32 = v28;
  v15 = SHIBYTE(v27.__r_.__value_.__r.__words[2]);
  if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v31, v27.__r_.__value_.__l.__data_, v27.__r_.__value_.__l.__size_);
  else
    v31 = v27;
  std::__optional_copy_base<std::string,false>::__optional_copy_base[abi:ne180100](&v29, (__int128 *)&__p);
  *(std::string *)v12 = v32;
  *(std::string *)(v12 + 24) = v31;
  *(_BYTE *)(v12 + 48) = 0;
  *(_BYTE *)(v12 + 72) = 0;
  if (v30)
  {
    *(std::string *)(v12 + 48) = v29;
    *(_BYTE *)(v12 + 72) = 1;
  }
  *(_QWORD *)(v12 + 112) = 0;
  *(_OWORD *)(v12 + 80) = 0u;
  *(_OWORD *)(v12 + 96) = 0u;
  if (v26 && SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (v15 < 0)
  {
    operator delete(v27.__r_.__value_.__l.__data_);
    if ((v14 & 0x80000000) == 0)
      goto LABEL_23;
  }
  else if ((v14 & 0x80000000) == 0)
  {
    goto LABEL_23;
  }
  operator delete(v28.__r_.__value_.__l.__data_);
LABEL_23:
  *v6 = v12;
  if (v13 < 0)
    operator delete(v23.__r_.__value_.__l.__data_);
  if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v24.__r_.__value_.__l.__data_);
  v16 = objc_retainAutorelease(v8);
  std::string::basic_string[abi:ne180100]<0>(&v18, (char *)objc_msgSend(v16, "UTF8String"));
  v20 = 1;
  std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>(v12 + 48, &v18);
  if (v20 && v19 < 0)
    operator delete((void *)v18.n128_u64[0]);
  *(_BYTE *)(v12 + 100) = 1;
  *(_DWORD *)(v12 + 96) = 2;

  return v17;
}

+ (unique_ptr<siri::ontology::UsoEntitySpan,)buildEntitySpanWithSemantic:(id)a3 withVocLabel:(id)a4 withStartIndex:(unsigned int)a5 withEndIndex:(unsigned int)a6 withTokenCount:(unsigned int)a7
{
  uint64_t *v7;
  uint64_t *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  unique_ptr<siri::ontology::UsoEntitySpan, std::default_delete<siri::ontology::UsoEntitySpan>> v20;
  uint64_t v21;
  char v22;
  void *__p;
  char v24;
  void *v25;
  char v26;
  std::string v27;
  char v28;

  v12 = v7;
  v13 = a3;
  v14 = a4;
  std::make_unique[abi:ne180100]<siri::ontology::UsoEntitySpan>(v12);
  v15 = *v12;
  v16 = appName();
  if (*(char *)(v16 + 23) < 0)
    std::string::__init_copy_ctor_external(&v27, *(const std::string::value_type **)v16, *(_QWORD *)(v16 + 8));
  else
    v27 = *(std::string *)v16;
  v28 = 1;
  std::__optional_storage_base<std::string,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::string,false>>(v15, (__n128 *)&v27);
  if (v28 && SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v27.__r_.__value_.__l.__data_);
  v17 = objc_retainAutorelease(v14);
  std::string::basic_string[abi:ne180100]<0>(&v25, (char *)objc_msgSend(v17, "UTF8String"));
  v18 = objc_retainAutorelease(v13);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v18, "UTF8String"));
  siri::ontology::UsoEntitySpan::addSpanProperty();
  if (v24 < 0)
    operator delete(__p);
  if (v26 < 0)
    operator delete(v25);
  *(_BYTE *)(v15 + 36) = 1;
  *(_DWORD *)(v15 + 32) = 2;
  *(_DWORD *)(v15 + 112) = a5;
  *(_BYTE *)(v15 + 116) = 1;
  *(_DWORD *)(v15 + 120) = a6;
  *(_BYTE *)(v15 + 124) = 1;
  v19 = operator new();
  *(_DWORD *)(v19 + 64) = 0;
  *(_OWORD *)(v19 + 32) = 0u;
  *(_OWORD *)(v19 + 48) = 0u;
  *(_OWORD *)v19 = 0u;
  *(_OWORD *)(v19 + 16) = 0u;
  *(_QWORD *)(v19 + 80) = 0;
  *(_QWORD *)(v19 + 88) = 0;
  *(_QWORD *)(v19 + 72) = 0;
  *(_DWORD *)(v19 + 20) = a7;
  *(_BYTE *)(v19 + 24) = 1;
  v21 = v19;
  v22 = 1;
  std::__optional_storage_base<std::unique_ptr<siri::ontology::MatchInfo>,false>::__assign_from[abi:ne180100]<std::__optional_move_assign_base<std::unique_ptr<siri::ontology::MatchInfo>,false>>(v15 + 72, &v21);
  if (v22 && v21)
    std::default_delete<siri::ontology::MatchInfo>::operator()[abi:ne180100](v21);

  return v20;
}

+ (id)buildRootUSOGraphWithStartCharIndex:(unsigned int)a3 withEndCharIndex:(unsigned int)a4
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v8;
  int v9;

  v4 = operator new();
  v8 = 0;
  v9 = 0;
  MEMORY[0x220743D50](v4, &v8);
  siri::ontology::UsoEntityNode::addUtteranceAlignment();
  objc_msgSend(MEMORY[0x24BE9E330], "convertCppGraph:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x220743D5C](v4);
  MEMORY[0x22074408C](v6, 0x10A0C403D23BABBLL);
  return v5;
}

+ (id)buildVocUSOGraphWithVocLabel:(id)a3 withSemantic:(id)a4 withInput:(id)a5 withStartCharIndex:(unsigned int)a6 withEndCharIndex:(unsigned int)a7
{
  objc_msgSend(a1, "buildVocUSOGraphWithVocLabel:withSemantic:withInput:withStartCharIndex:withEndCharIndex:withTokenCount:", a3, a4, a5, *(_QWORD *)&a6, *(_QWORD *)&a7, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)buildVocUSOGraphWithVocLabel:(id)a3 withSemantic:(id)a4 withInput:(id)a5 withStartCharIndex:(unsigned int)a6 withEndCharIndex:(unsigned int)a7 withTokenCount:(unsigned int)a8
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v14;
  id v15;
  id v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  uint64_t v32;
  int v33;
  const char *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v8 = *(_QWORD *)&a8;
  v9 = *(_QWORD *)&a7;
  v10 = *(_QWORD *)&a6;
  v39 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  objc_msgSend(a1, "settingVocLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "containsObject:", v14);

  if (v18)
  {
    objc_msgSend(a1, "buildSettingUSOGraphWithIdentifier:withSemantic:withInput:withStartCharIndex:withEndCharIndex:withTokenCount:", v14, v15, v16, v10, v9, v8);
    v19 = objc_claimAutoreleasedReturnValue();
LABEL_38:
    v25 = (void *)v19;
    goto LABEL_39;
  }
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("contactType")))
  {
    objc_msgSend(a1, "buildContactTypeUSOGraphWithIdentifier:withSemantic:withInput:withStartCharIndex:withEndCharIndex:withTokenCount:", v14, v15, v16, v10, v9, v8);
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("emailType")))
  {
    objc_msgSend(a1, "buildEmailContactUSOGraphWithIdentifier:withSemantic:withInput:withStartCharIndex:withEndCharIndex:withTokenCount:", v14, v15, v16, v10, v9, v8);
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("phoneType")))
  {
    objc_msgSend(a1, "buildPhoneContactUSOGraphWithIdentifier:withSemantic:withInput:withStartCharIndex:withEndCharIndex:withTokenCount:", v14, v15, v16, v10, v9, v8);
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("answerProduct")))
  {
    objc_msgSend(a1, "buildDeviceCategoryUSOGraphWithIdentifier:withSemantic:withInput:withStartCharIndex:withEndCharIndex:withTokenCount:", v14, v15, v16, v10, v9, v8);
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }
  objc_msgSend(a1, "emergencyPhoneNumberSemantic");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "containsObject:", v15);

  if (v21)
  {
    objc_msgSend(a1, "buildEmergencyPhoneNumberUSOGraphWithIdentifier:withSemantic:withInput:withStartCharIndex:withEndCharIndex:withTokenCount:", v14, v15, v16, v10, v9, v8);
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }
  objc_msgSend(a1, "emergencyPhonePersonSemantic");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "containsObject:", v15);

  if (v23)
  {
    objc_msgSend(a1, "buildEmergencyPhonePersonUSOGraphWithIdentifier:withSemantic:withInput:withStartCharIndex:withEndCharIndex:withTokenCount:", v14, v15, v16, v10, v9, v8);
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("phoneNumber")))
  {
    objc_msgSend(a1, "buildPhoneNumberRegexUSOGraphWithIdentifier:withInput:withStartCharIndex:withEndCharIndex:", v14, v16, v10, v9);
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("emailAddress")))
  {
    objc_msgSend(a1, "buildEmailAddressRegexUSOGraphWithIdentifier:withInput:withStartCharIndex:withEndCharIndex:", v14, v16, v10, v9);
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }
  if (objc_msgSend(v14, "isEqualToString:", CFSTR("appName")))
  {
    objc_msgSend(a1, "buildAppNameUSOGraphWithIdentifier:withSemantic:withInput:withStartCharIndex:withEndCharIndex:withTokenCount:", v14, v15, v16, v10, v9, v8);
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }
  if (!objc_msgSend(v14, "isEqualToString:", CFSTR("integer")))
  {
    if (objc_msgSend(v14, "isEqualToString:", CFSTR("decimal")))
    {
      objc_msgSend(a1, "buildDecimalRegexUSOGraphWithIdentifier:withInput:withStartCharIndex:withEndCharIndex:", v14, v15, v10, v9);
      v19 = objc_claimAutoreleasedReturnValue();
      goto LABEL_38;
    }
    objc_msgSend(a1, "ordinalsSemantic");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "containsObject:", v15);

    if (v28)
    {
      objc_msgSend(a1, "buildVocUSOGraphForRegexOrdinal:withVocLabel:withInput:withStartCharIndex:withEndCharIndex:", objc_msgSend(v15, "intValue"), v14, v16, v10, v9);
      v19 = objc_claimAutoreleasedReturnValue();
      goto LABEL_38;
    }
    if (objc_msgSend(v14, "isEqualToString:", CFSTR("personRelationship")))
    {
      objc_msgSend(a1, "buildPersonRelationshipUSOGraphWithIdentifier:withSemantic:withInput:withStartCharIndex:withEndCharIndex:withTokenCount:", v14, v15, v16, v10, v9, v8);
      v19 = objc_claimAutoreleasedReturnValue();
      goto LABEL_38;
    }
    objc_msgSend(a1, "listPositionSemantic");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "containsObject:", v15);

    if (v30)
    {
      objc_msgSend(a1, "buildVocUSOGraphForHandsFreeListPosition:withSemantic:withInput:withStartCharIndex:withEndCharIndex:", v14, v15, v16, v10, v9);
      v19 = objc_claimAutoreleasedReturnValue();
      goto LABEL_38;
    }
    if (objc_msgSend(CFSTR("fractional"), "isEqualToString:", v14))
    {
      objc_msgSend(a1, "buildFractionNumberUSOGraphWithIdentifier:withFractionSemantic:withStartCharIndex:withEndCharIndex:", v14, v15, v10, v9);
      v32 = objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(CFSTR("smsAttributes"), "isEqualToString:", v14))
    {
      objc_msgSend(a1, "buildSmsAttributesUSOGraph:withFractionSemantic:withStartCharIndex:withEndCharIndex:", v14, v15, v10, v9);
      v32 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(CFSTR("smsSharedEntity"), "isEqualToString:", v14))
        goto LABEL_29;
      objc_msgSend(a1, "buildAttachmentTypeUSOGraph:withSemantic:withStartCharIndex:withEndCharIndex:", v14, v15, v10, v9);
      v32 = objc_claimAutoreleasedReturnValue();
    }
    v25 = (void *)v32;
    if (v32)
      goto LABEL_39;
    goto LABEL_29;
  }
  objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v15);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  if (!objc_msgSend(v24, "scanInt:", &v33)
    || !objc_msgSend(v24, "isAtEnd")
    || (objc_msgSend(a1, "buildIntegerRegexUSOGraphWithIdentifier:withInput:withStartCharIndex:withEndCharIndex:", v14, v15, v10, v9), (v25 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {

LABEL_29:
    CDMOSLoggerForCategory(0);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      v33 = 136315650;
      v34 = "+[CDMVocUsoGraphMapper buildVocUSOGraphWithVocLabel:withSemantic:withInput:withStartCharIndex:withEndCharInd"
            "ex:withTokenCount:]";
      v35 = 2112;
      v36 = v14;
      v37 = 2112;
      v38 = v15;
      _os_log_debug_impl(&dword_21A2A0000, v26, OS_LOG_TYPE_DEBUG, "%s USO not supported for voc label : %@, vocSemantic : %@", (uint8_t *)&v33, 0x20u);
    }

    objc_msgSend(a1, "buildRootUSOGraphWithStartCharIndex:withEndCharIndex:", v10, v9);
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_38;
  }

LABEL_39:
  return v25;
}

void __52__CDMVocUsoGraphMapper_emergencyPhoneNumberSemantic__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("emergencyNumber"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[CDMVocUsoGraphMapper emergencyPhoneNumberSemantic]::value;
  +[CDMVocUsoGraphMapper emergencyPhoneNumberSemantic]::value = v0;

}

void __40__CDMVocUsoGraphMapper_ordinalsSemantic__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("1"), CFSTR("2"), CFSTR("3"), CFSTR("4"), CFSTR("5"), CFSTR("6"), CFSTR("7"), CFSTR("8"), CFSTR("9"), CFSTR("10"), CFSTR("11"), CFSTR("12"), CFSTR("13"), CFSTR("14"), CFSTR("15"), CFSTR("16"), CFSTR("17"),
    CFSTR("18"),
    CFSTR("19"),
    CFSTR("20"),
    CFSTR("21"),
    CFSTR("22"),
    CFSTR("23"),
    CFSTR("24"),
    CFSTR("25"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[CDMVocUsoGraphMapper ordinalsSemantic]::value;
  +[CDMVocUsoGraphMapper ordinalsSemantic]::value = v0;

}

void __44__CDMVocUsoGraphMapper_listPositionSemantic__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("current"), CFSTR("last"), CFSTR("next"), CFSTR("previous"), CFSTR("middle"), CFSTR("secondToLast"), CFSTR("thirdToLast"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[CDMVocUsoGraphMapper listPositionSemantic]::value;
  +[CDMVocUsoGraphMapper listPositionSemantic]::value = v0;

}

void __52__CDMVocUsoGraphMapper_emergencyPhonePersonSemantic__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("emergency contact"), CFSTR("emergency services"), CFSTR("suicide prevention center"), CFSTR("sexual assault crisis center"), CFSTR("poison control center"), CFSTR("domestic violence hotline"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[CDMVocUsoGraphMapper emergencyPhonePersonSemantic]::value;
  +[CDMVocUsoGraphMapper emergencyPhonePersonSemantic]::value = v0;

}

void __39__CDMVocUsoGraphMapper_settingVocLabel__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("BOOLSettingName"), CFSTR("BOOLSettingReference"), CFSTR("BOOLSettingState"), CFSTR("BOOLSettingVerb"), CFSTR("floatSettingState"), CFSTR("floatSettingName"), CFSTR("multiSettingName"), CFSTR("settingGroupName"), CFSTR("settingIdentifier"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[CDMVocUsoGraphMapper settingVocLabel]::value;
  +[CDMVocUsoGraphMapper settingVocLabel]::value = v0;

}

@end
