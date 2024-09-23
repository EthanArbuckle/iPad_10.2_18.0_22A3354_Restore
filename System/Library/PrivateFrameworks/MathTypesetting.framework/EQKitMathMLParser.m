@implementation EQKitMathMLParser

- (EQKitMathMLParser)init
{
  return -[EQKitMathMLParser initWithDocument:node:source:attribution:environment:](self, "initWithDocument:node:source:attribution:environment:", 0, 0, 0, 0, 0);
}

- (EQKitMathMLParser)initWithDocument:(_xmlDoc *)a3 node:(_xmlNode *)RootElement source:(id)a5 attribution:(id)a6 environment:(id)a7
{
  int v13;
  void *v14;
  basic_string<wchar_t, std::char_traits<wchar_t>, std::allocator<wchar_t>> *p_mAttribution;
  EQKitMathMLParser *v16;
  EQKitMathMLParser *v17;
  objc_super v19;
  __int128 __dst;
  uint64_t v21;

  v13 = objc_msgSend(a7, "sourceAttribution");
  if (a6 && v13)
  {
    v14 = (void *)objc_msgSend((id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", objc_msgSend(a6, "bytes"), objc_msgSend(a6, "length"), 4), "dataUsingEncoding:", 2617245952);
    std::wstring::basic_string[abi:ne180100](&__dst, (void *)objc_msgSend(v14, "bytes"), (unint64_t)objc_msgSend(v14, "length") >> 2);
    p_mAttribution = &self->mAttribution;
    if (*((char *)&self->mAttribution.__r_.__value_.var0.__l + 23) < 0)
      operator delete(p_mAttribution->__r_.__value_.var0.__l.__data_);
    *(_OWORD *)p_mAttribution->__r_.__value_.var0.__s.__data_ = __dst;
    *((_QWORD *)&self->mAttribution.__r_.__value_.var0.__l + 2) = v21;
  }
  if (a3 && !RootElement)
    RootElement = xmlDocGetRootElement(a3);
  v19.receiver = self;
  v19.super_class = (Class)EQKitMathMLParser;
  v16 = -[EQKitMathMLParser init](&v19, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->mRootNode = RootElement;
    v16->mNS = xmlSearchNsByHref(a3, RootElement, (const xmlChar *)"http://www.w3.org/1998/Math/MathML");
    v17->mEnvironment = (EQKitEnvironment *)a7;
    v17->mSource = (NSData *)a5;
  }
  return v17;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EQKitMathMLParser;
  -[EQKitMathMLParser dealloc](&v3, sel_dealloc);
}

- (id)sourceAttributionForOffset:(unint64_t)a3 length:(unint64_t)a4
{
  unint64_t size;
  unint64_t v7;
  BOOL v8;
  uint64_t *p_l;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  if (*((char *)&self->mAttribution.__r_.__value_.var0.__l + 23) < 0)
  {
    size = self->mAttribution.__r_.__value_.var0.__l.__size_;
    if (!a4)
      return 0;
  }
  else
  {
    size = *((unsigned __int8 *)&self->mAttribution.__r_.__value_.var0.__l + 23);
    if (!a4)
      return 0;
  }
  v7 = a4 + a3;
  if (size)
    v8 = size >= v7;
  else
    v8 = 0;
  if (!v8)
    return 0;
  p_l = (uint64_t *)&self->mAttribution.__r_.__value_.var0.__l;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16A8]), "initWithCapacity:", size);
  v12 = v11;
  if (a3)
    _appendFromWideString(v11, p_l, 0, a3);
  v13 = objc_msgSend(v12, "length");
  _appendFromWideString(v12, p_l, a3, a4);
  v14 = objc_msgSend(v12, "length");
  if (size > v7)
    _appendFromWideString(v12, p_l, v7, size - v7);
  return -[EQKitSourceAttribution initWithSource:range:]([EQKitSourceAttribution alloc], "initWithSource:range:", v12, v13, v14 - v13);
}

- (void)attributeCollection
{
  return self->mAttributeCollection;
}

- (void)setAttributeCollection:(void *)a3
{
  self->mAttributeCollection = a3;
}

- (id)environment
{
  return self->mEnvironment;
}

- (void)reportError:(int64_t)a3 withNode:(_xmlNode *)a4
{
  id v7;
  const xmlChar *name;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  if (!self->mError)
  {
    v7 = objc_alloc(MEMORY[0x24BDD17C8]);
    name = (const xmlChar *)"";
    if (a4 && a4->name)
      name = a4->name;
    v9 = (void *)objc_msgSend(v7, "initWithUTF8String:", name);
    v10 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    if ((unint64_t)a3 <= 6
      && (v11 = objc_msgSend(v10, "localizedStringForKey:value:table:", off_2511347E0[a3], &stru_25114C368, 0)) != 0)
    {
      v12 = (void *)MEMORY[0x24BDBCE70];
      v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v11, v9);
      v14 = objc_msgSend(v12, "dictionaryWithObjectsAndKeys:", v13, *MEMORY[0x24BDD0FC8], 0);
    }
    else
    {
      v14 = 0;
    }

    self->mError = (NSError *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("EQKitErrorDomain"), a3, v14);
  }
}

- (id)parse
{
  id v3;
  EQKitEquation *v4;

  if (EQKitXMLIsNamedElement(self->mRootNode, self->mNS, "math"))
  {
    v3 = -[EQKitMathMLMath initFromXMLNode:parser:]([EQKitMathMLMath alloc], "initFromXMLNode:parser:", self->mRootNode, self);
    -[EQKitMathMLParser parseAttributesForNode:withXMLNode:](self, "parseAttributesForNode:withXMLNode:", v3, self->mRootNode);
    if (v3 && !self->mError)
      v4 = -[EQKitEquation initWithRoot:source:]([EQKitEquation alloc], "initWithRoot:source:", v3, self->mSource);
    else
      v4 = 0;

  }
  else
  {
    -[EQKitMathMLParser reportError:withNode:](self, "reportError:withNode:", 1, self->mRootNode);
    return 0;
  }
  return v4;
}

- (id)parseChildrenAsArrayFromXMLNode:(_xmlNode *)a3
{
  void *v5;
  _xmlNode *i;
  id v7;

  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  if (a3)
  {
    for (i = a3->children; i; i = i->next)
    {
      if (EQKitXMLIsElement((_BOOL8)i))
      {
        v7 = -[EQKitMathMLParser parseNode:](self, "parseNode:", i);
        if (!v7)
          return 0;
        objc_msgSend(v5, "addObject:", v7);
      }
    }
  }
  return v5;
}

- (id)parseChildrenAsNodeFromXMLNode:(_xmlNode *)a3
{
  id result;
  id v4;
  EQKitMathMLMRow *v5;

  result = -[EQKitMathMLParser parseChildrenAsArrayFromXMLNode:](self, "parseChildrenAsArrayFromXMLNode:", a3);
  if (result)
  {
    v4 = result;
    if (objc_msgSend(result, "count") == 1)
      v5 = (EQKitMathMLMRow *)(id)objc_msgSend(v4, "objectAtIndex:", 0);
    else
      v5 = -[EQKitMathMLMRow initWithChildren:]([EQKitMathMLMRow alloc], "initWithChildren:", v4);
    return v5;
  }
  return result;
}

- (void)parseAttributesForNode:(id)a3 withXMLNode:(_xmlNode *)a4
{
  uint64_t v7;
  _xmlAttr *properties;
  uint64_t v9;
  int *v10;
  xmlNs *ns;
  BOOL v12;
  int v13;
  uint64_t v14;
  int *v15;
  int v16;
  BOOL v17;
  uint64_t *v18;
  uint64_t v19;
  int *v20;
  int v21;
  BOOL v22;
  uint64_t *v23;
  uint64_t v24;
  int *v25;
  int v26;
  BOOL v27;
  uint64_t *v28;
  uint64_t v29;
  int *v30;
  int v31;
  BOOL v32;
  uint64_t *v33;
  uint64_t v34;
  int *v35;
  int v36;
  BOOL v37;
  uint64_t *v38;
  char v39;
  int64_t size;
  std::string *v41;
  _BYTE *v42;
  std::string *v43;
  _BYTE *v44;
  std::string::size_type v45;
  std::string *v46;
  int v47;
  uint64_t v48;
  int *v49;
  int v50;
  BOOL v51;
  uint64_t *v52;
  std::string::size_type v53;
  CGColorRef CGColorFromString;
  CGColor *v55;
  uint64_t **v56;
  _OWORD *v57;
  int v58;
  uint64_t **v59;
  _OWORD *v60;
  void *v61;
  std::string::size_type v62;
  std::string *v63;
  int v64;
  void *v65;
  uint64_t **mAttributeCollection;
  std::string::size_type v67;
  std::string *p_str;
  uint64_t **v69;
  _OWORD *v70;
  uint64_t v71;
  uint64_t **v72;
  uint64_t **v73;
  _OWORD *v74;
  int v75;
  uint64_t **v76;
  _OWORD *v77;
  void *v78;
  uint64_t **v79;
  uint64_t **v80;
  uint64_t **v81;
  uint64_t **v82;
  uint64_t **v83;
  uint64_t **v84;
  uint64_t v85;
  uint64_t **v86;
  uint64_t **v87;
  uint64_t **v88;
  uint64_t **v89;
  uint64_t **v90;
  id v91;
  std::string *v92;
  void *v93;
  uint64_t v94;
  uint64_t **v95;
  std::string::size_type v96;
  std::string *v97;
  int data;
  double v99;
  uint64_t **v100;
  uint64_t **v101;
  uint64_t **v102;
  float v103;
  uint64_t **v104;
  uint64_t **v105;
  _BOOL4 v106;
  uint64_t **v107;
  _OWORD *v108;
  std::string *v109;
  std::string *v110;
  uint64_t **v111;
  _OWORD *v112;
  uint64_t *v113;
  std::string::size_type v114;
  std::string::size_type v115;
  float v116;
  std::string __p[3];
  void *v118;
  char v119;
  uint64_t v120;
  std::string v121;
  std::string __str;
  __int128 v123;
  _OWORD *v124[3];

  v7 = objc_msgSend(a3, "mathMLAttributes");
  properties = a4->properties;
  if (properties)
  {
    v9 = v7;
    v10 = (int *)(v7 + 8);
    v114 = *(_QWORD *)(MEMORY[0x24BEDB7F8] + 24);
    v115 = *MEMORY[0x24BEDB7F8];
    v113 = &v120;
    do
    {
      ns = properties->ns;
      if (ns)
        v12 = ns == a4->ns;
      else
        v12 = 1;
      if (!v12 || !self->mAttributeCollection)
        goto LABEL_116;
      std::string::basic_string[abi:ne180100]<0>(__p, (char *)properties->name);
      v13 = EQKitTypes::Attributes::attributeFromMathMLString((uint64_t *)__p, 0);
      if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p[0].__r_.__value_.__l.__data_);
      if (v13 != 1 || !v9)
        goto LABEL_35;
      v14 = *(_QWORD *)v10;
      if (!*(_QWORD *)v10)
        goto LABEL_116;
      v15 = v10;
      do
      {
        v16 = *(_DWORD *)(v14 + 28);
        v17 = v16 < 2;
        if (v16 >= 2)
          v18 = (uint64_t *)v14;
        else
          v18 = (uint64_t *)(v14 + 8);
        if (!v17)
          v15 = (int *)v14;
        v14 = *v18;
      }
      while (*v18);
      if (v15 != v10 && v15[7] < 3)
      {
        v13 = 2;
      }
      else
      {
        if (v13 != 10 || !v9)
          goto LABEL_48;
LABEL_35:
        v19 = *(_QWORD *)v10;
        if (!*(_QWORD *)v10)
          goto LABEL_116;
        v20 = v10;
        do
        {
          v21 = *(_DWORD *)(v19 + 28);
          v22 = v21 < 32;
          if (v21 >= 32)
            v23 = (uint64_t *)v19;
          else
            v23 = (uint64_t *)(v19 + 8);
          if (!v22)
            v20 = (int *)v19;
          v19 = *v23;
        }
        while (*v23);
        if (v20 != v10 && v20[7] < 33)
        {
          v13 = 32;
        }
        else
        {
          if (v13 != 26 || !v9)
            goto LABEL_61;
LABEL_48:
          v24 = *(_QWORD *)v10;
          if (!*(_QWORD *)v10)
            goto LABEL_116;
          v25 = v10;
          do
          {
            v26 = *(_DWORD *)(v24 + 28);
            v27 = v26 < 29;
            if (v26 >= 29)
              v28 = (uint64_t *)v24;
            else
              v28 = (uint64_t *)(v24 + 8);
            if (!v27)
              v25 = (int *)v24;
            v24 = *v28;
          }
          while (*v28);
          if (v25 != v10 && v25[7] < 30)
          {
            v13 = 29;
          }
          else
          {
            if (v13 != 27 || !v9)
              goto LABEL_74;
LABEL_61:
            v29 = *(_QWORD *)v10;
            if (!*(_QWORD *)v10)
              goto LABEL_116;
            v30 = v10;
            do
            {
              v31 = *(_DWORD *)(v29 + 28);
              v32 = v31 < 30;
              if (v31 >= 30)
                v33 = (uint64_t *)v29;
              else
                v33 = (uint64_t *)(v29 + 8);
              if (!v32)
                v30 = (int *)v29;
              v29 = *v33;
            }
            while (*v33);
            if (v30 != v10 && v30[7] < 31)
            {
              v13 = 30;
            }
            else
            {
              if (v13 != 28 || !v9)
                goto LABEL_76;
LABEL_74:
              v34 = *(_QWORD *)v10;
              if (!*(_QWORD *)v10)
                goto LABEL_116;
              v35 = v10;
              do
              {
                v36 = *(_DWORD *)(v34 + 28);
                v37 = v36 < 31;
                if (v36 >= 31)
                  v38 = (uint64_t *)v34;
                else
                  v38 = (uint64_t *)(v34 + 8);
                if (!v37)
                  v35 = (int *)v34;
                v34 = *v38;
              }
              while (*v38);
              if (v35 != v10 && v35[7] < 32)
              {
                v13 = 31;
              }
              else
              {
LABEL_76:
                if (v13 == 48)
                {
                  EQKitXMLAttributeValueAsString(a4, properties, __p);
                  v39 = HIBYTE(__p[0].__r_.__value_.__r.__words[2]);
                  if ((__p[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                    size = HIBYTE(__p[0].__r_.__value_.__r.__words[2]);
                  else
                    size = __p[0].__r_.__value_.__l.__size_;
                  if ((__p[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                    v41 = __p;
                  else
                    v41 = (std::string *)__p[0].__r_.__value_.__r.__words[0];
                  if (size >= 1)
                  {
                    v42 = (char *)v41 + size;
                    v43 = v41;
                    do
                    {
                      v44 = memchr(v43, 44, size);
                      if (!v44)
                        break;
                      if (*v44 == 44)
                      {
                        if (v44 == v42)
                          break;
                        v45 = v44 - (_BYTE *)v41;
                        if (v45 == -1)
                          break;
                        v46 = std::string::basic_string(&__str, __p, 0, v45, (std::allocator<char> *)&v123);
                        if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
                        {
                          v61 = (void *)__str.__r_.__value_.__r.__words[0];
                          v47 = atoi(__str.__r_.__value_.__l.__data_);
                          operator delete(v61);
                        }
                        else
                        {
                          v47 = atoi((const char *)v46);
                        }
                        v62 = HIBYTE(__p[0].__r_.__value_.__r.__words[2]);
                        if ((__p[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                          v62 = __p[0].__r_.__value_.__l.__size_;
                        v63 = std::string::basic_string(&__str, __p, v45 + 1, v62 - (v45 + 1), (std::allocator<char> *)&v123);
                        if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
                        {
                          v65 = (void *)__str.__r_.__value_.__r.__words[0];
                          v64 = atoi(__str.__r_.__value_.__l.__data_);
                          operator delete(v65);
                        }
                        else
                        {
                          v64 = atoi((const char *)v63);
                        }
                        objc_msgSend(a3, "setSourceAttribution:", -[EQKitMathMLParser sourceAttributionForOffset:length:](self, "sourceAttributionForOffset:length:", v47, v64, v113));
                        if ((*((_BYTE *)&__p[0].__r_.__value_.__s + 23) & 0x80) == 0)
                          goto LABEL_95;
                        goto LABEL_94;
                      }
                      v43 = (std::string *)(v44 + 1);
                      size = v42 - (_BYTE *)v43;
                    }
                    while (v42 - (_BYTE *)v43 >= 1);
                  }
                  if (v39 < 0)
LABEL_94:
                    operator delete(__p[0].__r_.__value_.__l.__data_);
LABEL_95:
                  v13 = 48;
                }
              }
            }
          }
        }
      }
      if (v9)
      {
        v48 = *(_QWORD *)v10;
        if (*(_QWORD *)v10)
        {
          v49 = v10;
          do
          {
            v50 = *(_DWORD *)(v48 + 28);
            v51 = v50 < v13;
            if (v50 >= v13)
              v52 = (uint64_t *)v48;
            else
              v52 = (uint64_t *)(v48 + 8);
            if (!v51)
              v49 = (int *)v48;
            v48 = *v52;
          }
          while (*v52);
          if (v49 != v10 && v13 >= v49[7])
          {
            EQKitXMLAttributeValueAsString(a4, properties, &__str);
            switch(v13)
            {
              case 1:
              case 24:
              case 25:
                v58 = EQKitTypes::Align::alignFromMathMLString((uint64_t *)&__str, 0);
                if (!v58)
                  goto LABEL_114;
                mAttributeCollection = (uint64_t **)self->mAttributeCollection;
                __p[0].__r_.__value_.__r.__words[0] = (std::string::size_type)a3;
                LODWORD(__p[0].__r_.__value_.__r.__words[1]) = v13;
                *(_QWORD *)&v123 = __p;
                v60 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>,std::__map_value_compare<EQKitTypes::Attributes::Enum,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(mAttributeCollection + 16, (uint64_t *)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v123);
                goto LABEL_134;
              case 2:
                v75 = EQKitTypes::VAlign::vAlignFromMathMLString((uint64_t *)&__str, 0);
                if (!v75)
                  goto LABEL_114;
                v76 = (uint64_t **)self->mAttributeCollection;
                __p[0].__r_.__value_.__r.__words[0] = (std::string::size_type)a3;
                LODWORD(__p[0].__r_.__value_.__r.__words[1]) = 2;
                *(_QWORD *)&v123 = __p;
                v77 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>,std::__map_value_compare<EQKitTypes::Attributes::Enum,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v76 + 19, (uint64_t *)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v123);
                goto LABEL_194;
              case 3:
                EQKitTypes::VAlign::vAlignVectorFromMathMLString(&__str, &__p[0].__r_.__value_.__l.__data_);
                v78 = (void *)__p[0].__r_.__value_.__l.__size_;
                if (__p[0].__r_.__value_.__l.__size_ == __p[0].__r_.__value_.__r.__words[0])
                  goto LABEL_205;
                v79 = (uint64_t **)self->mAttributeCollection;
                *(_QWORD *)&v123 = a3;
                DWORD2(v123) = 3;
                EQKit::AttributeCollection::setValueForKey<std::vector<EQKitTypes::VAlign::Enum>>((uint64_t)v79, v79 + 31, (uint64_t)__p, &v123);
                goto LABEL_204;
              case 4:
                EQKitTypes::Align::alignVectorFromMathMLString(&__str, &__p[0].__r_.__value_.__l.__data_);
                v78 = (void *)__p[0].__r_.__value_.__l.__size_;
                if (__p[0].__r_.__value_.__l.__size_ == __p[0].__r_.__value_.__r.__words[0])
                  goto LABEL_205;
                v80 = (uint64_t **)self->mAttributeCollection;
                *(_QWORD *)&v123 = a3;
                DWORD2(v123) = 4;
                EQKit::AttributeCollection::setValueForKey<std::vector<EQKitTypes::VAlign::Enum>>((uint64_t)v80, v80 + 34, (uint64_t)__p, &v123);
                goto LABEL_204;
              case 5:
              case 6:
              case 8:
              case 14:
              case 16:
              case 39:
              case 45:
                v58 = EQKitTypes::Boolean::BOOLeanFromMathMLString((uint64_t *)&__str, 0);
                if (!v58)
                  goto LABEL_114;
                v59 = (uint64_t **)self->mAttributeCollection;
                __p[0].__r_.__value_.__r.__words[0] = (std::string::size_type)a3;
                LODWORD(__p[0].__r_.__value_.__r.__words[1]) = v13;
                *(_QWORD *)&v123 = __p;
                v60 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>,std::__map_value_compare<EQKitTypes::Attributes::Enum,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v59 + 1, (uint64_t *)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v123);
LABEL_134:
                *((_DWORD *)v60 + 12) = v58;
                goto LABEL_114;
              case 7:
                v75 = EQKitTypes::Display::displayFromMathMLString((uint64_t *)&__str, 0);
                if (!v75)
                  goto LABEL_114;
                v81 = (uint64_t **)self->mAttributeCollection;
                __p[0].__r_.__value_.__r.__words[0] = (std::string::size_type)a3;
                LODWORD(__p[0].__r_.__value_.__r.__words[1]) = 7;
                *(_QWORD *)&v123 = __p;
                v77 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>,std::__map_value_compare<EQKitTypes::Attributes::Enum,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v81 + 40, (uint64_t *)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v123);
                goto LABEL_194;
              case 9:
                *(_QWORD *)&v123 = 0;
                BYTE8(v123) = 1;
                if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
                  std::string::__init_copy_ctor_external(&v121, __str.__r_.__value_.__l.__data_, __str.__r_.__value_.__l.__size_);
                else
                  v121 = __str;
                v106 = EQKit::ScriptLevel::fromString(&v121, (uint64_t)&v123);
                if (SHIBYTE(v121.__r_.__value_.__r.__words[2]) < 0)
                  operator delete(v121.__r_.__value_.__l.__data_);
                if (v106)
                {
                  v107 = (uint64_t **)self->mAttributeCollection;
                  __p[0].__r_.__value_.__r.__words[0] = (std::string::size_type)a3;
                  LODWORD(__p[0].__r_.__value_.__r.__words[1]) = 9;
                  v124[0] = __p;
                  v108 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,EQKit::ScriptLevel>,std::__map_value_compare<EQKitTypes::Attributes::Enum,EQKit::ScriptLevel,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<EQKit::ScriptLevel>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v107 + 37, (uint64_t *)__p, (uint64_t)&std::piecewise_construct, v124);
                  *((_QWORD *)v108 + 6) = v123;
                  *((_BYTE *)v108 + 56) = BYTE8(v123);
                }
                goto LABEL_114;
              case 10:
              case 11:
              case 26:
              case 27:
              case 28:
              case 40:
              case 41:
              case 43:
                EQKitLength::EQKitLength(&v123, &__str, 0);
                if ((_DWORD)v123)
                {
                  v56 = (uint64_t **)self->mAttributeCollection;
                  __p[0].__r_.__value_.__r.__words[0] = (std::string::size_type)a3;
                  LODWORD(__p[0].__r_.__value_.__r.__words[1]) = v13;
                  v124[0] = __p;
                  v57 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,EQKitLength>,std::__map_value_compare<EQKitTypes::Attributes::Enum,EQKitLength,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<EQKitLength>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v56 + 4, (uint64_t *)__p, (uint64_t)&std::piecewise_construct, v124);
                  *((_DWORD *)v57 + 12) = v123;
                  *((_QWORD *)v57 + 7) = *((_QWORD *)&v123 + 1);
                }
                else if (v13 == 41)
                {
                  v67 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
                  if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                    v67 = __str.__r_.__value_.__l.__size_;
                  if (v67 == 8)
                  {
                    p_str = &__str;
                    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                      p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
                    if (p_str->__r_.__value_.__r.__words[0] == 0x7974696E69666E69)
                    {
                      v69 = (uint64_t **)self->mAttributeCollection;
                      __p[0].__r_.__value_.__r.__words[0] = (std::string::size_type)a3;
                      LODWORD(__p[0].__r_.__value_.__r.__words[1]) = 41;
                      v124[0] = __p;
                      v70 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,EQKitLength>,std::__map_value_compare<EQKitTypes::Attributes::Enum,EQKitLength,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<EQKitLength>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v69 + 4, (uint64_t *)__p, (uint64_t)&std::piecewise_construct, v124);
                      *((_DWORD *)v70 + 12) = 1;
                      *((_QWORD *)v70 + 7) = 0x7FEFFFFFFFFFFFFFLL;
                    }
                  }
                }
                goto LABEL_114;
              case 12:
              case 13:
              case 18:
              case 19:
                EQKit::AttributeCollection::setValueForKey((uint64_t)self->mAttributeCollection, &__str, v13, (uint64_t)a3);
                goto LABEL_114;
              case 15:
                v75 = EQKit::Config::Operator::formFromMathMLString((uint64_t *)&__str, 0);
                if (!v75)
                  goto LABEL_114;
                v82 = (uint64_t **)self->mAttributeCollection;
                __p[0].__r_.__value_.__r.__words[0] = (std::string::size_type)a3;
                LODWORD(__p[0].__r_.__value_.__r.__words[1]) = 15;
                *(_QWORD *)&v123 = __p;
                v77 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>,std::__map_value_compare<EQKitTypes::Attributes::Enum,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v82 + 43, (uint64_t *)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v123);
                goto LABEL_194;
              case 17:
                v75 = EQKit::Script::variantFromMathMLString((uint64_t *)&__str, 0);
                if (!v75)
                  goto LABEL_114;
                v83 = (uint64_t **)self->mAttributeCollection;
                __p[0].__r_.__value_.__r.__words[0] = (std::string::size_type)a3;
                LODWORD(__p[0].__r_.__value_.__r.__words[1]) = 17;
                *(_QWORD *)&v123 = __p;
                v77 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>,std::__map_value_compare<EQKitTypes::Attributes::Enum,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v83 + 46, (uint64_t *)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v123);
                goto LABEL_194;
              case 20:
                EQKitTypes::Strings::separatorsFromString((uint64_t *)&__str, (uint64_t)__p);
                v84 = (uint64_t **)self->mAttributeCollection;
                *(_QWORD *)&v123 = a3;
                DWORD2(v123) = 20;
                EQKit::AttributeCollection::setValueForKey<std::vector<std::string>>((uint64_t)v84, v84 + 13, (uint64_t)__p, &v123);
                *(_QWORD *)&v123 = __p;
                std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v123);
                goto LABEL_114;
              case 21:
              case 22:
                LOBYTE(v116) = 0;
                v71 = EQKitTypes::Integer::integerFromMathMLString(&__str, (BOOL *)&v116);
                if (LOBYTE(v116))
                {
                  v72 = (uint64_t **)self->mAttributeCollection;
                  __p[0].__r_.__value_.__r.__words[0] = (std::string::size_type)a3;
                  LODWORD(__p[0].__r_.__value_.__r.__words[1]) = v13;
                  *(_QWORD *)&v123 = __p;
                  *((_QWORD *)std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,double>,std::__map_value_compare<EQKitTypes::Attributes::Enum,std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v72 + 49, (uint64_t *)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v123)+ 6) = v71;
                }
                goto LABEL_114;
              case 23:
                LOBYTE(v116) = 0;
                v85 = EQKitTypes::UInteger::uIntegerFromMathMLString(&__str, (BOOL *)&v116);
                if (LOBYTE(v116))
                {
                  v86 = (uint64_t **)self->mAttributeCollection;
                  __p[0].__r_.__value_.__r.__words[0] = (std::string::size_type)a3;
                  LODWORD(__p[0].__r_.__value_.__r.__words[1]) = 23;
                  *(_QWORD *)&v123 = __p;
                  *((_QWORD *)std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,double>,std::__map_value_compare<EQKitTypes::Attributes::Enum,std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v86 + 52, (uint64_t *)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v123)+ 6) = v85;
                }
                goto LABEL_114;
              case 29:
                EQKitPseudoUnitLength::EQKitPseudoUnitLength(__p, &__str, 1);
                if (!LODWORD(__p[0].__r_.__value_.__l.__data_))
                  goto LABEL_114;
                v87 = (uint64_t **)self->mAttributeCollection;
                *(_QWORD *)&v123 = a3;
                DWORD2(v123) = 29;
                v124[0] = &v123;
                v74 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,EQKitPseudoUnitLength>,std::__map_value_compare<EQKitTypes::Attributes::Enum,EQKitPseudoUnitLength,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<EQKitPseudoUnitLength>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v87 + 58, (uint64_t *)&v123, (uint64_t)&std::piecewise_construct, v124);
                goto LABEL_170;
              case 30:
                EQKitPseudoUnitLength::EQKitPseudoUnitLength(__p, &__str, 2);
                if (!LODWORD(__p[0].__r_.__value_.__l.__data_))
                  goto LABEL_114;
                v88 = (uint64_t **)self->mAttributeCollection;
                *(_QWORD *)&v123 = a3;
                DWORD2(v123) = 30;
                v124[0] = &v123;
                v74 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,EQKitPseudoUnitLength>,std::__map_value_compare<EQKitTypes::Attributes::Enum,EQKitPseudoUnitLength,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<EQKitPseudoUnitLength>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v88 + 58, (uint64_t *)&v123, (uint64_t)&std::piecewise_construct, v124);
                goto LABEL_170;
              case 31:
                EQKitPseudoUnitLength::EQKitPseudoUnitLength(__p, &__str, 3);
                if (!LODWORD(__p[0].__r_.__value_.__l.__data_))
                  goto LABEL_114;
                v89 = (uint64_t **)self->mAttributeCollection;
                *(_QWORD *)&v123 = a3;
                DWORD2(v123) = 31;
                v124[0] = &v123;
                v74 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,EQKitPseudoUnitLength>,std::__map_value_compare<EQKitTypes::Attributes::Enum,EQKitPseudoUnitLength,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<EQKitPseudoUnitLength>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v89 + 58, (uint64_t *)&v123, (uint64_t)&std::piecewise_construct, v124);
                goto LABEL_170;
              case 32:
              case 33:
                EQKitPseudoUnitLength::EQKitPseudoUnitLength(__p, &__str, 0);
                if (!LODWORD(__p[0].__r_.__value_.__l.__data_))
                  goto LABEL_114;
                v73 = (uint64_t **)self->mAttributeCollection;
                *(_QWORD *)&v123 = a3;
                DWORD2(v123) = v13;
                v124[0] = &v123;
                v74 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,EQKitPseudoUnitLength>,std::__map_value_compare<EQKitTypes::Attributes::Enum,EQKitPseudoUnitLength,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<EQKitPseudoUnitLength>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v73 + 58, (uint64_t *)&v123, (uint64_t)&std::piecewise_construct, v124);
LABEL_170:
                *((_DWORD *)v74 + 12) = __p[0].__r_.__value_.__l.__data_;
                *(_OWORD *)((char *)v74 + 56) = *(_OWORD *)&__p[0].__r_.__value_.__r.__words[1];
                goto LABEL_114;
              case 34:
                EQKitTypes::Crossout::crossoutVectorFromMathMLString(&__str, &__p[0].__r_.__value_.__l.__data_);
                v78 = (void *)__p[0].__r_.__value_.__l.__size_;
                if (__p[0].__r_.__value_.__l.__size_ == __p[0].__r_.__value_.__r.__words[0])
                  goto LABEL_205;
                v90 = (uint64_t **)self->mAttributeCollection;
                *(_QWORD *)&v123 = a3;
                DWORD2(v123) = 34;
                EQKit::AttributeCollection::setValueForKey<std::vector<EQKitTypes::VAlign::Enum>>((uint64_t)v90, v90 + 25, (uint64_t)__p, &v123);
                goto LABEL_204;
              case 35:
                v91 = objc_alloc(MEMORY[0x24BDD17C8]);
                if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v92 = &__str;
                else
                  v92 = (std::string *)__str.__r_.__value_.__r.__words[0];
                v93 = (void *)objc_msgSend(v91, "initWithUTF8String:", v92, v113);
                if (objc_msgSend(v93, "length") == 1)
                {
                  v94 = objc_msgSend(v93, "characterAtIndex:", 0);
                  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet"), "characterIsMember:", v94) & 1) == 0)
                  {
                    v95 = (uint64_t **)self->mAttributeCollection;
                    __p[0].__r_.__value_.__r.__words[0] = (std::string::size_type)a3;
                    LODWORD(__p[0].__r_.__value_.__r.__words[1]) = 35;
                    *(_QWORD *)&v123 = __p;
                    *((_WORD *)std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,unsigned short>,std::__map_value_compare<EQKitTypes::Attributes::Enum,std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v95 + 61, (uint64_t *)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v123)+ 24) = v94;
                  }
                }

                goto LABEL_114;
              case 36:
                if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                  v96 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
                else
                  v96 = __str.__r_.__value_.__l.__size_;
                switch(v96)
                {
                  case 6uLL:
                    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                      v109 = &__str;
                    else
                      v109 = (std::string *)__str.__r_.__value_.__r.__words[0];
                    if (!memcmp(v109, "medium", 6uLL))
                    {
                      data = 5;
                      v99 = 1.0;
                      goto LABEL_223;
                    }
                    break;
                  case 5uLL:
                    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                      v110 = &__str;
                    else
                      v110 = (std::string *)__str.__r_.__value_.__r.__words[0];
                    if (!memcmp(v110, "thick", 5uLL))
                    {
                      data = 5;
                      v99 = 2.0;
                      goto LABEL_223;
                    }
                    break;
                  case 4uLL:
                    v97 = &__str;
                    if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                      v97 = (std::string *)__str.__r_.__value_.__r.__words[0];
                    if (LODWORD(v97->__r_.__value_.__l.__data_) == 1852401780)
                    {
                      data = 5;
                      v99 = 0.5;
                      goto LABEL_223;
                    }
                    break;
                }
                EQKitLength::EQKitLength(__p, &__str, 5);
                data = (int)__p[0].__r_.__value_.__l.__data_;
                if (!LODWORD(__p[0].__r_.__value_.__l.__data_))
                  goto LABEL_114;
                v99 = *(double *)&__p[0].__r_.__value_.__l.__size_;
LABEL_223:
                v111 = (uint64_t **)self->mAttributeCollection;
                __p[0].__r_.__value_.__r.__words[0] = (std::string::size_type)a3;
                LODWORD(__p[0].__r_.__value_.__r.__words[1]) = 36;
                *(_QWORD *)&v123 = __p;
                v112 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,EQKitLength>,std::__map_value_compare<EQKitTypes::Attributes::Enum,EQKitLength,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<EQKitLength>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v111 + 4, (uint64_t *)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v123);
                *((_DWORD *)v112 + 12) = data;
                *((double *)v112 + 7) = v99;
                break;
              case 37:
                v75 = EQKitTypes::GroupAlign::groupAlignFromMathMLString((uint64_t *)&__str, 0);
                if (!v75)
                  goto LABEL_114;
                v100 = (uint64_t **)self->mAttributeCollection;
                __p[0].__r_.__value_.__r.__words[0] = (std::string::size_type)a3;
                LODWORD(__p[0].__r_.__value_.__r.__words[1]) = 37;
                *(_QWORD *)&v123 = __p;
                v77 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>,std::__map_value_compare<EQKitTypes::Attributes::Enum,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v100 + 22, (uint64_t *)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v123);
                goto LABEL_194;
              case 38:
                v75 = EQKitTypes::Edge::edgeFromMathMLString((uint64_t *)&__str, 0);
                if (!v75)
                  goto LABEL_114;
                v101 = (uint64_t **)self->mAttributeCollection;
                __p[0].__r_.__value_.__r.__words[0] = (std::string::size_type)a3;
                LODWORD(__p[0].__r_.__value_.__r.__words[1]) = 38;
                *(_QWORD *)&v123 = __p;
                v77 = std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>,std::__map_value_compare<EQKitTypes::Attributes::Enum,objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<objc_object  {objcproto15EQKitLayoutNode}*::Align::Enum>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v101 + 64, (uint64_t *)__p, (uint64_t)&std::piecewise_construct, (_OWORD **)&v123);
LABEL_194:
                *((_DWORD *)v77 + 12) = v75;
                goto LABEL_114;
              case 42:
                std::istringstream::basic_istringstream[abi:ne180100](__p, &__str, 8);
                v116 = 0.0;
                MEMORY[0x2426905F0](__p, &v116);
                if ((*(_DWORD *)((_BYTE *)&__p[1].__r_.__value_.__r.__words[1]
                                + *(_QWORD *)(__p[0].__r_.__value_.__r.__words[0] - 24)) & 7) == 2)
                {
                  v102 = (uint64_t **)self->mAttributeCollection;
                  v103 = v116;
                  *(_QWORD *)&v123 = a3;
                  DWORD2(v123) = 42;
                  v124[0] = &v123;
                  *((double *)std::__tree<std::__value_type<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,double>,std::__map_value_compare<EQKitTypes::Attributes::Enum,std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>,std::less<EQKitTypes::Attributes::Enum>,true>,std::allocator<std::pair<objc_object  {objcproto15EQKitLayoutNode}*,EQKitTypes::Attributes::Enum>>>::__emplace_unique_key_args<EQKitTypes::Attributes::Enum,std::piecewise_construct_t const&,std::tuple<EQKitTypes::Attributes::Enum const&>,std::piecewise_construct_t const&<>>(v102 + 55, (uint64_t *)&v123, (uint64_t)&std::piecewise_construct, v124)+ 6) = v103;
                }
                __p[0].__r_.__value_.__r.__words[0] = v115;
                *(std::string::size_type *)((char *)__p[0].__r_.__value_.__r.__words + *(_QWORD *)(v115 - 24)) = v114;
                __p[0].__r_.__value_.__r.__words[2] = MEMORY[0x24BEDB848] + 16;
                if (v119 < 0)
                  operator delete(v118);
                std::streambuf::~streambuf();
                std::istream::~istream();
                MEMORY[0x242690704](v113);
                goto LABEL_114;
              case 44:
                goto LABEL_109;
              case 46:
                memset(__p, 0, 24);
                if (EQKitLength::lengthVectorFromString(&__str, (uint64_t)__p))
                {
                  v104 = (uint64_t **)self->mAttributeCollection;
                  *(_QWORD *)&v123 = a3;
                  DWORD2(v123) = 46;
                  EQKit::AttributeCollection::setValueForKey<std::vector<EQKitLength>>((uint64_t)v104, v104 + 7, (uint64_t *)__p, &v123);
                }
                goto LABEL_204;
              case 47:
                EQKitTypes::Notation::notationVectorFromMathMLString(&__str, &__p[0].__r_.__value_.__l.__data_);
                v78 = (void *)__p[0].__r_.__value_.__l.__size_;
                if (__p[0].__r_.__value_.__l.__size_ == __p[0].__r_.__value_.__r.__words[0])
                  goto LABEL_205;
                v105 = (uint64_t **)self->mAttributeCollection;
                *(_QWORD *)&v123 = a3;
                DWORD2(v123) = 47;
                EQKit::AttributeCollection::setValueForKey<std::vector<EQKitTypes::VAlign::Enum>>((uint64_t)v105, v105 + 28, (uint64_t)__p, &v123);
LABEL_204:
                v78 = (void *)__p[0].__r_.__value_.__r.__words[0];
LABEL_205:
                if (v78)
                {
                  __p[0].__r_.__value_.__l.__size_ = (std::string::size_type)v78;
                  operator delete(v78);
                }
                goto LABEL_114;
              default:
                goto LABEL_114;
            }
            goto LABEL_114;
          }
        }
      }
      if (v13 == 44)
      {
        EQKitXMLAttributeValueAsString(a4, properties, &__str);
LABEL_109:
        v53 = HIBYTE(__str.__r_.__value_.__r.__words[2]);
        if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          v53 = __str.__r_.__value_.__l.__size_;
        if (v53)
        {
          CGColorFromString = EQKitMathMLParserCreateCGColorFromString((uint64_t)&__str);
          v55 = CGColorFromString;
          if (CGColorFromString)
          {
            __p[0].__r_.__value_.__r.__words[0] = (std::string::size_type)CFRetain(CGColorFromString);
            EQKit::AttributeCollection::setValueForKey((uint64_t)self->mAttributeCollection, (CFTypeRef *)&__p[0].__r_.__value_.__l.__data_, 44, (uint64_t)a3);
            CGColorRelease(v55);
            EQKitTypes::CFRetainRelease::~CFRetainRelease((const void **)&__p[0].__r_.__value_.__l.__data_);
          }
        }
LABEL_114:
        if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__str.__r_.__value_.__l.__data_);
      }
LABEL_116:
      properties = properties->next;
    }
    while (properties);
  }
}

- (id)parseChildrenAsTokenContentFromXMLNode:(_xmlNode *)a3
{
  _xmlNode *v3;
  _xmlNode *children;
  id v6;
  id v7;
  std::string *v8;
  std::string::size_type v9;
  EQKitMathMLTokenContent *v10;
  id v11;
  EQKitMathMLTokenContent *v12;
  std::string __p;
  char v15;
  char v16;
  std::string v17;
  id v18;

  v3 = a3;
  v18 = 0;
  memset(&v17, 0, sizeof(v17));
  v16 = 0;
  v15 = 1;
  if (!a3)
    goto LABEL_20;
  children = a3->children;
  if (!children)
  {
LABEL_18:
    LODWORD(v3) = 0;
    goto LABEL_20;
  }
  while (1)
  {
    if (!EQKitXMLIsElement((_BOOL8)children))
    {
      if (xmlNodeIsText(children))
      {
        v16 = 1;
        EQKitXMLTextContentAsString(children, 0, &__p);
        v8 = (__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
           ? &__p
           : (std::string *)__p.__r_.__value_.__r.__words[0];
        v9 = (__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0
           ? HIBYTE(__p.__r_.__value_.__r.__words[2])
           : __p.__r_.__value_.__l.__size_;
        std::string::append(&v17, (const std::string::value_type *)v8, v9);
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
      }
      goto LABEL_17;
    }
    _contentAppendStringIfNeeded(&v18, &v17, &v16, &v15, 0);
    -[EQKitMathMLParser pushState:](self, "pushState:", 1);
    v6 = -[EQKitMathMLParser parseNode:](self, "parseNode:", v3);
    -[EQKitMathMLParser popState](self, "popState");
    if (!v6)
      break;
    v7 = v18;
    if (!v18)
    {
      v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v18 = v7;
    }
    objc_msgSend(v7, "addObject:", v6);

LABEL_17:
    children = children->next;
    if (!children)
      goto LABEL_18;
  }
  LODWORD(v3) = 1;
LABEL_20:
  _contentAppendStringIfNeeded(&v18, &v17, &v16, &v15, 1);
  if ((_DWORD)v3)
  {
    v10 = 0;
    v11 = v18;
  }
  else
  {
    v12 = [EQKitMathMLTokenContent alloc];
    v11 = v18;
    v10 = -[EQKitMathMLTokenContent initWithChildren:](v12, "initWithChildren:", v18);
  }

  if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v17.__r_.__value_.__l.__data_);
  return v10;
}

- (id)parseNode:(_xmlNode *)a3
{
  char *name;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __objc2_class **v10;
  id v11;
  void *__p[2];
  char v13;

  if (!EQKitXMLIsNsElement((_BOOL8)a3, self->mNS))
    goto LABEL_10;
  name = (char *)a3->name;
  if (!name)
    goto LABEL_10;
  std::string::basic_string[abi:ne180100]<0>(__p, name);
  v6 = EQKitMathMLElement::fromString((uint64_t *)__p);
  if (v13 < 0)
    operator delete(__p[0]);
  if (!-[EQKitMathMLParser isElement:allowedInState:](self, "isElement:allowedInState:", v6, -[EQKitMathMLParser state](self, "state")))
  {
    v7 = 3;
    goto LABEL_9;
  }
  if ((v6 - 40) < 0x88)
  {
    v7 = 6;
LABEL_9:
    -[EQKitMathMLParser reportError:withNode:](self, "reportError:withNode:", v7, a3);
    goto LABEL_10;
  }
  v10 = off_2511291F0;
  switch((int)v6)
  {
    case 1:
      break;
    case 2:
      v10 = off_251129208;
      break;
    case 3:
      v10 = off_251129210;
      break;
    case 4:
      v10 = off_251129238;
      break;
    case 5:
      v10 = &off_2511292E0;
      break;
    case 6:
      v10 = off_2511291B8;
      break;
    case 7:
      v10 = off_2511291E8;
      break;
    case 8:
      v10 = off_251129228;
      break;
    case 9:
      v10 = off_251129290;
      break;
    case 10:
      v10 = off_2511292A0;
      break;
    case 11:
      v10 = off_251129298;
      break;
    case 12:
      v10 = off_2511291E0;
      break;
    case 13:
      v10 = off_251129288;
      break;
    case 14:
      v10 = off_2511292C8;
      break;
    case 15:
      v10 = off_251129218;
      break;
    case 16:
      v10 = off_2511292D0;
      break;
    case 17:
      v10 = off_251129250;
      break;
    case 18:
      v10 = off_251129268;
      break;
    case 19:
      v10 = off_251129278;
      break;
    case 20:
      v10 = off_251129270;
      break;
    case 21:
      v10 = off_251129258;
      break;
    case 22:
      v10 = off_251129260;
      break;
    case 23:
      v10 = off_251129200;
      break;
    case 24:
      v10 = off_2511292A8;
      break;
    case 25:
      v10 = off_2511292C0;
      break;
    case 26:
      v10 = off_2511291F8;
      break;
    case 27:
      v10 = off_2511292B0;
      break;
    case 28:
      v10 = off_251129230;
      break;
    case 29:
      v10 = off_251129248;
      break;
    case 30:
      v10 = off_2511292D8;
      break;
    case 32:
      v10 = off_251129280;
      break;
    case 33:
      v10 = off_2511292B8;
      break;
    case 34:
      v10 = off_2511291C0;
      break;
    case 35:
      v10 = off_251129240;
      break;
    case 36:
      v10 = off_2511291D8;
      break;
    case 37:
      v10 = off_251129220;
      break;
    case 38:
      v10 = off_2511291C8;
      break;
    case 39:
      v10 = off_2511291D0;
      break;
    default:
      v7 = 2;
      goto LABEL_9;
  }
  v11 = (id)objc_msgSend(objc_alloc(*v10), "initFromXMLNode:parser:", a3, self);
  if (v11)
  {
    v8 = v11;
    -[EQKitMathMLParser parseAttributesForNode:withXMLNode:](self, "parseAttributesForNode:withXMLNode:", v11, a3);
    return v8;
  }
LABEL_10:
  -[EQKitMathMLParser reportError:withNode:](self, "reportError:withNode:", 4, a3);
  return 0;
}

- (void)pushState:(int)a3
{
  int v3;

  v3 = a3;
  std::deque<EQKitMathMLParserState>::push_back(&self->mState.c.__map_.__first_, &v3);
}

- (void)popState
{
  unint64_t value;

  value = self->mState.c.__size_.__value_;
  if (value)
  {
    self->mState.c.__size_.__value_ = value - 1;
    std::deque<EQKitMathMLParserState>::__maybe_remove_back_spare[abi:ne180100](&self->mState.c.__map_.__first_, 1);
  }
}

- (int)state
{
  unint64_t value;

  value = self->mState.c.__size_.__value_;
  if (value)
    return (*(int **)((char *)self->mState.c.__map_.__begin_
                    + (((value + self->mState.c.__start_ - 1) >> 7) & 0x1FFFFFFFFFFFFF8)))[(value
                                                                                            + self->mState.c.__start_
                                                                                            - 1) & 0x3FF];
  else
    return 0;
}

- (BOOL)isElement:(int)a3 allowedInState:(int)a4
{
  BOOL v4;
  BOOL result;
  BOOL v6;

  switch(a4)
  {
    case 0:
      v4 = __CFADD__(a3 - 28, 3);
      return !v4;
    case 1:
      v6 = a3 == 31 || a3 == 39;
      goto LABEL_12;
    case 2:
      v4 = (a3 - 25) >= 2;
      return !v4;
    case 3:
      v6 = a3 == 27;
LABEL_12:
      result = v6;
      break;
    default:
      result = 1;
      break;
  }
  return result;
}

- (_xmlNs)ns
{
  return self->mNS;
}

- (NSError)error
{
  return self->mError;
}

- (void).cxx_destruct
{
  if (*((char *)&self->mAttribution.__r_.__value_.var0.__l + 23) < 0)
    operator delete(self->mAttribution.__r_.__value_.var0.__l.__data_);
  std::deque<EQKitMathMLParserState>::~deque[abi:ne180100](&self->mState.c.__map_.__first_);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 4) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 7) = 0uLL;
  *((_QWORD *)self + 13) = 0;
  return self;
}

@end
