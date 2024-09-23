@implementation ADInterSessionFilter

- (ADInterSessionFilter)initWithFieldNames:(id)a3 parameters:(id)a4
{
  id v7;
  ADInterSessionFilter *v8;
  ADInterSessionFilter *v9;
  NSArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  _QWORD *v15;
  uint64_t **v16;
  uint64_t **v17;
  uint64_t *v18;
  std::string *v19;
  id v21;
  void *__p[2];
  uint64_t v23;
  _QWORD *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v21 = a3;
  v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)ADInterSessionFilter;
  v8 = -[ADInterSessionFilter init](&v29, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_version = 1;
    objc_storeStrong((id *)&v8->_params, a4);
    objc_storeStrong((id *)&v9->_elementsNames, a3);
    -[NSArray count](v9->_elementsNames, "count");
    v9->_weightedAverage = (double *)operator new[]();
    v9->_sumOfWeights = (double *)operator new[]();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v10 = v9->_elementsNames;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          v15 = (_QWORD *)operator new();
          v15[2] = 0;
          v15[1] = 0;
          *v15 = v15 + 1;
          std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String"));
          v24 = v15;
          v16 = (uint64_t **)std::__tree<std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>,std::__map_value_compare<std::string,std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>>>::__find_equal<std::string>((uint64_t)&v9->_sets, &v30, __p);
          if (!*v16)
          {
            v17 = v16;
            v18 = (uint64_t *)operator new(0x40uLL);
            v19 = (std::string *)(v18 + 4);
            if (SHIBYTE(v23) < 0)
            {
              std::string::__init_copy_ctor_external(v19, (const std::string::value_type *)__p[0], (std::string::size_type)__p[1]);
              v15 = v24;
            }
            else
            {
              *(_OWORD *)&v19->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
              v18[6] = v23;
            }
            v18[7] = (uint64_t)v15;
            std::__tree<std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>,std::__map_value_compare<std::string,std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>>>::__insert_node_at((uint64_t **)&v9->_sets, v30, v17, v18);
          }
          if (SHIBYTE(v23) < 0)
            operator delete(__p[0]);
        }
        v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      }
      while (v11);
    }

  }
  return v9;
}

- (void)dealloc
{
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::multiset<Element *, Element::ElementCompare> *>, void *>>> *begin_node;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::multiset<Element *, Element::ElementCompare> *>, void *>>> *p_pair1;
  char *left;
  _QWORD **v6;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::multiset<Element *, Element::ElementCompare> *>, void *>>> *v7;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::multiset<Element *, Element::ElementCompare> *>, void *>>> *v8;
  BOOL v9;
  Node ***begin;
  Node ***end;
  Node ***v12;
  Node **v13;
  Node **v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  Node ***v18;
  unint64_t v19;
  double *weightedAverage;
  double *sumOfWeights;
  objc_super v22;

  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::multiset<Element *, Element::ElementCompare> *>, void *>>> *)self->_sets.__tree_.__begin_node_;
  p_pair1 = &self->_sets.__tree_.__pair1_;
  if (begin_node != &self->_sets.__tree_.__pair1_)
  {
    do
    {
      left = (char *)begin_node[7].__value_.__left_;
      std::__tree<Element *,Element::ElementCompare,std::allocator<Element *>>::destroy(*((_QWORD **)left + 1));
      *(_QWORD *)left = left + 8;
      *((_QWORD *)left + 2) = 0;
      *((_QWORD *)left + 1) = 0;
      v6 = (_QWORD **)begin_node[7].__value_.__left_;
      if (v6)
      {
        std::__tree<Element *,Element::ElementCompare,std::allocator<Element *>>::destroy(v6[1]);
        MEMORY[0x23B7F1D64](v6, 0x1020C4062D53EE8);
      }
      v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::multiset<Element *, Element::ElementCompare> *>, void *>>> *)begin_node[1].__value_.__left_;
      if (v7)
      {
        do
        {
          v8 = v7;
          v7 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::multiset<Element *, Element::ElementCompare> *>, void *>>> *)v7->__value_.__left_;
        }
        while (v7);
      }
      else
      {
        do
        {
          v8 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<std::string, std::multiset<Element *, Element::ElementCompare> *>, void *>>> *)begin_node[2].__value_.__left_;
          v9 = v8->__value_.__left_ == begin_node;
          begin_node = v8;
        }
        while (!v9);
      }
      begin_node = v8;
    }
    while (v8 != p_pair1);
  }
  std::__tree<std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>,std::__map_value_compare<std::string,std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>>>::destroy((char *)self->_sets.__tree_.__pair1_.__value_.__left_);
  self->_sets.__tree_.__pair1_.__value_.__left_ = 0;
  self->_sets.__tree_.__pair3_.__value_ = 0;
  self->_sets.__tree_.__begin_node_ = p_pair1;
  begin = self->_nodes.__map_.__begin_;
  end = self->_nodes.__map_.__end_;
  v12 = &begin[self->_nodes.__start_ >> 9];
  if (end == begin)
    v13 = 0;
  else
    v13 = &(*v12)[self->_nodes.__start_ & 0x1FF];
  while (1)
  {
    v15 = (char *)end - (char *)begin;
    if (v15)
    {
      v16 = self->_nodes.__size_.__value_ + self->_nodes.__start_;
      v17 = (uint64_t)&(*(Node ***)((char *)begin + ((v16 >> 6) & 0x3FFFFFFFFFFFFF8)))[v16 & 0x1FF];
    }
    else
    {
      v17 = 0;
    }
    if (v13 == (Node **)v17)
      break;
    if (*v13)
    {
      Node::~Node(*v13);
      MEMORY[0x23B7F1D64]();
    }
    if ((char *)++v13 - (char *)*v12 == 4096)
    {
      v14 = v12[1];
      ++v12;
      v13 = v14;
    }
    begin = self->_nodes.__map_.__begin_;
    end = self->_nodes.__map_.__end_;
  }
  self->_nodes.__size_.__value_ = 0;
  if (v15 >= 0x11)
  {
    do
    {
      operator delete(*begin);
      v18 = self->_nodes.__map_.__end_;
      begin = self->_nodes.__map_.__begin_ + 1;
      self->_nodes.__map_.__begin_ = begin;
      v15 = (char *)v18 - (char *)begin;
    }
    while (v15 > 0x10);
  }
  if (v15 >> 3 == 1)
  {
    v19 = 256;
  }
  else
  {
    if (v15 >> 3 != 2)
      goto LABEL_29;
    v19 = 512;
  }
  self->_nodes.__start_ = v19;
LABEL_29:
  weightedAverage = self->_weightedAverage;
  if (weightedAverage)
    MEMORY[0x23B7F1D4C](weightedAverage, 0x1000C8000313F17);
  sumOfWeights = self->_sumOfWeights;
  if (sumOfWeights)
    MEMORY[0x23B7F1D4C](sumOfWeights, 0x1000C8000313F17);
  v22.receiver = self;
  v22.super_class = (Class)ADInterSessionFilter;
  -[ADInterSessionFilter dealloc](&v22, sel_dealloc);
}

- (int64_t)fillWithDictionaryRepresentation:(id)a3
{
  void *v4;
  uint64_t v5;
  unsigned int v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
  id v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("nodes"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("version"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "unsignedIntValue") != self->_version)
  {

    goto LABEL_14;
  }
  v5 = objc_msgSend(v17, "count");
  v6 = -[ADInterSessionFilterParameters capacity](self->_params, "capacity");

  if (v5 != v6)
  {
LABEL_14:
    v14 = -22950;
    goto LABEL_15;
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v17;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v19;
LABEL_5:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v19 != v9)
        objc_enumerationMutation(v7);
      v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v10);
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("elements"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("weight"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "doubleValue");
      v14 = -[ADInterSessionFilter insertEntry:withWeight:](self, "insertEntry:withWeight:", v12);

      if (v14)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v8)
          goto LABEL_5;
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    v14 = 0;
  }

LABEL_15:
  return v14;
}

- (int64_t)fillWithEntry:(id)a3
{
  id v4;
  int v5;
  float v6;
  int64_t v7;

  v4 = a3;
  v5 = -1;
  while (++v5 < -[ADInterSessionFilterParameters capacity](self->_params, "capacity"))
  {
    -[ADInterSessionFilterParameters maximalWeight](self->_params, "maximalWeight");
    v7 = -[ADInterSessionFilter insertEntry:withWeight:](self, "insertEntry:withWeight:", v4, v6);
    if (v7)
      goto LABEL_6;
  }
  v7 = 0;
LABEL_6:

  return v7;
}

- (id)persistenceData
{
  void *v3;
  Node ***begin;
  Node ***end;
  double **v6;
  unint64_t v7;
  uint64_t v8;
  id v9;
  double **v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v21;
  void *v22;
  Node ***v23;
  ADInterSessionFilter *v24;
  unsigned int i;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v21 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_version);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v3, CFSTR("version"));

  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", self->_nodes.__size_.__value_);
  begin = self->_nodes.__map_.__begin_;
  end = self->_nodes.__map_.__end_;
  v23 = &begin[self->_nodes.__start_ >> 9];
  v24 = self;
  if (end == begin)
    v6 = 0;
  else
    v6 = (double **)&begin[self->_nodes.__start_ >> 9][self->_nodes.__start_ & 0x1FF];
  for (i = 0; ; ++i)
  {
    if (end == begin)
    {
      v8 = 0;
    }
    else
    {
      v7 = v24->_nodes.__size_.__value_ + v24->_nodes.__start_;
      v8 = (uint64_t)&(*(Node ***)((char *)begin + ((v7 >> 6) & 0x3FFFFFFFFFFFFF8)))[v7 & 0x1FF];
    }
    if (v6 == (double **)v8)
      break;
    v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v10 = (double **)*((_QWORD *)*v6 + 2);
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v11 = v24->_elementsNames;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v12; ++j)
        {
          if (*(_QWORD *)v27 != v13)
            objc_enumerationMutation(v11);
          v15 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j);
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", **v10);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, v15);

          ++v10;
        }
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v12);
    }

    v17 = objc_alloc(MEMORY[0x24BDBCE70]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", **v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v17, "initWithObjectsAndKeys:", v18, CFSTR("weight"), v9, CFSTR("elements"), 0);
    objc_msgSend(v22, "setObject:atIndexedSubscript:", v19, i);

    if ((char *)++v6 - (char *)*v23 == 4096)
    {
      v6 = (double **)v23[1];
      ++v23;
    }
    begin = v24->_nodes.__map_.__begin_;
    end = v24->_nodes.__map_.__end_;
  }
  objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, CFSTR("nodes"));

  return v21;
}

- (int64_t)insertEntry:(id)a3 withWeight:(double)a4
{
  NSArray *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  float v16;
  float v17;
  double v18;
  float v19;
  double v20;
  id v21;
  double v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  char *v29;
  char *v30;
  char *v31;
  char *v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  char *v55;
  unint64_t v56;
  char *v57;
  uint64_t *v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t *v61;
  int64_t v62;
  char *v63;
  char *v64;
  void *v65;
  unint64_t v66;
  char *v67;
  uint64_t v68;
  void *v69;
  char *v70;
  uint64_t v71;
  char *end;
  char *begin;
  uint64_t v74;
  uint64_t v75;
  unint64_t value;
  unint64_t start;
  unint64_t v78;
  ADInterSessionFilter *v79;
  uint64_t v80;
  Node ***v81;
  uint64_t v82;
  Node ***first;
  uint64_t v84;
  uint64_t v85;
  BOOL v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  Node ***v91;
  int64_t v92;
  Node ***v93;
  int64_t v94;
  uint64_t v95;
  Node ***v96;
  Node ***v97;
  uint64_t v98;
  unint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  char *v103;
  __int128 v104;
  void *v105;
  __int128 v106;
  uint64_t v107;
  __int128 v108;
  uint64_t v109;
  unint64_t v110;
  uint64_t v111;
  uint64_t v112;
  unint64_t v113;
  Node ***v114;
  uint64_t v115;
  char *v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  Node ***v120;
  Node **v121;
  Node ***v122;
  void *v123;
  unint64_t v124;
  Node ***v125;
  uint64_t v126;
  char *v127;
  Node ***v128;
  uint64_t v129;
  uint64_t v130;
  char *v131;
  uint64_t v132;
  Node ***v133;
  Node ***v134;
  Node ***v135;
  Node **v136;
  Node ***v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  Node ***v144;
  int64_t v145;
  uint64_t v146;
  unint64_t v147;
  char *v148;
  uint64_t v149;
  Node ***j;
  _QWORD *v151;
  char *v152;
  _BYTE *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  unint64_t v158;
  char *v159;
  uint64_t v160;
  char *v161;
  uint64_t v162;
  uint64_t v163;
  char *v164;
  uint64_t *v165;
  uint64_t v166;
  uint64_t v167;
  Node ***v168;
  uint64_t v169;
  uint64_t v170;
  double **v171;
  NSArray *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t k;
  uint64_t **v176;
  uint64_t *v177;
  uint64_t *v178;
  double *v179;
  uint64_t **v180;
  uint64_t **v181;
  double v182;
  uint64_t **v183;
  uint64_t *v184;
  uint64_t *v185;
  uint64_t v186;
  unint64_t v187;
  Node *v188;
  uint64_t v189;
  NSArray *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t m;
  _OWORD *v194;
  _QWORD *v195;
  _QWORD *v196;
  _QWORD *v197;
  _QWORD *v198;
  void **v199;
  _QWORD *v200;
  uint64_t v201;
  _QWORD *v202;
  _QWORD *v203;
  int v204;
  _QWORD *v205;
  _QWORD *v206;
  int v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t *v212;
  uint64_t v213;
  _QWORD *v214;
  _QWORD *v215;
  _BYTE *v216;
  uint64_t v217;
  _BYTE *v218;
  uint64_t *v219;
  BOOL v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  int64x2_t v227;
  uint64_t v229;
  uint64_t v230;
  unint64_t v231;
  Node ***v232;
  uint64_t v233;
  Node ***v234;
  char *v235;
  uint64_t v236;
  uint64_t v237;
  Node ***v238;
  Node **v239;
  Node ***v240;
  void *v241;
  __int128 v242;
  __int128 v243;
  uint64_t v244;
  ADInterSessionFilter *v245;
  void *v246;
  id v247;
  id v248;
  __int128 v249;
  uint64_t v250;
  __int128 v251;
  _QWORD *v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  uint64_t v265;
  __int128 v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  _BYTE v270[128];
  _BYTE v271[128];
  _BYTE v272[128];
  void *v273[2];
  char v274;
  uint64_t v275;

  v275 = *MEMORY[0x24BDAC8D0];
  v247 = a3;
  v246 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[NSArray count](self->_elementsNames, "count"));
  v263 = 0u;
  v264 = 0u;
  v261 = 0u;
  v262 = 0u;
  v245 = self;
  v6 = self->_elementsNames;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v261, v272, 16);
  if (v7)
  {
    v8 = 0;
    v9 = *(_QWORD *)v262;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v262 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v261 + 1) + 8 * i);
        objc_msgSend(v247, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12 == 0;

        if (v13)
        {

          v94 = -22950;
          goto LABEL_257;
        }
        objc_msgSend(v247, "objectForKeyedSubscript:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v246, "setObject:atIndexedSubscript:", v14, (v8 + i));

      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v261, v272, 16);
      v8 += i;
    }
    while (v7);
  }

  v15 = operator new();
  -[ADInterSessionFilterParameters maximalWeight](v245->_params, "maximalWeight");
  v17 = v16;
  -[ADInterSessionFilterParameters minimalWeight](v245->_params, "minimalWeight");
  v18 = v17;
  v20 = v19;
  v21 = v246;
  if (v18 <= a4)
    v22 = v18;
  else
    v22 = a4;
  if (v22 < v20)
    v22 = v20;
  *(double *)v15 = v22;
  *(_OWORD *)(v15 + 8) = 0u;
  *(_OWORD *)(v15 + 24) = 0u;
  v23 = objc_msgSend(v21, "count", v21);
  v24 = *(_QWORD *)(v15 + 16);
  if (v23 > (*(_QWORD *)(v15 + 32) - v24) >> 3)
  {
    if (v23 >> 61)
      std::vector<Element *>::__throw_length_error[abi:ne180100]();
    v25 = *(_QWORD *)(v15 + 24);
    v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Node **>>(v23);
    v27 = &v26[(v25 - v24) & 0xFFFFFFFFFFFFFFF8];
    v29 = &v26[8 * v28];
    v31 = *(char **)(v15 + 16);
    v30 = *(char **)(v15 + 24);
    v32 = v27;
    if (v30 != v31)
    {
      do
      {
        v33 = *((_QWORD *)v30 - 1);
        v30 -= 8;
        *((_QWORD *)v32 - 1) = v33;
        v32 -= 8;
      }
      while (v30 != v31);
      v30 = *(char **)(v15 + 16);
    }
    *(_QWORD *)(v15 + 16) = v32;
    *(_QWORD *)(v15 + 24) = v27;
    *(_QWORD *)(v15 + 32) = v29;
    if (v30)
      operator delete(v30);
  }
  v268 = 0u;
  v269 = 0u;
  v266 = 0u;
  v267 = 0u;
  v34 = v241;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v266, v273, 16);
  if (v35)
  {
    v36 = *(_QWORD *)v267;
    v248 = v34;
    v252 = (_QWORD *)v15;
    do
    {
      v37 = 0;
      do
      {
        if (*(_QWORD *)v267 != v36)
          objc_enumerationMutation(v34);
        v38 = *(void **)(*((_QWORD *)&v266 + 1) + 8 * v37);
        v265 = 0;
        v39 = operator new();
        objc_msgSend(v38, "doubleValue");
        *(_QWORD *)v39 = v40;
        *(_QWORD *)(v39 + 8) = 0;
        *(_WORD *)(v39 + 16) = 0;
        v265 = v39;
        v42 = *(uint64_t **)(v15 + 24);
        v41 = *(_QWORD *)(v15 + 32);
        if ((unint64_t)v42 < v41)
        {
          *v42 = v39;
          *(_QWORD *)(v15 + 24) = v42 + 1;
          goto LABEL_51;
        }
        v43 = v35;
        v44 = v36;
        v45 = *(uint64_t **)(v15 + 16);
        v46 = (char *)v42 - (char *)v45;
        v47 = v42 - v45;
        v48 = v47 + 1;
        if ((unint64_t)(v47 + 1) >> 61)
          std::vector<Element *>::__throw_length_error[abi:ne180100]();
        v49 = v41 - (_QWORD)v45;
        v50 = v49 >> 2;
        if (v49 >> 2 <= (unint64_t)v48)
          v50 = v47 + 1;
        if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFF8)
          v51 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v51 = v50;
        if (v51)
        {
          v53 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Node **>>(v51);
        }
        else
        {
          v53 = 0;
          v52 = 0;
        }
        v54 = &v53[8 * v47];
        v55 = &v53[8 * v52];
        if (v47 == v52)
        {
          if (v46 < 1)
          {
            if (v45 == v42)
              v66 = 1;
            else
              v66 = v46 >> 2;
            v67 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Node **>>(v66);
            v54 = &v67[8 * (v66 >> 2)];
            v55 = &v67[8 * v68];
            v36 = v44;
            if (v53)
            {
              v69 = v53;
              v70 = v55;
              operator delete(v69);
              v55 = v70;
            }
            goto LABEL_44;
          }
          if (v48 >= 0)
            v56 = v47 + 1;
          else
            v56 = v47 + 2;
          v54 -= 8 * (v56 >> 1);
        }
        v36 = v44;
LABEL_44:
        v35 = v43;
        *(_QWORD *)v54 = v265;
        v57 = v54 + 8;
        v58 = (uint64_t *)v252[2];
        if (v58 != v42)
        {
          v59 = v42;
          do
          {
            v60 = *--v59;
            *((_QWORD *)v54 - 1) = v60;
            v54 -= 8;
          }
          while (v59 != v58);
        }
        v61 = (uint64_t *)v252[3];
        v62 = (char *)v61 - (char *)v42;
        if (v61 != v42)
        {
          v63 = v55;
          memmove(v57, v42, (char *)v61 - (char *)v42);
          v55 = v63;
        }
        v64 = &v57[v62];
        v15 = (uint64_t)v252;
        v65 = (void *)v252[2];
        v252[2] = v54;
        v252[3] = v64;
        v252[4] = v55;
        v34 = v248;
        if (v65)
          operator delete(v65);
LABEL_51:
        ++v37;
      }
      while (v37 != v35);
      v71 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v266, v273, 16);
      v35 = v71;
    }
    while (v71);
  }

  end = (char *)v245->_nodes.__map_.__end_;
  begin = (char *)v245->_nodes.__map_.__begin_;
  v74 = end - begin;
  if (end == begin)
    v75 = 0;
  else
    v75 = ((end - begin) << 6) - 1;
  start = v245->_nodes.__start_;
  value = v245->_nodes.__size_.__value_;
  v78 = value + start;
  if (v75 == value + start)
  {
    if (start >= 0x200)
    {
      v79 = v245;
      v245->_nodes.__start_ = start - 512;
      v82 = *(_QWORD *)begin;
      v81 = (Node ***)(begin + 8);
      v80 = v82;
      v245->_nodes.__map_.__begin_ = v81;
      if ((char *)v245->_nodes.__map_.__end_cap_.__value_ == end)
      {
        first = v245->_nodes.__map_.__first_;
        v84 = (char *)v81 - (char *)first;
        if (v81 <= first)
        {
          v111 = end - (char *)first;
          v220 = v111 == 0;
          v112 = v111 >> 2;
          if (v220)
            v113 = 1;
          else
            v113 = v112;
          v114 = (Node ***)std::__allocate_at_least[abi:ne180100]<std::allocator<Node **>>(v113);
          v116 = (char *)&v114[v113 >> 2];
          v117 = (char *)v245->_nodes.__map_.__begin_;
          end = v116;
          v118 = (char *)v245->_nodes.__map_.__end_ - v117;
          if (v118)
          {
            end = &v116[v118 & 0xFFFFFFFFFFFFFFF8];
            v119 = 8 * (v118 >> 3);
            v120 = &v114[v113 >> 2];
            do
            {
              v121 = *(Node ***)v117;
              v117 += 8;
              *v120++ = v121;
              v119 -= 8;
            }
            while (v119);
          }
          v79 = v245;
          v122 = v245->_nodes.__map_.__first_;
          v245->_nodes.__map_.__first_ = v114;
          v245->_nodes.__map_.__begin_ = (Node ***)v116;
          v245->_nodes.__map_.__end_ = (Node ***)end;
          v245->_nodes.__map_.__end_cap_.__value_ = &v114[v115];
          if (v122)
          {
            operator delete(v122);
            end = (char *)v245->_nodes.__map_.__end_;
          }
        }
        else
        {
          v85 = v84 >> 3;
          v86 = v84 >> 3 < -1;
          v87 = (v84 >> 3) + 2;
          if (v86)
            v88 = v87;
          else
            v88 = v85 + 1;
          v89 = -(v88 >> 1);
          v90 = v88 >> 1;
          v91 = &v81[-v90];
          v92 = end - (char *)v81;
          if (end == (char *)v81)
          {
            v93 = (Node ***)end;
            v79 = v245;
          }
          else
          {
            memmove(&v81[-v90], v81, end - (char *)v81);
            v79 = v245;
            v93 = v245->_nodes.__map_.__begin_;
          }
          end = (char *)v91 + v92;
          v79->_nodes.__map_.__begin_ = &v93[v89];
          v79->_nodes.__map_.__end_ = (Node ***)((char *)v91 + v92);
        }
      }
      *(_QWORD *)end = v80;
LABEL_141:
      ++v79->_nodes.__map_.__end_;
LABEL_142:
      begin = (char *)v79->_nodes.__map_.__begin_;
      value = v79->_nodes.__size_.__value_;
      v78 = v79->_nodes.__start_ + value;
      goto LABEL_143;
    }
    v95 = v74 >> 3;
    v96 = v245->_nodes.__map_.__end_cap_.__value_;
    v97 = v245->_nodes.__map_.__first_;
    v98 = (char *)v96 - (char *)v97;
    if (v74 >> 3 < (unint64_t)(v96 - v97))
    {
      if (v96 == (Node ***)end)
      {
        v123 = operator new(0x1000uLL);
        if (v97 == (Node ***)begin)
        {
          if (end == begin)
            v124 = 1;
          else
            v124 = v98 >> 2;
          v125 = (Node ***)std::__allocate_at_least[abi:ne180100]<std::allocator<Node **>>(v124);
          begin = (char *)v125 + ((2 * v124 + 6) & 0xFFFFFFFFFFFFFFF8);
          v127 = (char *)v245->_nodes.__map_.__begin_;
          v128 = (Node ***)begin;
          v129 = (char *)v245->_nodes.__map_.__end_ - v127;
          if (v129)
          {
            v128 = (Node ***)&begin[v129 & 0xFFFFFFFFFFFFFFF8];
            v130 = 8 * (v129 >> 3);
            v131 = begin;
            do
            {
              v132 = *(_QWORD *)v127;
              v127 += 8;
              *(_QWORD *)v131 = v132;
              v131 += 8;
              v130 -= 8;
            }
            while (v130);
          }
          v133 = v245->_nodes.__map_.__first_;
          v245->_nodes.__map_.__first_ = v125;
          v245->_nodes.__map_.__begin_ = (Node ***)begin;
          v245->_nodes.__map_.__end_ = v128;
          v245->_nodes.__map_.__end_cap_.__value_ = &v125[v126];
          if (v133)
          {
            operator delete(v133);
            begin = (char *)v245->_nodes.__map_.__begin_;
          }
        }
        *((_QWORD *)begin - 1) = v123;
        v79 = v245;
        v134 = v245->_nodes.__map_.__begin_;
        v135 = v245->_nodes.__map_.__end_;
        v245->_nodes.__map_.__begin_ = v134 - 1;
        v136 = *(v134 - 1);
        v245->_nodes.__map_.__begin_ = v134;
        if (v135 == v245->_nodes.__map_.__end_cap_.__value_)
        {
          v137 = v245->_nodes.__map_.__first_;
          v138 = (char *)v134 - (char *)v137;
          if (v134 <= v137)
          {
            v229 = (char *)v135 - (char *)v137;
            v220 = v229 == 0;
            v230 = v229 >> 2;
            if (v220)
              v231 = 1;
            else
              v231 = v230;
            v232 = (Node ***)std::__allocate_at_least[abi:ne180100]<std::allocator<Node **>>(v231);
            v234 = &v232[v231 >> 2];
            v235 = (char *)v245->_nodes.__map_.__begin_;
            v135 = v234;
            v236 = (char *)v245->_nodes.__map_.__end_ - v235;
            if (v236)
            {
              v135 = (Node ***)((char *)v234 + (v236 & 0xFFFFFFFFFFFFFFF8));
              v237 = 8 * (v236 >> 3);
              v238 = &v232[v231 >> 2];
              do
              {
                v239 = *(Node ***)v235;
                v235 += 8;
                *v238++ = v239;
                v237 -= 8;
              }
              while (v237);
            }
            v79 = v245;
            v240 = v245->_nodes.__map_.__first_;
            v245->_nodes.__map_.__first_ = v232;
            v245->_nodes.__map_.__begin_ = v234;
            v245->_nodes.__map_.__end_ = v135;
            v245->_nodes.__map_.__end_cap_.__value_ = &v232[v233];
            if (v240)
            {
              operator delete(v240);
              v135 = v245->_nodes.__map_.__end_;
            }
          }
          else
          {
            v139 = v138 >> 3;
            v86 = v138 >> 3 < -1;
            v140 = (v138 >> 3) + 2;
            if (v86)
              v141 = v140;
            else
              v141 = v139 + 1;
            v142 = -(v141 >> 1);
            v143 = v141 >> 1;
            v144 = &v134[-v143];
            v145 = (char *)v135 - (char *)v134;
            if (v135 == v134)
            {
              v79 = v245;
            }
            else
            {
              memmove(&v134[-v143], v134, (char *)v135 - (char *)v134);
              v79 = v245;
              v134 = v245->_nodes.__map_.__begin_;
            }
            v135 = (Node ***)((char *)v144 + v145);
            v79->_nodes.__map_.__begin_ = &v134[v142];
            v79->_nodes.__map_.__end_ = (Node ***)((char *)v144 + v145);
          }
        }
        *v135 = v136;
      }
      else
      {
        *(_QWORD *)end = operator new(0x1000uLL);
        v79 = v245;
      }
      goto LABEL_141;
    }
    if (v96 == v97)
      v99 = 1;
    else
      v99 = v98 >> 2;
    v100 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Node **>>(v99);
    v102 = v101;
    v103 = &v100[8 * v95];
    *(_QWORD *)&v104 = v100;
    *((_QWORD *)&v104 + 1) = v103;
    v249 = v104;
    v105 = operator new(0x1000uLL);
    *(_QWORD *)&v106 = v103;
    *((_QWORD *)&v106 + 1) = &v100[8 * v102];
    if (v95 == v102)
    {
      v107 = 8 * v95;
      *(_QWORD *)&v108 = v249;
      if (v74 >= 1)
      {
        v109 = v107 >> 3;
        if (v109 >= -1)
          v110 = v109 + 1;
        else
          v110 = v109 + 2;
        v103 -= 8 * (v110 >> 1);
        *(_QWORD *)&v106 = v103;
        *((_QWORD *)&v108 + 1) = v103;
        goto LABEL_115;
      }
      v146 = v107 >> 2;
      if (end == begin)
        v147 = 1;
      else
        v147 = v146;
      v148 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Node **>>(v147);
      v103 = &v148[8 * (v147 >> 2)];
      *(_QWORD *)&v108 = v148;
      *((_QWORD *)&v108 + 1) = v103;
      *(_QWORD *)&v106 = v103;
      *((_QWORD *)&v106 + 1) = &v148[8 * v149];
      if (!v100)
        goto LABEL_115;
      v249 = v108;
      v242 = v106;
      operator delete(v100);
      v106 = v242;
    }
    v108 = v249;
LABEL_115:
    *(_QWORD *)v103 = v105;
    *(_QWORD *)&v106 = v106 + 8;
    for (j = v245->_nodes.__map_.__end_; j != v245->_nodes.__map_.__begin_; --j)
    {
      v151 = (_QWORD *)*((_QWORD *)&v108 + 1);
      if (*((_QWORD *)&v108 + 1) == (_QWORD)v108)
      {
        v153 = (_BYTE *)v106;
        if ((unint64_t)v106 >= *((_QWORD *)&v106 + 1))
        {
          if (*((_QWORD *)&v106 + 1) == *((_QWORD *)&v108 + 1))
            v158 = 1;
          else
            v158 = (uint64_t)(*((_QWORD *)&v106 + 1) - *((_QWORD *)&v108 + 1)) >> 2;
          v159 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<Node **>>(v158);
          v152 = &v159[(2 * v158 + 6) & 0xFFFFFFFFFFFFFFF8];
          v161 = v152;
          v162 = v153 - (_BYTE *)v151;
          if (v153 != (_BYTE *)v151)
          {
            v161 = &v152[v162 & 0xFFFFFFFFFFFFFFF8];
            v163 = 8 * (v162 >> 3);
            v164 = v152;
            v165 = v151;
            do
            {
              v166 = *v165++;
              *(_QWORD *)v164 = v166;
              v164 += 8;
              v163 -= 8;
            }
            while (v163);
          }
          *(_QWORD *)&v108 = v159;
          *((_QWORD *)&v108 + 1) = v152;
          *(_QWORD *)&v106 = v161;
          *((_QWORD *)&v106 + 1) = &v159[8 * v160];
          if (v151)
          {
            v251 = v108;
            v243 = v106;
            operator delete(v151);
            v106 = v243;
            v108 = v251;
          }
        }
        else
        {
          v154 = (uint64_t)(*((_QWORD *)&v106 + 1) - v106) >> 3;
          if (v154 >= -1)
            v155 = v154 + 1;
          else
            v155 = v154 + 2;
          v156 = v155 >> 1;
          v157 = v106 + 8 * (v155 >> 1);
          v152 = (char *)(v157 - (v106 - *((_QWORD *)&v108 + 1)));
          if ((_QWORD)v106 == *((_QWORD *)&v108 + 1))
          {
            v153 = (_BYTE *)*((_QWORD *)&v108 + 1);
          }
          else
          {
            v250 = v108;
            v244 = *((_QWORD *)&v106 + 1);
            memmove((void *)(v157 - (v106 - *((_QWORD *)&v108 + 1))), *((const void **)&v108 + 1), v106 - *((_QWORD *)&v108 + 1));
            *((_QWORD *)&v106 + 1) = v244;
            *(_QWORD *)&v108 = v250;
          }
          *((_QWORD *)&v108 + 1) = v152;
          *(_QWORD *)&v106 = &v153[8 * v156];
        }
      }
      else
      {
        v152 = (char *)*((_QWORD *)&v108 + 1);
      }
      v167 = (uint64_t)*(j - 1);
      *((_QWORD *)v152 - 1) = v167;
      *((_QWORD *)&v108 + 1) -= 8;
    }
    v79 = v245;
    v168 = v245->_nodes.__map_.__first_;
    *(_OWORD *)&v245->_nodes.__map_.__first_ = v108;
    *(_OWORD *)&v245->_nodes.__map_.__end_ = v106;
    if (v168)
      operator delete(v168);
    goto LABEL_142;
  }
  v79 = v245;
LABEL_143:
  v169 = (v78 >> 6) & 0x3FFFFFFFFFFFFF8;
  v170 = v78 & 0x1FF;
  *(_QWORD *)(*(_QWORD *)&begin[v169] + v170 * 8) = v15;
  v79->_nodes.__size_.__value_ = value + 1;
  v171 = (double **)*((_QWORD *)(*(Node ***)((char *)v79->_nodes.__map_.__begin_ + v169))[v170] + 2);
  v257 = 0u;
  v258 = 0u;
  v259 = 0u;
  v260 = 0u;
  v172 = v79->_elementsNames;
  v173 = -[NSArray countByEnumeratingWithState:objects:count:](v172, "countByEnumeratingWithState:objects:count:", &v257, v271, 16);
  if (v173)
  {
    v174 = *(_QWORD *)v258;
    do
    {
      for (k = 0; k != v173; ++k)
      {
        if (*(_QWORD *)v258 != v174)
          objc_enumerationMutation(v172);
        std::string::basic_string[abi:ne180100]<0>(v273, (char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v257 + 1) + 8 * k)), "UTF8String"));
        *(_QWORD *)&v266 = v273;
        v176 = (uint64_t **)*((_QWORD *)std::__tree<std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>,std::__map_value_compare<std::string,std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&v245->_sets, v273, (_OWORD **)&v266)+ 7);
        v177 = (uint64_t *)operator new(0x28uLL);
        v178 = v177;
        v179 = *v171;
        v177[4] = (uint64_t)*v171;
        v180 = v176 + 1;
        v181 = (uint64_t **)v176[1];
        if (v181)
        {
          v182 = *v179;
          do
          {
            while (1)
            {
              v180 = v181;
              if (v182 >= *(double *)v181[4])
                break;
              v181 = (uint64_t **)*v181;
              v183 = v180;
              if (!*v180)
                goto LABEL_156;
            }
            v181 = (uint64_t **)v181[1];
          }
          while (v181);
          v183 = v180 + 1;
        }
        else
        {
          v183 = v176 + 1;
        }
LABEL_156:
        *v177 = 0;
        v177[1] = 0;
        v177[2] = (uint64_t)v180;
        *v183 = v177;
        v184 = (uint64_t *)**v176;
        v185 = v177;
        if (v184)
        {
          *v176 = v184;
          v185 = *v183;
        }
        std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v176[1], v185);
        v176[2] = (uint64_t *)((char *)v176[2] + 1);
        if (v274 < 0)
          operator delete(v273[0]);
        v186 = (uint64_t)*v171++;
        *(_QWORD *)(v186 + 8) = v178;
      }
      v173 = -[NSArray countByEnumeratingWithState:objects:count:](v172, "countByEnumeratingWithState:objects:count:", &v257, v271, 16);
    }
    while (v173);
  }

  v187 = v245->_nodes.__size_.__value_;
  if (v187 <= -[ADInterSessionFilterParameters capacity](v245->_params, "capacity"))
    goto LABEL_255;
  v188 = (*(Node ***)((char *)v245->_nodes.__map_.__begin_ + ((v245->_nodes.__start_ >> 6) & 0x3FFFFFFFFFFFFF8)))[v245->_nodes.__start_ & 0x1FF];
  v189 = *((_QWORD *)v188 + 2);
  v253 = 0u;
  v254 = 0u;
  v255 = 0u;
  v256 = 0u;
  v190 = v245->_elementsNames;
  v191 = -[NSArray countByEnumeratingWithState:objects:count:](v190, "countByEnumeratingWithState:objects:count:", &v253, v270, 16);
  if (!v191)
  {

    goto LABEL_253;
  }
  v192 = *(_QWORD *)v254;
  do
  {
    for (m = 0; m != v191; ++m)
    {
      if (*(_QWORD *)v254 != v192)
        objc_enumerationMutation(v190);
      std::string::basic_string[abi:ne180100]<0>(v273, (char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v253 + 1) + 8 * m)), "UTF8String"));
      *(_QWORD *)&v266 = v273;
      v194 = std::__tree<std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>,std::__map_value_compare<std::string,std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&v245->_sets, v273, (_OWORD **)&v266);
      v195 = *(_QWORD **)(*(_QWORD *)v189 + 8);
      v196 = (_QWORD *)v195[1];
      v197 = v195;
      if (v196)
      {
        do
        {
          v198 = v196;
          v196 = (_QWORD *)*v196;
        }
        while (v196);
      }
      else
      {
        do
        {
          v198 = (_QWORD *)v197[2];
          v220 = *v198 == (_QWORD)v197;
          v197 = v198;
        }
        while (!v220);
      }
      v199 = (void **)*((_QWORD *)v194 + 7);
      if (*v199 == v195)
        *v199 = v198;
      v200 = v199[1];
      v199[2] = (char *)v199[2] - 1;
      v201 = *v195;
      v202 = v195;
      if (*v195)
      {
        v203 = (_QWORD *)v195[1];
        if (!v203)
        {
          v202 = v195;
LABEL_181:
          v204 = 0;
          *(_QWORD *)(v201 + 16) = v202[2];
          goto LABEL_182;
        }
        do
        {
          v202 = v203;
          v203 = (_QWORD *)*v203;
        }
        while (v203);
      }
      v201 = v202[1];
      if (v201)
        goto LABEL_181;
      v204 = 1;
LABEL_182:
      v205 = (_QWORD *)v202[2];
      v206 = (_QWORD *)*v205;
      if ((_QWORD *)*v205 == v202)
      {
        *v205 = v201;
        if (v202 == v200)
        {
          v206 = 0;
          v200 = (_QWORD *)v201;
        }
        else
        {
          v206 = (_QWORD *)v205[1];
        }
      }
      else
      {
        v205[1] = v201;
      }
      v207 = *((unsigned __int8 *)v202 + 24);
      if (v202 != v195)
      {
        v208 = v195[2];
        v202[2] = v208;
        *(_QWORD *)(v208 + 8 * (*(_QWORD *)v195[2] != (_QWORD)v195)) = v202;
        v209 = *v195;
        *v202 = *v195;
        *(_QWORD *)(v209 + 16) = v202;
        v210 = v195[1];
        v202[1] = v210;
        if (v210)
          *(_QWORD *)(v210 + 16) = v202;
        *((_BYTE *)v202 + 24) = *((_BYTE *)v195 + 24);
        if (v200 == v195)
          v200 = v202;
      }
      if (!v207 || !v200)
        goto LABEL_246;
      if (!v204)
      {
        *(_BYTE *)(v201 + 24) = 1;
        goto LABEL_246;
      }
      while (1)
      {
        v211 = v206[2];
        if (*(_QWORD **)v211 != v206)
          break;
        if (!*((_BYTE *)v206 + 24))
        {
          *((_BYTE *)v206 + 24) = 1;
          *(_BYTE *)(v211 + 24) = 0;
          v217 = v206[1];
          *(_QWORD *)v211 = v217;
          if (v217)
            *(_QWORD *)(v217 + 16) = v211;
          v206[2] = *(_QWORD *)(v211 + 16);
          *(_QWORD *)(*(_QWORD *)(v211 + 16) + 8 * (**(_QWORD **)(v211 + 16) != v211)) = v206;
          v206[1] = v211;
          *(_QWORD *)(v211 + 16) = v206;
          if (v200 == (_QWORD *)v211)
            v200 = v206;
          v206 = *(_QWORD **)v211;
        }
        v218 = (_BYTE *)*v206;
        if (*v206 && !v218[24])
          goto LABEL_241;
        v219 = (uint64_t *)v206[1];
        if (v219 && !*((_BYTE *)v219 + 24))
        {
          if (v218 && !v218[24])
          {
LABEL_241:
            v219 = v206;
          }
          else
          {
            *((_BYTE *)v219 + 24) = 1;
            *((_BYTE *)v206 + 24) = 0;
            v225 = *v219;
            v206[1] = *v219;
            if (v225)
              *(_QWORD *)(v225 + 16) = v206;
            v219[2] = v206[2];
            *(_QWORD *)(v206[2] + 8 * (*(_QWORD *)v206[2] != (_QWORD)v206)) = v219;
            *v219 = (uint64_t)v206;
            v206[2] = v219;
            v218 = v206;
          }
          v222 = v219[2];
          *((_BYTE *)v219 + 24) = *(_BYTE *)(v222 + 24);
          *(_BYTE *)(v222 + 24) = 1;
          v218[24] = 1;
          v223 = *(uint64_t **)v222;
          v226 = *(_QWORD *)(*(_QWORD *)v222 + 8);
          *(_QWORD *)v222 = v226;
          if (v226)
            *(_QWORD *)(v226 + 16) = v222;
          v223[2] = *(_QWORD *)(v222 + 16);
          *(_QWORD *)(*(_QWORD *)(v222 + 16) + 8 * (**(_QWORD **)(v222 + 16) != v222)) = v223;
          v223[1] = v222;
          goto LABEL_245;
        }
        *((_BYTE *)v206 + 24) = 0;
        v216 = (_BYTE *)v206[2];
        if (v216[24])
          v220 = v216 == (_BYTE *)v200;
        else
          v220 = 1;
        if (v220)
          goto LABEL_226;
LABEL_223:
        v206 = *(_QWORD **)(*((_QWORD *)v216 + 2) + 8 * (**((_QWORD **)v216 + 2) == (_QWORD)v216));
      }
      if (!*((_BYTE *)v206 + 24))
      {
        *((_BYTE *)v206 + 24) = 1;
        *(_BYTE *)(v211 + 24) = 0;
        v212 = *(uint64_t **)(v211 + 8);
        v213 = *v212;
        *(_QWORD *)(v211 + 8) = *v212;
        if (v213)
          *(_QWORD *)(v213 + 16) = v211;
        v212[2] = *(_QWORD *)(v211 + 16);
        *(_QWORD *)(*(_QWORD *)(v211 + 16) + 8 * (**(_QWORD **)(v211 + 16) != v211)) = v212;
        *v212 = v211;
        *(_QWORD *)(v211 + 16) = v212;
        if (v200 == (_QWORD *)*v206)
          v200 = v206;
        v206 = *(_QWORD **)(*v206 + 8);
      }
      v214 = (_QWORD *)*v206;
      if (!*v206 || *((_BYTE *)v214 + 24))
      {
        v215 = (_QWORD *)v206[1];
        if (v215 && !*((_BYTE *)v215 + 24))
          goto LABEL_232;
        *((_BYTE *)v206 + 24) = 0;
        v216 = (_BYTE *)v206[2];
        if (v216 == (_BYTE *)v200)
        {
          v216 = v200;
LABEL_226:
          v216[24] = 1;
          goto LABEL_246;
        }
        if (!v216[24])
          goto LABEL_226;
        goto LABEL_223;
      }
      v215 = (_QWORD *)v206[1];
      if (v215 && !*((_BYTE *)v215 + 24))
      {
LABEL_232:
        v214 = v206;
      }
      else
      {
        *((_BYTE *)v214 + 24) = 1;
        *((_BYTE *)v206 + 24) = 0;
        v221 = v214[1];
        *v206 = v221;
        if (v221)
          *(_QWORD *)(v221 + 16) = v206;
        v214[2] = v206[2];
        *(_QWORD *)(v206[2] + 8 * (*(_QWORD *)v206[2] != (_QWORD)v206)) = v214;
        v214[1] = v206;
        v206[2] = v214;
        v215 = v206;
      }
      v222 = v214[2];
      *((_BYTE *)v214 + 24) = *(_BYTE *)(v222 + 24);
      *(_BYTE *)(v222 + 24) = 1;
      *((_BYTE *)v215 + 24) = 1;
      v223 = *(uint64_t **)(v222 + 8);
      v224 = *v223;
      *(_QWORD *)(v222 + 8) = *v223;
      if (v224)
        *(_QWORD *)(v224 + 16) = v222;
      v223[2] = *(_QWORD *)(v222 + 16);
      *(_QWORD *)(*(_QWORD *)(v222 + 16) + 8 * (**(_QWORD **)(v222 + 16) != v222)) = v223;
      *v223 = v222;
LABEL_245:
      *(_QWORD *)(v222 + 16) = v223;
LABEL_246:
      operator delete(v195);
      if (v274 < 0)
        operator delete(v273[0]);
      v189 += 8;
    }
    v191 = -[NSArray countByEnumeratingWithState:objects:count:](v190, "countByEnumeratingWithState:objects:count:", &v253, v270, 16);
  }
  while (v191);

  if (v188)
  {
LABEL_253:
    Node::~Node(v188);
    MEMORY[0x23B7F1D64]();
  }
  v227 = vaddq_s64(*(int64x2_t *)&v245->_nodes.__start_, (int64x2_t)xmmword_2363DF660);
  *(int64x2_t *)&v245->_nodes.__start_ = v227;
  if (v227.i64[0] >= 0x400uLL)
  {
    operator delete(*(void **)v245->_nodes.__map_.__begin_);
    v94 = 0;
    ++v245->_nodes.__map_.__begin_;
    v245->_nodes.__start_ -= 512;
  }
  else
  {
LABEL_255:
    v94 = 0;
  }
LABEL_257:

  return v94;
}

- (id)calculate
{
  unint64_t value;
  void *v4;
  uint64_t v5;

  value = self->_nodes.__size_.__value_;
  if (value >= -[ADInterSessionFilterParameters minimalEntriesForResult](self->_params, "minimalEntriesForResult"))
  {
    if (-[ADInterSessionFilterParameters isStepDetectionActive](self->_params, "isStepDetectionActive"))
      v5 = -[ADInterSessionFilter stepDetection](self, "stepDetection");
    else
      v5 = 0;
    -[ADInterSessionFilter markInStep:](self, "markInStep:", v5);
    -[ADInterSessionFilter markOutliers:](self, "markOutliers:", v5);
    -[ADInterSessionFilter setOnlineWeights:](self, "setOnlineWeights:", v5);
    -[ADInterSessionFilter calculateInterSessionFilterResultFromIndex:](self, "calculateInterSessionFilterResultFromIndex:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)setOnlineWeights:(unsigned int)a3
{
  unint64_t value;
  unsigned int v4;
  uint64_t v6;
  unint64_t start;
  Node ***begin;
  Node *v9;
  uint64_t v10;
  uint64_t v11;
  float v12;

  value = self->_nodes.__size_.__value_;
  if (value > a3)
  {
    v4 = a3;
    v6 = a3;
    start = self->_nodes.__start_;
    begin = self->_nodes.__map_.__begin_;
    do
    {
      v9 = (*(Node ***)((char *)begin + (((start + v6) >> 6) & 0x3FFFFFFFFFFFFF8)))[(start + v6) & 0x1FF];
      *((_QWORD *)v9 + 1) = *(_QWORD *)v9;
      v10 = *((_QWORD *)v9 + 2);
      v11 = *((_QWORD *)v9 + 3);
      while (v10 != v11)
      {
        if (*(_BYTE *)(*(_QWORD *)v10 + 16))
        {
          -[ADInterSessionFilterParameters outlierWeight](self->_params, "outlierWeight");
          start = self->_nodes.__start_;
          value = self->_nodes.__size_.__value_;
          begin = self->_nodes.__map_.__begin_;
          *((double *)(*(Node ***)((char *)begin + (((start + v6) >> 6) & 0x3FFFFFFFFFFFFF8)))[(start + v6) & 0x1FF]
          + 1) = v12;
          break;
        }
        v10 += 8;
      }
      v6 = ++v4;
    }
    while (value > v4);
  }
}

- (id)insertEntryAndCalculate:(id)a3 withWeight:(double)a4
{
  id v6;
  void *v7;

  v6 = a3;
  if (-[ADInterSessionFilter insertEntry:withWeight:](self, "insertEntry:withWeight:", v6, a4))
  {
    v7 = 0;
  }
  else
  {
    -[ADInterSessionFilter calculate](self, "calculate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (unsigned)stepDetection
{
  uint64_t v3;

  v3 = -[ADInterSessionFilter kIndexCandidate](self, "kIndexCandidate");
  if (-[ADInterSessionFilter TtestStepWithCandidate:](self, "TtestStepWithCandidate:", v3))
    return v3;
  else
    return 0;
}

- (void)markInStep:(unsigned int)a3
{
  unint64_t value;
  uint64_t v4;
  unint64_t start;
  Node ***begin;
  Node *v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t v10;

  value = self->_nodes.__size_.__value_;
  if (value > a3)
  {
    v4 = a3;
    start = self->_nodes.__start_;
    begin = self->_nodes.__map_.__begin_;
    do
    {
      v7 = (*(Node ***)((char *)begin + (((start + v4) >> 6) & 0x3FFFFFFFFFFFFF8)))[(start + v4) & 0x1FF];
      v8 = (uint64_t *)*((_QWORD *)v7 + 2);
      v9 = (uint64_t *)*((_QWORD *)v7 + 3);
      while (v8 != v9)
      {
        v10 = *v8++;
        *(_BYTE *)(v10 + 17) = 1;
      }
      v4 = ++a3;
    }
    while (value > a3);
  }
}

- (int64_t)markOutliers:(unsigned int)a3
{
  unsigned int v5;
  unint64_t value;
  uint64_t v7;
  unsigned int v8;
  uint64_t **p_sets;
  uint64_t i;
  id v11;
  _QWORD *v12;
  id v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  _QWORD *v17;
  unsigned int v18;
  uint64_t v19;
  _QWORD *v20;
  _QWORD *v21;
  BOOL v22;
  _QWORD *v23;
  unsigned int v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD *v32;
  NSArray *obj;
  uint64_t v35;
  void *__p[2];
  char v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  void **v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = -[ADInterSessionFilterParameters outlierNumber](self->_params, "outlierNumber");
  value = self->_nodes.__size_.__value_;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = self->_elementsNames;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v7)
  {
    v8 = vcvtpd_u64_f64((double)v5 * (double)(value - a3) / (double)value);
    v35 = *(_QWORD *)v39;
    p_sets = (uint64_t **)&self->_sets;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v39 != v35)
          objc_enumerationMutation(obj);
        v11 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i));
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v11, "UTF8String"));
        v42 = __p;
        v12 = (_QWORD *)**((_QWORD **)std::__tree<std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>,std::__map_value_compare<std::string,std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(p_sets, __p, (_OWORD **)&v42)+ 7);
        if (v37 < 0)
          operator delete(__p[0]);
        v13 = objc_retainAutorelease(v11);
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v13, "UTF8String"));
        v42 = __p;
        v14 = *((_QWORD *)std::__tree<std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>,std::__map_value_compare<std::string,std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(p_sets, __p, (_OWORD **)&v42)+ 7);
        if (v37 < 0)
          operator delete(__p[0]);
        v15 = objc_retainAutorelease(v13);
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v15, "UTF8String"));
        v42 = __p;
        v16 = *((_QWORD *)std::__tree<std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>,std::__map_value_compare<std::string,std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(p_sets, __p, (_OWORD **)&v42)+ 7);
        if (v37 < 0)
          operator delete(__p[0]);
        std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(v15), "UTF8String"));
        v42 = __p;
        v17 = (_QWORD *)**((_QWORD **)std::__tree<std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>,std::__map_value_compare<std::string,std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(p_sets, __p, (_OWORD **)&v42)+ 7);
        if (v37 < 0)
          operator delete(__p[0]);
        if (v12 != (_QWORD *)(v14 + 8) && v8)
        {
          v18 = 0;
          do
          {
            v19 = v12[4];
            if (*(_BYTE *)(v19 + 17))
            {
              *(_BYTE *)(v19 + 16) = 1;
              ++v18;
            }
            v20 = (_QWORD *)v12[1];
            if (v20)
            {
              do
              {
                v21 = v20;
                v20 = (_QWORD *)*v20;
              }
              while (v20);
            }
            else
            {
              do
              {
                v21 = (_QWORD *)v12[2];
                v22 = *v21 == (_QWORD)v12;
                v12 = v21;
              }
              while (!v22);
            }
            if (v21 == (_QWORD *)(v14 + 8))
              break;
            v12 = v21;
          }
          while (v18 < v8);
        }
        v23 = (_QWORD *)(v16 + 8);
        if ((_QWORD *)(v16 + 8) != v17 && v8)
        {
          v24 = 0;
          do
          {
            v25 = (_QWORD *)*v23;
            v26 = (_QWORD *)*v23;
            v27 = v23;
            if (*v23)
            {
              do
              {
                v28 = v26;
                v26 = (_QWORD *)v26[1];
              }
              while (v26);
            }
            else
            {
              do
              {
                v28 = (_QWORD *)v27[2];
                v22 = *v28 == (_QWORD)v27;
                v27 = v28;
              }
              while (v22);
            }
            if (*(_BYTE *)(v28[4] + 17))
            {
              v29 = (_QWORD *)*v23;
              v30 = v23;
              if (v25)
              {
                do
                {
                  v31 = v29;
                  v29 = (_QWORD *)v29[1];
                }
                while (v29);
              }
              else
              {
                do
                {
                  v31 = (_QWORD *)v30[2];
                  v22 = *v31 == (_QWORD)v30;
                  v30 = v31;
                }
                while (v22);
              }
              *(_BYTE *)(v31[4] + 16) = 1;
              ++v24;
            }
            if (v25)
            {
              do
              {
                v32 = v25;
                v25 = (_QWORD *)v25[1];
              }
              while (v25);
            }
            else
            {
              do
              {
                v32 = (_QWORD *)v23[2];
                v22 = *v32 == (_QWORD)v23;
                v23 = v32;
              }
              while (v22);
            }
            if (v32 == v17)
              break;
            v23 = v32;
          }
          while (v24 < v8);
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v7);
  }

  return 0;
}

- (id)calculateInterSessionFilterResultFromIndex:(unsigned int)a3
{
  uint64_t v5;
  void *v6;
  unint64_t value;
  uint64_t v8;
  unint64_t start;
  Node ***begin;
  Node *v11;
  double **v12;
  int v13;
  double *v14;
  double *weightedAverage;
  uint64_t i;
  void *v17;
  void *v18;

  v5 = -[NSArray count](self->_elementsNames, "count");
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", v5);
  bzero(self->_weightedAverage, 8 * v5);
  bzero(self->_sumOfWeights, 8 * v5);
  value = self->_nodes.__size_.__value_;
  if (value > a3)
  {
    v8 = a3;
    start = self->_nodes.__start_;
    begin = self->_nodes.__map_.__begin_;
    do
    {
      v11 = (*(Node ***)((char *)begin + (((start + v8) >> 6) & 0x3FFFFFFFFFFFFF8)))[(start + v8) & 0x1FF];
      v12 = (double **)*((_QWORD *)v11 + 2);
      if (v12 != *((double ***)v11 + 3))
      {
        v13 = 0;
        do
        {
          v14 = *v12;
          if (!*((_BYTE *)*v12 + 16))
          {
            weightedAverage = self->_weightedAverage;
            self->_sumOfWeights[v13] = *((double *)v11 + 1) + self->_sumOfWeights[v13];
            weightedAverage[v13] = weightedAverage[v13] + *v14 * *((double *)v11 + 1);
          }
          -[ADInterSessionFilter resetElementFlags:](self, "resetElementFlags:");
          ++v13;
          start = self->_nodes.__start_;
          begin = self->_nodes.__map_.__begin_;
          ++v12;
          v11 = (*(Node ***)((char *)begin + (((start + v8) >> 6) & 0x3FFFFFFFFFFFFF8)))[(start + v8) & 0x1FF];
        }
        while (v12 != *((double ***)v11 + 3));
        value = self->_nodes.__size_.__value_;
      }
      v8 = ++a3;
    }
    while (value > a3);
  }
  if (v5)
  {
    for (i = 0; i != v5; ++i)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_weightedAverage[i] / self->_sumOfWeights[i]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_elementsNames, "objectAtIndexedSubscript:", i);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, v18);

    }
  }
  return v6;
}

- (void)resetElementFlags:(void *)a3
{
  *((_WORD *)a3 + 8) = 0;
}

- (double)samplesMeanFromIndex:(unsigned int)a3 ToIndex:(unsigned int)a4 ByElement:(unsigned int)a5
{
  double v5;
  double i;
  Node *v7;

  v5 = 0.0;
  for (i = 0.0; a3 <= a4; ++a3)
  {
    v7 = (*(Node ***)((char *)self->_nodes.__map_.__begin_ + (((self->_nodes.__start_ + a3) >> 6) & 0x3FFFFFFFFFFFFF8)))[(self->_nodes.__start_ + a3) & 0x1FF];
    if (v7)
    {
      i = i + *(double *)v7 * **(double **)(*((_QWORD *)v7 + 2) + 8 * a5);
      v5 = v5 + *(double *)v7;
    }
  }
  if (v5 < 1.0e-20)
    v5 = 1.0e-20;
  return i / v5;
}

- (double)L2FromIndex:(unsigned int)a3 ToIndex:(unsigned int)a4 ByElement:(unsigned int)a5 WithMean:(double)a6
{
  double i;
  Node *v7;
  double v8;
  double *v9;

  for (i = 0.0; a3 <= a4; ++a3)
  {
    v7 = (*(Node ***)((char *)self->_nodes.__map_.__begin_ + (((self->_nodes.__start_ + a3) >> 6) & 0x3FFFFFFFFFFFFF8)))[(self->_nodes.__start_ + a3) & 0x1FF];
    if (v7)
    {
      v8 = *(double *)v7;
      v9 = *(double **)(*((_QWORD *)v7 + 2) + 8 * a5);
      i = i + v8 * ((*v9 - a6) * (*v9 - a6));
    }
  }
  return i;
}

- (double)LossFromIndex:(unsigned int)a3 ToIndex:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  double v7;
  unsigned int v8;
  double v9;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v7 = 0.0;
  if (-[NSArray count](self->_elementsNames, "count"))
  {
    v8 = 1;
    do
    {
      -[ADInterSessionFilter samplesMeanFromIndex:ToIndex:ByElement:](self, "samplesMeanFromIndex:ToIndex:ByElement:", v5, v4, v8 - 1);
      -[ADInterSessionFilter L2FromIndex:ToIndex:ByElement:WithMean:](self, "L2FromIndex:ToIndex:ByElement:WithMean:", v5, v4, v8 - 1);
      v7 = v7 + v9;
    }
    while (-[NSArray count](self->_elementsNames, "count") > v8++);
  }
  return v7;
}

- (double)SLFromIndex:(unsigned int)a3
{
  uint64_t v3;
  double v5;
  double v6;
  double v7;

  v3 = *(_QWORD *)&a3;
  -[ADInterSessionFilter LossFromIndex:ToIndex:](self, "LossFromIndex:ToIndex:", 0, a3 - 1);
  v6 = v5;
  -[ADInterSessionFilter LossFromIndex:ToIndex:](self, "LossFromIndex:ToIndex:", v3, (LODWORD(self->_nodes.__size_.__value_) - 1));
  return v6 + v7;
}

- (unsigned)kIndexCandidate
{
  unsigned int v3;
  int value;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;

  v3 = -[ADInterSessionFilterParameters minStepIndex](self->_params, "minStepIndex");
  value = self->_nodes.__size_.__value_;
  v5 = ~-[ADInterSessionFilterParameters minStepSize](self->_params, "minStepSize") + value;
  v6 = -[ADInterSessionFilterParameters minStepIndex](self->_params, "minStepIndex");
  if (v6 <= v5)
  {
    v7 = v6;
    v8 = 1.0e20;
    do
    {
      -[ADInterSessionFilter SLFromIndex:](self, "SLFromIndex:", v7);
      if (v9 < v8)
      {
        v8 = v9;
        v3 = v7;
      }
      v7 = (v7 + 1);
    }
    while (v7 <= v5);
  }
  return v3;
}

- (double)V1FromIndex:(unsigned int)a3 ToIndex:(unsigned int)a4
{
  double result;
  Node *v5;

  for (result = 0.0; a3 <= a4; ++a3)
  {
    v5 = (*(Node ***)((char *)self->_nodes.__map_.__begin_ + (((self->_nodes.__start_ + a3) >> 6) & 0x3FFFFFFFFFFFFF8)))[(self->_nodes.__start_ + a3) & 0x1FF];
    if (v5)
      result = result + *(double *)v5;
  }
  if (result < 1.0e-20)
    return 1.0e-20;
  return result;
}

- (double)V2FromIndex:(unsigned int)a3 ToIndex:(unsigned int)a4
{
  double result;
  Node *v5;

  for (result = 0.0; a3 <= a4; ++a3)
  {
    v5 = (*(Node ***)((char *)self->_nodes.__map_.__begin_ + (((self->_nodes.__start_ + a3) >> 6) & 0x3FFFFFFFFFFFFF8)))[(self->_nodes.__start_ + a3) & 0x1FF];
    if (v5)
      result = result + *(double *)v5 * *(double *)v5;
  }
  return result;
}

- (double)samplesVarianceFromIndex:(unsigned int)a3 ToIndex:(unsigned int)a4 ByElement:(unsigned int)a5 WithMean:(double)a6
{
  uint64_t v6;
  uint64_t v7;
  double v9;
  unsigned int v10;
  Node *v11;
  double v12;
  double *v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v6 = *(_QWORD *)&a4;
  v7 = *(_QWORD *)&a3;
  v9 = 0.0;
  if (a3 <= a4)
  {
    v10 = a3;
    do
    {
      v11 = (*(Node ***)((char *)self->_nodes.__map_.__begin_
                       + (((self->_nodes.__start_ + v10) >> 6) & 0x3FFFFFFFFFFFFF8)))[(self->_nodes.__start_ + v10) & 0x1FF];
      if (v11)
      {
        v12 = *(double *)v11;
        v13 = *(double **)(*((_QWORD *)v11 + 2) + 8 * a5);
        v9 = v9 + v12 * ((*v13 - a6) * (*v13 - a6));
      }
      ++v10;
    }
    while (v10 <= a4);
  }
  -[ADInterSessionFilter V1FromIndex:ToIndex:](self, "V1FromIndex:ToIndex:", *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
  v15 = v14;
  -[ADInterSessionFilter V2FromIndex:ToIndex:](self, "V2FromIndex:ToIndex:", v7, v6);
  v17 = v15 - v16 / v15;
  if (v17 < 1.0e-20)
    v17 = 1.0e-20;
  return v9 / v17;
}

- (double)sigmaSWithCandidate:(unsigned int)a3 ByElement:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  int value;
  uint64_t v8;
  double v9;
  double v10;
  double v11;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  value = self->_nodes.__size_.__value_;
  v8 = a3 - 1;
  -[ADInterSessionFilter samplesMeanFromIndex:ToIndex:ByElement:](self, "samplesMeanFromIndex:ToIndex:ByElement:", 0, v8, *(_QWORD *)&a4);
  -[ADInterSessionFilter samplesVarianceFromIndex:ToIndex:ByElement:WithMean:](self, "samplesVarianceFromIndex:ToIndex:ByElement:WithMean:", 0, v8, v4);
  v10 = v9;
  -[ADInterSessionFilter samplesMeanFromIndex:ToIndex:ByElement:](self, "samplesMeanFromIndex:ToIndex:ByElement:", v5, (value - 1), v4);
  -[ADInterSessionFilter samplesVarianceFromIndex:ToIndex:ByElement:WithMean:](self, "samplesVarianceFromIndex:ToIndex:ByElement:WithMean:", v5, (value - 1), v4);
  return sqrt((v11 * (double)(value + ~(_DWORD)v5) + (double)v8 * v10)/ (double)(value - 2));
}

- (double)TTESTWithCandidate:(unsigned int)a3 ByElement:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  int value;
  unsigned int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  value = self->_nodes.__size_.__value_;
  v8 = value - a3;
  -[ADInterSessionFilter samplesMeanFromIndex:ToIndex:ByElement:](self, "samplesMeanFromIndex:ToIndex:ByElement:", 0, a3 - 1, *(_QWORD *)&a4);
  v10 = v9;
  -[ADInterSessionFilter samplesMeanFromIndex:ToIndex:ByElement:](self, "samplesMeanFromIndex:ToIndex:ByElement:", v5, (value - 1), v4);
  v12 = v10 - v11;
  -[ADInterSessionFilter sigmaSWithCandidate:ByElement:](self, "sigmaSWithCandidate:ByElement:", v5, v4);
  if (v13 < 1.0)
    v13 = 1.0;
  return fabs(v12 / (v13 * sqrt(1.0 / (double)v5 + 1.0 / (double)v8)));
}

- (BOOL)TtestStepWithCandidate:(unsigned int)a3
{
  uint64_t v3;
  double v5;
  unsigned int v6;
  double v7;
  float v9;

  v3 = *(_QWORD *)&a3;
  v5 = 0.0;
  if (-[NSArray count](self->_elementsNames, "count"))
  {
    v6 = 1;
    do
    {
      -[ADInterSessionFilter TTESTWithCandidate:ByElement:](self, "TTESTWithCandidate:ByElement:", v3, v6 - 1);
      if (v7 > v5)
        v5 = v7;
    }
    while (-[NSArray count](self->_elementsNames, "count") > v6++);
  }
  -[ADInterSessionFilterParameters stepDetectionThreshold](self->_params, "stepDetectionThreshold");
  return v5 > v9;
}

- (void).cxx_destruct
{
  Node ***begin;
  Node ***end;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  Node ***v9;
  Node ***v10;
  Node ***first;

  objc_storeStrong((id *)&self->_elementsNames, 0);
  std::__tree<std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>,std::__map_value_compare<std::string,std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::multiset<Element *,Element::ElementCompare,std::allocator<Element *>> *>>>::destroy((char *)self->_sets.__tree_.__pair1_.__value_.__left_);
  begin = self->_nodes.__map_.__begin_;
  end = self->_nodes.__map_.__end_;
  self->_nodes.__size_.__value_ = 0;
  v5 = (char *)end - (char *)begin;
  if ((unint64_t)((char *)end - (char *)begin) >= 0x11)
  {
    do
    {
      operator delete(*begin);
      end = self->_nodes.__map_.__end_;
      begin = self->_nodes.__map_.__begin_ + 1;
      self->_nodes.__map_.__begin_ = begin;
      v5 = (char *)end - (char *)begin;
    }
    while ((unint64_t)((char *)end - (char *)begin) > 0x10);
  }
  v6 = v5 >> 3;
  if (v6 == 1)
  {
    v7 = 256;
    goto LABEL_7;
  }
  if (v6 == 2)
  {
    v7 = 512;
LABEL_7:
    self->_nodes.__start_ = v7;
  }
  if (begin != end)
  {
    do
    {
      v8 = *begin++;
      operator delete(v8);
    }
    while (begin != end);
    v10 = self->_nodes.__map_.__begin_;
    v9 = self->_nodes.__map_.__end_;
    if (v9 != v10)
      self->_nodes.__map_.__end_ = (Node ***)((char *)v9 + (((char *)v10 - (char *)v9 + 7) & 0xFFFFFFFFFFFFFFF8));
  }
  first = self->_nodes.__map_.__first_;
  if (first)
    operator delete(first);
  objc_storeStrong((id *)&self->_params, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *((_QWORD *)self + 11) = 0;
  *((_QWORD *)self + 10) = 0;
  *((_QWORD *)self + 9) = (char *)self + 80;
  return self;
}

@end
