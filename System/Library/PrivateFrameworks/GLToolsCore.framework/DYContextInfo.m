@implementation DYContextInfo

- (DYContextInfo)init
{
  -[DYContextInfo doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (DYContextInfo)initWithIdentifier:(unint64_t)a3 sharegroupIdentifier:(unint64_t)a4 renderers:(id)a5 currentRendererIndex:(unsigned int)a6 api:(int)a7
{
  DYContextInfo *v13;
  DYContextInfo *v14;
  objc_super v16;

  if (objc_msgSend(a5, "count") <= (unint64_t)a6)
    __assert_rtn("-[DYContextInfo initWithIdentifier:sharegroupIdentifier:renderers:currentRendererIndex:api:]", (const char *)&unk_23C65FE76, 0, "currentRendererIndex < [renderers count]");
  v16.receiver = self;
  v16.super_class = (Class)DYContextInfo;
  v13 = -[DYContextInfo init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_identifier = a3;
    v13->_sharegroupIdentifier = a4;
    v13->_renderers = (NSArray *)objc_msgSend(a5, "copy");
    v14->_currentRendererIndex = a6;
    v14->_api = a7;
  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DYContextInfo)initWithCoder:(id)a3
{
  void *v5;
  uint64_t v6;

  if (self)
  {
    self->_identifier = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("identifier"));
    self->_sharegroupIdentifier = objc_msgSend(a3, "decodeInt64ForKey:", CFSTR("sharegroupIdentifier"));
    v5 = (void *)MEMORY[0x24BDBCF20];
    v6 = objc_opt_class();
    self->_renderers = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), CFSTR("renderers"));
    self->_currentRendererIndex = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("currentRendererIndex"));
    self->_api = objc_msgSend(a3, "decodeInt32ForKey:", CFSTR("api"));
    self->_debugLabel = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("debugLabel"));
  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt64:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(a3, "encodeInt64:forKey:", self->_sharegroupIdentifier, CFSTR("sharegroupIdentifier"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_renderers, CFSTR("renderers"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_currentRendererIndex, CFSTR("currentRendererIndex"));
  objc_msgSend(a3, "encodeInt32:forKey:", self->_api, CFSTR("api"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_debugLabel, CFSTR("debugLabel"));
}

- (NSString)debugDescription
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYContextInfo;
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@, %@\n\t_currentRendererIndex = %d\n\t_renderers = %@"), -[DYContextInfo debugDescription](&v3, sel_debugDescription), -[DYContextInfo description](self, "description"), self->_currentRendererIndex, -[NSArray debugDescription](self->_renderers, "debugDescription"));
}

- (NSString)description
{
  uint64_t api;
  char *v3;
  objc_super v5;

  api = self->_api;
  if (api > 4)
    v3 = 0;
  else
    v3 = off_250D4F338[api];
  v5.receiver = self;
  v5.super_class = (Class)DYContextInfo;
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ identifier=%llu, sharegroup identifier=%llu, api=%@, debug label=%@"), -[DYContextInfo description](&v5, sel_description), self->_identifier, self->_sharegroupIdentifier, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v3), self->_debugLabel);
}

- (NSString)descriptionForBugReport
{
  NSArray *renderers;
  unint64_t currentRendererIndex;

  renderers = self->_renderers;
  if (renderers
    && (currentRendererIndex = self->_currentRendererIndex, -[NSArray count](renderers, "count") > currentRendererIndex))
  {
    return (NSString *)objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_renderers, "objectAtIndexedSubscript:", self->_currentRendererIndex), "descriptionForBugReport");
  }
  else
  {
    return -[DYContextInfo description](self, "description");
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DYContextInfo;
  -[DYContextInfo dealloc](&v3, sel_dealloc);
}

- (void)determineTextureUnitLimitsForRendererAtIndex:(unsigned int)a3 limits:(id *)a4
{
  void *v6;
  void *v7;
  int api;
  unsigned int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;

  v6 = (void *)objc_msgSend(-[NSArray objectAtIndex:](self->_renderers, "objectAtIndex:", a3), "limits");
  v7 = v6;
  api = self->_api;
  if ((api - 2) >= 3)
  {
    if (api)
    {
      if (api != 1)
        return;
      v12 = objc_msgSend((id)objc_msgSend(v6, "objectForKey:", CFSTR("GL_MAX_TEXTURE_UNITS")), "unsignedIntValue");
      a4->var0 = v12;
      a4->var2 = v12;
      a4->var3 = v12;
      v10 = 34018;
      v11 = 34018;
    }
    else
    {
      a4->var0 = objc_msgSend((id)objc_msgSend(v6, "objectForKey:", CFSTR("GL_MAX_TEXTURE_COORDS")), "unsignedIntValue");
      a4->var2 = objc_msgSend((id)objc_msgSend(v7, "objectForKey:", CFSTR("GL_MAX_TEXTURE_UNITS")), "unsignedIntValue");
      a4->var3 = objc_msgSend((id)objc_msgSend(v7, "objectForKey:", CFSTR("GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS")), "unsignedIntValue");
      v11 = 35661;
      v10 = 34929;
    }
  }
  else
  {
    v9 = objc_msgSend((id)objc_msgSend(v6, "objectForKey:", CFSTR("GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS")), "unsignedIntValue");
    a4->var0 = 0;
    a4->var2 = 0;
    a4->var3 = v9;
    v10 = 35661;
    v11 = 35661;
  }
  a4->var1 = v10;
  a4->var4 = v11;
}

- (BOOL)supportsCapabilitiesOfGraphicsAPI:(id)a3
{
  int api;
  NSArray *renderers;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (api = self->_api, api == objc_msgSend(a3, "api")))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    renderers = self->_renderers;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](renderers, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(renderers);
          v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          v18 = 0u;
          v19 = 0u;
          v20 = 0u;
          v21 = 0u;
          v12 = (void *)objc_msgSend(a3, "renderers", 0);
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v19;
            while (2)
            {
              v16 = 0;
              do
              {
                if (*(_QWORD *)v19 != v15)
                  objc_enumerationMutation(v12);
                if ((objc_msgSend(v11, "supportsCapabilitiesOfRenderer:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v16)) & 1) != 0)
                {
                  LOBYTE(v7) = 1;
                  return v7;
                }
                ++v16;
              }
              while (v14 != v16);
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
              if (v14)
                continue;
              break;
            }
          }
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](renderers, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        LOBYTE(v7) = 0;
      }
      while (v8);
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (int)valueForLimit:(id)a3
{
  void *v4;
  int result;

  v4 = (void *)objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndex:](self->_renderers, "objectAtIndex:", self->_currentRendererIndex), "limits"), "objectForKey:", a3);
  if (v4)
    return objc_msgSend(v4, "intValue");
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("GL_MAX_COLOR_ATTACHMENTS")) & 1) != 0)
    return 1;
  result = objc_msgSend(a3, "isEqualToString:", CFSTR("GL_MAX_DRAW_BUFFERS"));
  if (result)
    return 1;
  return result;
}

- (void)enumerateBufferTargets:(id)a3
{
  uint64_t v5;
  unsigned int *v6;
  unsigned int *v7;
  char *v8;
  unsigned int *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  unsigned int *v14;
  char *v15;
  unsigned int v16;
  int api;
  char *v18;
  char *v19;
  char *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  char *v26;
  int v27;
  char *v28;
  char *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  char *v34;
  char *v35;
  int v36;
  char *v37;
  char *v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char *v43;
  char *v44;
  int v45;
  char *v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  unint64_t v50;
  char *v51;
  char *v52;
  char *v53;
  int v54;
  char *v55;
  char *v56;
  char *v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char *v62;
  char *v63;
  int v64;
  char *v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  unint64_t v69;
  char *v70;
  char *v71;
  char *v72;
  int v73;
  char *v74;
  char *v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  unint64_t v79;
  char *v80;
  char *v81;
  char *v82;
  int v83;
  char *v84;
  char *__p;
  char *v86;
  unint64_t v87;

  v87 = 0;
  v6 = (unsigned int *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&v87, 1uLL);
  *v6 = 34962;
  v7 = v6 + 1;
  __p = (char *)v6;
  v87 = (unint64_t)&v6[v5];
  if ((unint64_t)(v6 + 1) >= v87)
  {
    v9 = v6;
    v10 = 2;
    v11 = 4 * v5;
    if ((unint64_t)((4 * v5) >> 1) > 2)
      v10 = v11 >> 1;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFFCLL)
      v12 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    if (v12)
    {
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&v87, v12);
      v9 = v6;
      v7 = v6 + 1;
    }
    else
    {
      v13 = 0;
    }
    v14 = (unsigned int *)(v13 + 4);
    v15 = &v13[4 * v12];
    *v14 = 34963;
    v8 = (char *)(v14 + 1);
    while (v7 != v9)
    {
      v16 = *--v7;
      *--v14 = v16;
    }
    __p = (char *)v14;
    v87 = (unint64_t)v15;
    if (v9)
      operator delete(v9);
  }
  else
  {
    v6[1] = 34963;
    v8 = (char *)(v6 + 2);
  }
  v86 = v8;
  api = self->_api;
  if ((api - 1) >= 2)
  {
    if ((api - 3) < 2)
    {
      v18 = (char *)v87;
      if ((unint64_t)v8 >= v87)
      {
        v20 = __p;
        v21 = (v8 - __p) >> 2;
        v22 = v21 + 1;
        if ((unint64_t)(v21 + 1) >> 62)
          std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
        v23 = v87 - (_QWORD)__p;
        if ((uint64_t)(v87 - (_QWORD)__p) >> 1 > v22)
          v22 = v23 >> 1;
        if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFFCLL)
          v24 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v24 = v22;
        if (v24)
        {
          v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&v87, v24);
          v20 = __p;
        }
        else
        {
          v25 = 0;
        }
        v26 = &v25[4 * v21];
        v18 = &v25[4 * v24];
        *(_DWORD *)v26 = 36662;
        v19 = v26 + 4;
        while (v8 != v20)
        {
          v27 = *((_DWORD *)v8 - 1);
          v8 -= 4;
          *((_DWORD *)v26 - 1) = v27;
          v26 -= 4;
        }
        __p = v26;
        v87 = (unint64_t)v18;
        if (v20)
        {
          operator delete(v20);
          v18 = (char *)v87;
        }
      }
      else
      {
        *(_DWORD *)v8 = 36662;
        v19 = v8 + 4;
      }
      if (v19 >= v18)
      {
        v29 = __p;
        v30 = (v19 - __p) >> 2;
        v31 = v30 + 1;
        if ((unint64_t)(v30 + 1) >> 62)
          std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
        v32 = v18 - __p;
        if (v32 >> 1 > v31)
          v31 = v32 >> 1;
        if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFFCLL)
          v33 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v33 = v31;
        if (v33)
        {
          v34 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&v87, v33);
          v29 = __p;
        }
        else
        {
          v34 = 0;
        }
        v35 = &v34[4 * v30];
        v18 = &v34[4 * v33];
        *(_DWORD *)v35 = 36663;
        v28 = v35 + 4;
        while (v19 != v29)
        {
          v36 = *((_DWORD *)v19 - 1);
          v19 -= 4;
          *((_DWORD *)v35 - 1) = v36;
          v35 -= 4;
        }
        __p = v35;
        v87 = (unint64_t)v18;
        if (v29)
        {
          operator delete(v29);
          v18 = (char *)v87;
        }
      }
      else
      {
        *(_DWORD *)v19 = 36663;
        v28 = v19 + 4;
      }
      if (v28 >= v18)
      {
        v38 = __p;
        v39 = (v28 - __p) >> 2;
        v40 = v39 + 1;
        if ((unint64_t)(v39 + 1) >> 62)
          std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
        v41 = v18 - __p;
        if (v41 >> 1 > v40)
          v40 = v41 >> 1;
        if ((unint64_t)v41 >= 0x7FFFFFFFFFFFFFFCLL)
          v42 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v42 = v40;
        if (v42)
        {
          v43 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&v87, v42);
          v38 = __p;
        }
        else
        {
          v43 = 0;
        }
        v44 = &v43[4 * v39];
        v18 = &v43[4 * v42];
        *(_DWORD *)v44 = 35982;
        v37 = v44 + 4;
        while (v28 != v38)
        {
          v45 = *((_DWORD *)v28 - 1);
          v28 -= 4;
          *((_DWORD *)v44 - 1) = v45;
          v44 -= 4;
        }
        __p = v44;
        v87 = (unint64_t)v18;
        if (v38)
        {
          operator delete(v38);
          v18 = (char *)v87;
        }
      }
      else
      {
        *(_DWORD *)v28 = 35982;
        v37 = v28 + 4;
      }
      if (v37 >= v18)
      {
        v46 = __p;
        v47 = (v37 - __p) >> 2;
        v48 = v47 + 1;
        if ((unint64_t)(v47 + 1) >> 62)
          std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
        v49 = v18 - __p;
        if (v49 >> 1 > v48)
          v48 = v49 >> 1;
        if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFFCLL)
          v50 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v50 = v48;
        if (v50)
        {
          v51 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&v87, v50);
          v46 = __p;
        }
        else
        {
          v51 = 0;
        }
        v52 = &v51[4 * v47];
        v53 = &v51[4 * v50];
        *(_DWORD *)v52 = 35345;
        v8 = v52 + 4;
        while (v37 != v46)
        {
          v54 = *((_DWORD *)v37 - 1);
          v37 -= 4;
          *((_DWORD *)v52 - 1) = v54;
          v52 -= 4;
        }
        __p = v52;
        v87 = (unint64_t)v53;
        if (v46)
          operator delete(v46);
      }
      else
      {
        *(_DWORD *)v37 = 35345;
        v8 = v37 + 4;
      }
      v86 = v8;
    }
    v55 = (char *)v87;
    if ((unint64_t)v8 >= v87)
    {
      v57 = __p;
      v58 = (v8 - __p) >> 2;
      v59 = v58 + 1;
      if ((unint64_t)(v58 + 1) >> 62)
        std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
      v60 = v87 - (_QWORD)__p;
      if ((uint64_t)(v87 - (_QWORD)__p) >> 1 > v59)
        v59 = v60 >> 1;
      if ((unint64_t)v60 >= 0x7FFFFFFFFFFFFFFCLL)
        v61 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v61 = v59;
      if (v61)
      {
        v62 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&v87, v61);
        v57 = __p;
        v8 = v86;
      }
      else
      {
        v62 = 0;
      }
      v63 = &v62[4 * v58];
      v55 = &v62[4 * v61];
      *(_DWORD *)v63 = 35051;
      v56 = v63 + 4;
      while (v8 != v57)
      {
        v64 = *((_DWORD *)v8 - 1);
        v8 -= 4;
        *((_DWORD *)v63 - 1) = v64;
        v63 -= 4;
      }
      __p = v63;
      v87 = (unint64_t)v55;
      if (v57)
      {
        operator delete(v57);
        v55 = (char *)v87;
      }
    }
    else
    {
      *(_DWORD *)v8 = 35051;
      v56 = v8 + 4;
    }
    if (v56 >= v55)
    {
      v65 = __p;
      v66 = (v56 - __p) >> 2;
      v67 = v66 + 1;
      if ((unint64_t)(v66 + 1) >> 62)
        std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
      v68 = v55 - __p;
      if (v68 >> 1 > v67)
        v67 = v68 >> 1;
      if ((unint64_t)v68 >= 0x7FFFFFFFFFFFFFFCLL)
        v69 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v69 = v67;
      if (v69)
      {
        v70 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&v87, v69);
        v65 = __p;
      }
      else
      {
        v70 = 0;
      }
      v71 = &v70[4 * v66];
      v72 = &v70[4 * v69];
      *(_DWORD *)v71 = 35052;
      v8 = v71 + 4;
      while (v56 != v65)
      {
        v73 = *((_DWORD *)v56 - 1);
        v56 -= 4;
        *((_DWORD *)v71 - 1) = v73;
        v71 -= 4;
      }
      __p = v71;
      v87 = (unint64_t)v72;
      if (v65)
        operator delete(v65);
    }
    else
    {
      *(_DWORD *)v56 = 35052;
      v8 = v56 + 4;
    }
    if (self->_api == 3)
    {
      if ((unint64_t)v8 >= v87)
      {
        v75 = __p;
        v76 = (v8 - __p) >> 2;
        v77 = v76 + 1;
        if ((unint64_t)(v76 + 1) >> 62)
          std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
        v78 = v87 - (_QWORD)__p;
        if ((uint64_t)(v87 - (_QWORD)__p) >> 1 > v77)
          v77 = v78 >> 1;
        if ((unint64_t)v78 >= 0x7FFFFFFFFFFFFFFCLL)
          v79 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v79 = v77;
        if (v79)
        {
          v80 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&v87, v79);
          v75 = __p;
        }
        else
        {
          v80 = 0;
        }
        v81 = &v80[4 * v76];
        v82 = &v80[4 * v79];
        *(_DWORD *)v81 = 35882;
        v74 = v81 + 4;
        while (v8 != v75)
        {
          v83 = *((_DWORD *)v8 - 1);
          v8 -= 4;
          *((_DWORD *)v81 - 1) = v83;
          v81 -= 4;
        }
        __p = v81;
        v87 = (unint64_t)v82;
        if (v75)
          operator delete(v75);
      }
      else
      {
        *(_DWORD *)v8 = 35882;
        v74 = v8 + 4;
      }
      v8 = v74;
    }
  }
  v84 = __p;
  if (__p == v8)
    goto LABEL_136;
  do
  {
    (*((void (**)(id, _QWORD))a3 + 2))(a3, *(unsigned int *)v84);
    v84 += 4;
  }
  while (v84 != v8);
  v8 = __p;
  if (__p)
LABEL_136:
    operator delete(v8);
}

- (void)enumerateFramebufferAttachments:(id)a3
{
  -[DYContextInfo enumerateFramebufferColorAttachments:](self, "enumerateFramebufferColorAttachments:");
  (*((void (**)(id, uint64_t))a3 + 2))(a3, 36096);
  (*((void (**)(id, uint64_t))a3 + 2))(a3, 36128);
}

- (void)enumerateFramebufferColorAttachments:(id)a3
{
  int v4;
  int v5;
  uint64_t v6;

  v4 = -[DYContextInfo valueForLimit:](self, "valueForLimit:", CFSTR("GL_MAX_COLOR_ATTACHMENTS"));
  if (v4 >= 1)
  {
    v5 = v4;
    v6 = 36064;
    do
    {
      (*((void (**)(id, uint64_t))a3 + 2))(a3, v6);
      v6 = (v6 + 1);
      --v5;
    }
    while (v5);
  }
}

- (void)enumerateFramebufferDrawBuffers:(id)a3
{
  int v4;
  int v5;
  uint64_t v6;

  v4 = -[DYContextInfo valueForLimit:](self, "valueForLimit:", CFSTR("GL_MAX_DRAW_BUFFERS"));
  if (v4 >= 1)
  {
    v5 = v4;
    v6 = 34853;
    do
    {
      (*((void (**)(id, uint64_t))a3 + 2))(a3, v6);
      v6 = (v6 + 1);
      --v5;
    }
    while (v5);
  }
}

- (void)enumerateTextureTargets:(id)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  unsigned int *v8;
  unint64_t v9;
  unint64_t v10;
  _DWORD *v11;
  unint64_t v12;
  unint64_t v13;
  unsigned int *v14;
  unint64_t v15;
  unint64_t v16;
  unsigned int *v17;
  int *v18;
  unint64_t v19;
  unint64_t v20;
  unsigned int *v21;
  unsigned int *v22;
  unint64_t v23;
  _DWORD *v24;
  char *v25;
  _DWORD *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char *v30;
  _DWORD *v31;
  unint64_t v32;
  int *v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  unsigned int *v39;
  unint64_t v40;
  _DWORD *v41;
  char *v42;
  _DWORD *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char *v47;
  unsigned int *v48;
  unint64_t v49;
  _DWORD *v50;
  char *v51;
  _DWORD *v52;
  uint64_t v53;
  uint64_t v54;
  unint64_t v55;
  char *v56;
  unsigned int *v57;
  char *v58;
  char *v59;
  unsigned int *v60;
  unsigned int v61;
  char *v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char *v67;
  char *v68;
  int v69;
  unsigned int *v70;
  unsigned int v71;
  char *v72;
  char *v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  unint64_t v77;
  char *v78;
  unsigned int *v79;
  unsigned int v80;
  char *v81;
  uint64_t v82;
  unint64_t v83;
  uint64_t v84;
  unint64_t v85;
  char *v86;
  char *v87;
  int v88;
  uint64_t v89;
  unint64_t v90;
  uint64_t v91;
  unint64_t v92;
  char *v93;
  char *v94;
  int v95;
  char *v96;
  char *v97;
  uint64_t v98;
  unint64_t v99;
  uint64_t v100;
  unint64_t v101;
  char *v102;
  char *v103;
  int v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  unint64_t v108;
  char *v109;
  int v110;
  char *v111;
  int v112;
  char *v113;
  char *v114;
  uint64_t v115;
  unint64_t v116;
  uint64_t v117;
  unint64_t v118;
  char *v119;
  int v120;
  char *v121;
  int v122;
  char *v123;
  char *v124;
  uint64_t v125;
  unint64_t v126;
  uint64_t v127;
  unint64_t v128;
  char *v129;
  char *v130;
  int v131;
  char *v132;
  char *v133;
  uint64_t v134;
  unint64_t v135;
  uint64_t v136;
  unint64_t v137;
  char *v138;
  char *v139;
  int v140;
  char *v141;
  char *v142;
  uint64_t v143;
  unint64_t v144;
  uint64_t v145;
  unint64_t v146;
  char *v147;
  char *v148;
  int v149;
  char *v150;
  uint64_t v151;
  unint64_t v152;
  uint64_t v153;
  unint64_t v154;
  char *v155;
  char *v156;
  int v157;
  uint64_t v158;
  unint64_t v159;
  uint64_t v160;
  unint64_t v161;
  char *v162;
  int v163;
  char *v164;
  char *v165;
  uint64_t v166;
  unint64_t v167;
  uint64_t v168;
  unint64_t v169;
  char *v170;
  char *v171;
  uint64_t v172;
  unint64_t v173;
  uint64_t v174;
  unint64_t v175;
  char *v176;
  char *v177;
  char *v178;
  int v179;
  int v180;
  char *v181;
  char *v182;
  char *v183;
  char *v184;
  uint64_t v185;
  unint64_t v186;
  uint64_t v187;
  unint64_t v188;
  char *v189;
  char *v190;
  int v191;
  char *v192;
  char *v193;
  uint64_t v194;
  unint64_t v195;
  uint64_t v196;
  unint64_t v197;
  char *v198;
  char *v199;
  char *v200;
  int v201;
  char *v202;
  char *__p;
  char *v204;
  uint64_t v205;

  __p = 0;
  v204 = 0;
  v205 = 0;
  v5 = -[NSArray objectAtIndex:](self->_renderers, "objectAtIndex:", self->_currentRendererIndex);
  switch(self->_api)
  {
    case 0:
      v15 = 1;
      if ((unint64_t)(v205 >> 1) > 1)
        v15 = v205 >> 1;
      v16 = v15;
      if (v15)
        v17 = (unsigned int *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&v205, v15);
      else
        v17 = 0;
      v48 = v17;
      v49 = (unint64_t)&v17[v16];
      *v48 = 3552;
      v50 = v48 + 1;
      __p = (char *)v48;
      v205 = v49;
      if ((unint64_t)(v48 + 1) >= v49)
      {
        v52 = v48;
        v53 = 2;
        v54 = v49 - (_QWORD)v48;
        if ((unint64_t)(v54 >> 1) > 2)
          v53 = v54 >> 1;
        if ((unint64_t)v54 >= 0x7FFFFFFFFFFFFFFCLL)
          v55 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v55 = v53;
        if (v55)
        {
          v56 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&v205, v55);
          v52 = __p;
        }
        else
        {
          v56 = 0;
        }
        v79 = (unsigned int *)(v56 + 4);
        v49 = (unint64_t)&v56[4 * v55];
        *v79 = 3553;
        v51 = (char *)(v79 + 1);
        while (v50 != v52)
        {
          v80 = *--v50;
          *--v79 = v80;
        }
        __p = (char *)v79;
        v205 = v49;
        if (v52)
        {
          operator delete(v52);
          v49 = v205;
        }
      }
      else
      {
        *v50 = 3553;
        v51 = (char *)(v48 + 2);
      }
      if ((unint64_t)v51 >= v49)
      {
        v81 = __p;
        v82 = (v51 - __p) >> 2;
        v83 = v82 + 1;
        if ((unint64_t)(v82 + 1) >> 62)
          std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
        v84 = v49 - (_QWORD)__p;
        if (v84 >> 1 > v83)
          v83 = v84 >> 1;
        if ((unint64_t)v84 >= 0x7FFFFFFFFFFFFFFCLL)
          v85 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v85 = v83;
        if (v85)
        {
          v86 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&v205, v85);
          v81 = __p;
        }
        else
        {
          v86 = 0;
        }
        v103 = &v86[4 * v82];
        v49 = (unint64_t)&v86[4 * v85];
        *(_DWORD *)v103 = 34067;
        v33 = (int *)(v103 + 4);
        while (v51 != v81)
        {
          v104 = *((_DWORD *)v51 - 1);
          v51 -= 4;
          *((_DWORD *)v103 - 1) = v104;
          v103 -= 4;
        }
        __p = v103;
        v205 = v49;
        if (v81)
        {
          operator delete(v81);
          v49 = v205;
        }
      }
      else
      {
        *(_DWORD *)v51 = 34067;
        v33 = (int *)(v51 + 4);
      }
      if ((unint64_t)v33 < v49)
        goto LABEL_154;
      v18 = (int *)__p;
      v105 = ((char *)v33 - __p) >> 2;
      v106 = v105 + 1;
      if ((unint64_t)(v105 + 1) >> 62)
        std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
      v107 = v49 - (_QWORD)__p;
      if (v107 >> 1 > v106)
        v106 = v107 >> 1;
      if ((unint64_t)v107 >= 0x7FFFFFFFFFFFFFFCLL)
        v108 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v108 = v106;
      if (v108)
      {
        v109 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&v205, v108);
        v18 = (int *)__p;
      }
      else
      {
        v109 = 0;
      }
      v68 = &v109[4 * v105];
      v58 = &v109[4 * v108];
      *(_DWORD *)v68 = 32879;
      v59 = v68 + 4;
      while (v33 != v18)
      {
        v120 = *--v33;
        *((_DWORD *)v68 - 1) = v120;
        v68 -= 4;
      }
      goto LABEL_272;
    case 1:
      v18 = 0;
      v19 = 1;
      if ((unint64_t)(v205 >> 1) > 1)
        v19 = v205 >> 1;
      v20 = v19;
      if (v19)
      {
        v21 = (unsigned int *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&v205, v19);
        v18 = 0;
      }
      else
      {
        v21 = 0;
      }
      v57 = v21;
      v58 = (char *)&v21[v20];
      *v57 = 3553;
      v59 = (char *)(v57 + 1);
      __p = (char *)v57;
      goto LABEL_273;
    case 2:
      v9 = 1;
      if ((unint64_t)(v205 >> 1) > 1)
        v9 = v205 >> 1;
      v10 = v9;
      if (v9)
        v11 = std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&v205, v9);
      else
        v11 = 0;
      v31 = v11;
      v32 = (unint64_t)&v11[v10];
      *v31 = 3553;
      v33 = v31 + 1;
      __p = (char *)v31;
      v205 = v32;
      if ((unint64_t)(v31 + 1) < v32)
      {
        v34 = 34067;
        goto LABEL_259;
      }
      v18 = v31;
      v35 = 2;
      v36 = v32 - (_QWORD)v31;
      if ((unint64_t)(v36 >> 1) > 2)
        v35 = v36 >> 1;
      if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFFCLL)
        v37 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v37 = v35;
      if (v37)
      {
        v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&v205, v37);
        v18 = (int *)__p;
      }
      else
      {
        v38 = 0;
      }
      v68 = v38 + 4;
      v58 = &v38[4 * v37];
      *(_DWORD *)v68 = 34067;
      v59 = v68 + 4;
      while (v33 != v18)
      {
        v69 = *--v33;
        *((_DWORD *)v68 - 1) = v69;
        v68 -= 4;
      }
      goto LABEL_272;
    case 3:
      v12 = 1;
      if ((unint64_t)(v205 >> 1) > 1)
        v12 = v205 >> 1;
      v13 = v12;
      if (v12)
        v14 = (unsigned int *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&v205, v12);
      else
        v14 = 0;
      v39 = v14;
      v40 = (unint64_t)&v14[v13];
      *v39 = 3552;
      v41 = v39 + 1;
      __p = (char *)v39;
      v205 = v40;
      if ((unint64_t)(v39 + 1) >= v40)
      {
        v43 = v39;
        v44 = 2;
        v45 = v40 - (_QWORD)v39;
        if ((unint64_t)(v45 >> 1) > 2)
          v44 = v45 >> 1;
        if ((unint64_t)v45 >= 0x7FFFFFFFFFFFFFFCLL)
          v46 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v46 = v44;
        if (v46)
        {
          v47 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&v205, v46);
          v43 = __p;
        }
        else
        {
          v47 = 0;
        }
        v70 = (unsigned int *)(v47 + 4);
        v40 = (unint64_t)&v47[4 * v46];
        *v70 = 3553;
        v42 = (char *)(v70 + 1);
        while (v41 != v43)
        {
          v71 = *--v41;
          *--v70 = v71;
        }
        __p = (char *)v70;
        v205 = v40;
        if (v43)
        {
          operator delete(v43);
          v40 = v205;
        }
      }
      else
      {
        *v41 = 3553;
        v42 = (char *)(v39 + 2);
      }
      if ((unint64_t)v42 >= v40)
      {
        v73 = __p;
        v74 = (v42 - __p) >> 2;
        v75 = v74 + 1;
        if ((unint64_t)(v74 + 1) >> 62)
          std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
        v76 = v40 - (_QWORD)__p;
        if (v76 >> 1 > v75)
          v75 = v76 >> 1;
        if ((unint64_t)v76 >= 0x7FFFFFFFFFFFFFFCLL)
          v77 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v77 = v75;
        if (v77)
        {
          v78 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&v205, v77);
          v73 = __p;
        }
        else
        {
          v78 = 0;
        }
        v94 = &v78[4 * v74];
        v40 = (unint64_t)&v78[4 * v77];
        *(_DWORD *)v94 = 34067;
        v72 = v94 + 4;
        while (v42 != v73)
        {
          v95 = *((_DWORD *)v42 - 1);
          v42 -= 4;
          *((_DWORD *)v94 - 1) = v95;
          v94 -= 4;
        }
        __p = v94;
        v205 = v40;
        if (v73)
        {
          operator delete(v73);
          v40 = v205;
        }
      }
      else
      {
        *(_DWORD *)v42 = 34067;
        v72 = v42 + 4;
      }
      if ((unint64_t)v72 >= v40)
      {
        v97 = __p;
        v98 = (v72 - __p) >> 2;
        v99 = v98 + 1;
        if ((unint64_t)(v98 + 1) >> 62)
          std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
        v100 = v40 - (_QWORD)__p;
        if (v100 >> 1 > v99)
          v99 = v100 >> 1;
        if ((unint64_t)v100 >= 0x7FFFFFFFFFFFFFFCLL)
          v101 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v101 = v99;
        if (v101)
        {
          v102 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&v205, v101);
          v97 = __p;
        }
        else
        {
          v102 = 0;
        }
        v111 = &v102[4 * v98];
        v40 = (unint64_t)&v102[4 * v101];
        *(_DWORD *)v111 = 32879;
        v96 = v111 + 4;
        while (v72 != v97)
        {
          v112 = *((_DWORD *)v72 - 1);
          v72 -= 4;
          *((_DWORD *)v111 - 1) = v112;
          v111 -= 4;
        }
        __p = v111;
        v205 = v40;
        if (v97)
        {
          operator delete(v97);
          v40 = v205;
        }
      }
      else
      {
        *(_DWORD *)v72 = 32879;
        v96 = v72 + 4;
      }
      if ((unint64_t)v96 >= v40)
      {
        v114 = __p;
        v115 = (v96 - __p) >> 2;
        v116 = v115 + 1;
        if ((unint64_t)(v115 + 1) >> 62)
          std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
        v117 = v40 - (_QWORD)__p;
        if (v117 >> 1 > v116)
          v116 = v117 >> 1;
        if ((unint64_t)v117 >= 0x7FFFFFFFFFFFFFFCLL)
          v118 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v118 = v116;
        if (v118)
        {
          v119 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&v205, v118);
          v114 = __p;
        }
        else
        {
          v119 = 0;
        }
        v121 = &v119[4 * v115];
        v40 = (unint64_t)&v119[4 * v118];
        *(_DWORD *)v121 = 35864;
        v113 = v121 + 4;
        while (v96 != v114)
        {
          v122 = *((_DWORD *)v96 - 1);
          v96 -= 4;
          *((_DWORD *)v121 - 1) = v122;
          v121 -= 4;
        }
        __p = v121;
        v205 = v40;
        if (v114)
        {
          operator delete(v114);
          v40 = v205;
        }
      }
      else
      {
        *(_DWORD *)v96 = 35864;
        v113 = v96 + 4;
      }
      if ((unint64_t)v113 >= v40)
      {
        v124 = __p;
        v125 = (v113 - __p) >> 2;
        v126 = v125 + 1;
        if ((unint64_t)(v125 + 1) >> 62)
          std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
        v127 = v40 - (_QWORD)__p;
        if (v127 >> 1 > v126)
          v126 = v127 >> 1;
        if ((unint64_t)v127 >= 0x7FFFFFFFFFFFFFFCLL)
          v128 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v128 = v126;
        if (v128)
        {
          v129 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&v205, v128);
          v124 = __p;
        }
        else
        {
          v129 = 0;
        }
        v130 = &v129[4 * v125];
        v40 = (unint64_t)&v129[4 * v128];
        *(_DWORD *)v130 = 35866;
        v123 = v130 + 4;
        while (v113 != v124)
        {
          v131 = *((_DWORD *)v113 - 1);
          v113 -= 4;
          *((_DWORD *)v130 - 1) = v131;
          v130 -= 4;
        }
        __p = v130;
        v205 = v40;
        if (v124)
        {
          operator delete(v124);
          v40 = v205;
        }
      }
      else
      {
        *(_DWORD *)v113 = 35866;
        v123 = v113 + 4;
      }
      if ((unint64_t)v123 >= v40)
      {
        v133 = __p;
        v134 = (v123 - __p) >> 2;
        v135 = v134 + 1;
        if ((unint64_t)(v134 + 1) >> 62)
          std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
        v136 = v40 - (_QWORD)__p;
        if (v136 >> 1 > v135)
          v135 = v136 >> 1;
        if ((unint64_t)v136 >= 0x7FFFFFFFFFFFFFFCLL)
          v137 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v137 = v135;
        if (v137)
        {
          v138 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&v205, v137);
          v133 = __p;
        }
        else
        {
          v138 = 0;
        }
        v139 = &v138[4 * v134];
        v40 = (unint64_t)&v138[4 * v137];
        *(_DWORD *)v139 = 34037;
        v132 = v139 + 4;
        while (v123 != v133)
        {
          v140 = *((_DWORD *)v123 - 1);
          v123 -= 4;
          *((_DWORD *)v139 - 1) = v140;
          v139 -= 4;
        }
        __p = v139;
        v205 = v40;
        if (v133)
        {
          operator delete(v133);
          v40 = v205;
        }
      }
      else
      {
        *(_DWORD *)v123 = 34037;
        v132 = v123 + 4;
      }
      if ((unint64_t)v132 >= v40)
      {
        v142 = __p;
        v143 = (v132 - __p) >> 2;
        v144 = v143 + 1;
        if ((unint64_t)(v143 + 1) >> 62)
          std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
        v145 = v40 - (_QWORD)__p;
        if (v145 >> 1 > v144)
          v144 = v145 >> 1;
        if ((unint64_t)v145 >= 0x7FFFFFFFFFFFFFFCLL)
          v146 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v146 = v144;
        if (v146)
        {
          v147 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&v205, v146);
          v142 = __p;
        }
        else
        {
          v147 = 0;
        }
        v148 = &v147[4 * v143];
        v40 = (unint64_t)&v147[4 * v146];
        *(_DWORD *)v148 = 35882;
        v141 = v148 + 4;
        while (v132 != v142)
        {
          v149 = *((_DWORD *)v132 - 1);
          v132 -= 4;
          *((_DWORD *)v148 - 1) = v149;
          v148 -= 4;
        }
        __p = v148;
        v205 = v40;
        if (v142)
        {
          operator delete(v142);
          v40 = v205;
        }
      }
      else
      {
        *(_DWORD *)v132 = 35882;
        v141 = v132 + 4;
      }
      if ((unint64_t)v141 >= v40)
      {
        v150 = __p;
        v151 = (v141 - __p) >> 2;
        v152 = v151 + 1;
        if ((unint64_t)(v151 + 1) >> 62)
          std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
        v153 = v40 - (_QWORD)__p;
        if (v153 >> 1 > v152)
          v152 = v153 >> 1;
        if ((unint64_t)v153 >= 0x7FFFFFFFFFFFFFFCLL)
          v154 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v154 = v152;
        if (v154)
        {
          v155 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&v205, v154);
          v150 = __p;
        }
        else
        {
          v155 = 0;
        }
        v156 = &v155[4 * v151];
        v40 = (unint64_t)&v155[4 * v154];
        *(_DWORD *)v156 = 37120;
        v33 = (int *)(v156 + 4);
        while (v141 != v150)
        {
          v157 = *((_DWORD *)v141 - 1);
          v141 -= 4;
          *((_DWORD *)v156 - 1) = v157;
          v156 -= 4;
        }
        __p = v156;
        v205 = v40;
        if (v150)
        {
          operator delete(v150);
          v40 = v205;
        }
      }
      else
      {
        *(_DWORD *)v141 = 37120;
        v33 = (int *)(v141 + 4);
      }
      if ((unint64_t)v33 < v40)
      {
        v34 = 37122;
        goto LABEL_259;
      }
      v18 = (int *)__p;
      v158 = ((char *)v33 - __p) >> 2;
      v159 = v158 + 1;
      if ((unint64_t)(v158 + 1) >> 62)
        std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
      v160 = v40 - (_QWORD)__p;
      if (v160 >> 1 > v159)
        v159 = v160 >> 1;
      if ((unint64_t)v160 >= 0x7FFFFFFFFFFFFFFCLL)
        v161 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v161 = v159;
      if (v161)
      {
        v162 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&v205, v161);
        v18 = (int *)__p;
      }
      else
      {
        v162 = 0;
      }
      v68 = &v162[4 * v158];
      v58 = &v162[4 * v161];
      *(_DWORD *)v68 = 37122;
      v59 = v68 + 4;
      while (v33 != v18)
      {
        v163 = *--v33;
        *((_DWORD *)v68 - 1) = v163;
        v68 -= 4;
      }
      goto LABEL_272;
    case 4:
      v6 = 1;
      if ((unint64_t)(v205 >> 1) > 1)
        v6 = v205 >> 1;
      v7 = v6;
      if (v6)
        v8 = (unsigned int *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&v205, v6);
      else
        v8 = 0;
      v22 = v8;
      v23 = (unint64_t)&v8[v7];
      *v22 = 3553;
      v24 = v22 + 1;
      __p = (char *)v22;
      v205 = v23;
      if ((unint64_t)(v22 + 1) >= v23)
      {
        v26 = v22;
        v27 = 2;
        v28 = v23 - (_QWORD)v22;
        if ((unint64_t)(v28 >> 1) > 2)
          v27 = v28 >> 1;
        if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFFCLL)
          v29 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v29 = v27;
        if (v29)
        {
          v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&v205, v29);
          v26 = __p;
        }
        else
        {
          v30 = 0;
        }
        v60 = (unsigned int *)(v30 + 4);
        v23 = (unint64_t)&v30[4 * v29];
        *v60 = 34067;
        v25 = (char *)(v60 + 1);
        while (v24 != v26)
        {
          v61 = *--v24;
          *--v60 = v61;
        }
        __p = (char *)v60;
        v205 = v23;
        if (v26)
        {
          operator delete(v26);
          v23 = v205;
        }
      }
      else
      {
        *v24 = 34067;
        v25 = (char *)(v22 + 2);
      }
      if ((unint64_t)v25 >= v23)
      {
        v62 = __p;
        v63 = (v25 - __p) >> 2;
        v64 = v63 + 1;
        if ((unint64_t)(v63 + 1) >> 62)
          std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
        v65 = v23 - (_QWORD)__p;
        if (v65 >> 1 > v64)
          v64 = v65 >> 1;
        if ((unint64_t)v65 >= 0x7FFFFFFFFFFFFFFCLL)
          v66 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v66 = v64;
        if (v66)
        {
          v67 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&v205, v66);
          v62 = __p;
        }
        else
        {
          v67 = 0;
        }
        v87 = &v67[4 * v63];
        v23 = (unint64_t)&v67[4 * v66];
        *(_DWORD *)v87 = 35866;
        v33 = (int *)(v87 + 4);
        while (v25 != v62)
        {
          v88 = *((_DWORD *)v25 - 1);
          v25 -= 4;
          *((_DWORD *)v87 - 1) = v88;
          v87 -= 4;
        }
        __p = v87;
        v205 = v23;
        if (v62)
        {
          operator delete(v62);
          v23 = v205;
        }
      }
      else
      {
        *(_DWORD *)v25 = 35866;
        v33 = (int *)(v25 + 4);
      }
      if ((unint64_t)v33 < v23)
      {
LABEL_154:
        v34 = 32879;
LABEL_259:
        *v33 = v34;
        v59 = (char *)(v33 + 1);
      }
      else
      {
        v18 = (int *)__p;
        v89 = ((char *)v33 - __p) >> 2;
        v90 = v89 + 1;
        if ((unint64_t)(v89 + 1) >> 62)
          std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
        v91 = v23 - (_QWORD)__p;
        if (v91 >> 1 > v90)
          v90 = v91 >> 1;
        if ((unint64_t)v91 >= 0x7FFFFFFFFFFFFFFCLL)
          v92 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v92 = v90;
        if (v92)
        {
          v93 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&v205, v92);
          v18 = (int *)__p;
        }
        else
        {
          v93 = 0;
        }
        v68 = &v93[4 * v89];
        v58 = &v93[4 * v92];
        *(_DWORD *)v68 = 32879;
        v59 = v68 + 4;
        while (v33 != v18)
        {
          v110 = *--v33;
          *((_DWORD *)v68 - 1) = v110;
          v68 -= 4;
        }
LABEL_272:
        __p = v68;
LABEL_273:
        v205 = (uint64_t)v58;
        if (v18)
          operator delete(v18);
      }
      v204 = v59;
LABEL_276:
      if (objc_msgSend((id)objc_msgSend(v5, "extensions"), "containsObject:", CFSTR("GL_ARB_texture_rectangle"))&& !self->_api)
      {
        v164 = v204;
        if ((unint64_t)v204 >= v205)
        {
          v165 = __p;
          v172 = (v204 - __p) >> 2;
          v173 = v172 + 1;
          if ((unint64_t)(v172 + 1) >> 62)
            std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
          v174 = v205 - (_QWORD)__p;
          if ((v205 - (uint64_t)__p) >> 1 > v173)
            v173 = v174 >> 1;
          if ((unint64_t)v174 >= 0x7FFFFFFFFFFFFFFCLL)
            v175 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v175 = v173;
          if (v175)
          {
            v176 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&v205, v175);
            v165 = __p;
            v164 = v204;
          }
          else
          {
            v176 = 0;
          }
          v177 = &v176[4 * v172];
          v178 = &v176[4 * v175];
          *(_DWORD *)v177 = 34037;
          v171 = v177 + 4;
          while (v164 != v165)
          {
            v179 = *((_DWORD *)v164 - 1);
            v164 -= 4;
            *((_DWORD *)v177 - 1) = v179;
            v177 -= 4;
          }
          goto LABEL_307;
        }
LABEL_290:
        *(_DWORD *)v164 = 34037;
        v171 = v164 + 4;
LABEL_309:
        v204 = v171;
        goto LABEL_310;
      }
      if (objc_msgSend((id)objc_msgSend(v5, "extensions"), "containsObject:", CFSTR("GL_EXT_texture_rectangle"))&& !self->_api)
      {
        v164 = v204;
        if ((unint64_t)v204 >= v205)
        {
          v165 = __p;
          v166 = (v204 - __p) >> 2;
          v167 = v166 + 1;
          if ((unint64_t)(v166 + 1) >> 62)
            std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
          v168 = v205 - (_QWORD)__p;
          if ((v205 - (uint64_t)__p) >> 1 > v167)
            v167 = v168 >> 1;
          if ((unint64_t)v168 >= 0x7FFFFFFFFFFFFFFCLL)
            v169 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v169 = v167;
          if (v169)
          {
            v170 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&v205, v169);
            v165 = __p;
            v164 = v204;
          }
          else
          {
            v170 = 0;
          }
          v177 = &v170[4 * v166];
          v178 = &v170[4 * v169];
          *(_DWORD *)v177 = 34037;
          v171 = v177 + 4;
          while (v164 != v165)
          {
            v180 = *((_DWORD *)v164 - 1);
            v164 -= 4;
            *((_DWORD *)v177 - 1) = v180;
            v177 -= 4;
          }
LABEL_307:
          __p = v177;
          v205 = (uint64_t)v178;
          if (v165)
            operator delete(v165);
          goto LABEL_309;
        }
        goto LABEL_290;
      }
LABEL_310:
      if (objc_msgSend((id)objc_msgSend(v5, "extensions"), "containsObject:", CFSTR("GL_EXT_texture_array"))&& !self->_api)
      {
        v182 = v204;
        v181 = (char *)v205;
        if ((unint64_t)v204 >= v205)
        {
          v184 = __p;
          v185 = (v204 - __p) >> 2;
          v186 = v185 + 1;
          if ((unint64_t)(v185 + 1) >> 62)
            std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
          v187 = v205 - (_QWORD)__p;
          if ((v205 - (uint64_t)__p) >> 1 > v186)
            v186 = v187 >> 1;
          if ((unint64_t)v187 >= 0x7FFFFFFFFFFFFFFCLL)
            v188 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v188 = v186;
          if (v188)
          {
            v189 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&v205, v188);
            v184 = __p;
            v182 = v204;
          }
          else
          {
            v189 = 0;
          }
          v190 = &v189[4 * v185];
          v181 = &v189[4 * v188];
          *(_DWORD *)v190 = 35864;
          v183 = v190 + 4;
          while (v182 != v184)
          {
            v191 = *((_DWORD *)v182 - 1);
            v182 -= 4;
            *((_DWORD *)v190 - 1) = v191;
            v190 -= 4;
          }
          __p = v190;
          v205 = (uint64_t)v181;
          if (v184)
          {
            operator delete(v184);
            v181 = (char *)v205;
          }
        }
        else
        {
          *(_DWORD *)v204 = 35864;
          v183 = v204 + 4;
        }
        if (v183 >= v181)
        {
          v193 = __p;
          v194 = (v183 - __p) >> 2;
          v195 = v194 + 1;
          if ((unint64_t)(v194 + 1) >> 62)
            std::vector<unsigned int>::__throw_length_error[abi:ne180100]();
          v196 = v181 - __p;
          if (v196 >> 1 > v195)
            v195 = v196 >> 1;
          if ((unint64_t)v196 >= 0x7FFFFFFFFFFFFFFCLL)
            v197 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v197 = v195;
          if (v197)
          {
            v198 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned int>>((uint64_t)&v205, v197);
            v193 = __p;
          }
          else
          {
            v198 = 0;
          }
          v199 = &v198[4 * v194];
          v200 = &v198[4 * v197];
          *(_DWORD *)v199 = 35866;
          v192 = v199 + 4;
          while (v183 != v193)
          {
            v201 = *((_DWORD *)v183 - 1);
            v183 -= 4;
            *((_DWORD *)v199 - 1) = v201;
            v199 -= 4;
          }
          __p = v199;
          v205 = (uint64_t)v200;
          if (v193)
            operator delete(v193);
        }
        else
        {
          *(_DWORD *)v183 = 35866;
          v192 = v183 + 4;
        }
        v204 = v192;
      }
      v202 = __p;
      if (__p != v204)
      {
        do
        {
          (*((void (**)(id, _QWORD))a3 + 2))(a3, *(unsigned int *)v202);
          v202 += 4;
        }
        while (v202 != v204);
        v202 = __p;
      }
      if (v202)
        operator delete(v202);
      return;
    default:
      goto LABEL_276;
  }
}

- (int)rendererType
{
  void *v2;

  v2 = (void *)objc_msgSend(-[NSArray objectAtIndex:](self->_renderers, "objectAtIndex:", self->_currentRendererIndex), "renderer");
  if (objc_msgSend(v2, "rangeOfString:", CFSTR("PowerVR SGX")) != 0x7FFFFFFFFFFFFFFFLL)
    return 2;
  if (objc_msgSend(v2, "rangeOfString:", CFSTR("Apple Software Renderer")) == 0x7FFFFFFFFFFFFFFFLL)
    return 3;
  return 1;
}

- (NSDictionary)defaultSamplePositions
{
  return 0;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (unint64_t)sharegroupIdentifier
{
  return self->_sharegroupIdentifier;
}

- (NSArray)renderers
{
  return self->_renderers;
}

- (unsigned)currentRendererIndex
{
  return self->_currentRendererIndex;
}

- (int)api
{
  return self->_api;
}

- (NSString)debugLabel
{
  return self->_debugLabel;
}

- (void)setDebugLabel:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
