@implementation ABPKSkeletonDefinition

- (ABPKSkeletonDefinition)init
{
  void *v3;
  ABPKSkeletonDefinition *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ABPKSkeletonDefinition initWithPlist:fromBundle:](self, "initWithPlist:fromBundle:", CFSTR("ABPKDetection2dSkeletonDefinition.plist"), v3);

  return v4;
}

- (ABPKSkeletonDefinition)initWithType:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  uint8_t v8[16];

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)a3 >= 5)
  {
    __ABPKLogSharedInstance();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_210836000, v6, OS_LOG_TYPE_ERROR, " ERROR: Unknown ABPKSkeletonType in ABPKSkeletonDefinition:initWithType. ", v8, 2u);
    }

  }
  else
  {
    self = -[ABPKSkeletonDefinition initWithPlist:fromBundle:](self, "initWithPlist:fromBundle:", off_24CA6E8E8[a3], v5);
  }

  return self;
}

- (ABPKSkeletonDefinition)initWithPlist:(id)a3 fromBundle:(id)a4
{
  id v6;
  id v7;
  char *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  void **v14;
  unint64_t i;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t *v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  char *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t *v30;
  unint64_t *v31;
  uint64_t v32;
  unint64_t v33;
  _QWORD *v34;
  unint64_t *v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  char *v40;
  unint64_t *v41;
  unint64_t v42;
  ABPKSkeletonDefinition *v43;
  NSObject *v44;
  NSObject *v45;
  const char *v46;
  NSObject *v47;
  uint32_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t v55;
  BOOL v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  id obj;
  void *v66;
  _QWORD v67[4];
  NSObject *v68;
  uint64_t v69;
  objc_super v70;
  _BYTE buf[24];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v70.receiver = self;
  v70.super_class = (Class)ABPKSkeletonDefinition;
  v8 = -[ABPKSkeletonDefinition init](&v70, sel_init);
  if (v8)
  {
    objc_msgSend(v7, "pathForResource:ofType:", v6, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v66 = (void *)v9;
    if (!v9)
    {
      __ABPKLogSharedInstance();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v6;
        _os_log_impl(&dword_210836000, v11, OS_LOG_TYPE_DEFAULT, " Could not find path for resource %@. ", buf, 0xCu);
      }
      v43 = 0;
      goto LABEL_76;
    }
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10)
    {
      __ABPKLogSharedInstance();
      v44 = objc_claimAutoreleasedReturnValue();
      obj = v44;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v66;
        _os_log_impl(&dword_210836000, v44, OS_LOG_TYPE_ERROR, " Failed to init dictionary from plist at path %@. ", buf, 0xCu);
      }
      v43 = 0;
      goto LABEL_75;
    }
    -[NSObject objectForKey:](v10, "objectForKey:", CFSTR("JointNames"));
    obj = (id)objc_claimAutoreleasedReturnValue();
    if (!obj)
    {
      __ABPKLogSharedInstance();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_210836000, v12, OS_LOG_TYPE_ERROR, " Dictionary has not key 'JointNames' ", buf, 2u);
      }
      v43 = 0;
      goto LABEL_74;
    }
    -[NSObject objectForKey:](v11, "objectForKey:", CFSTR("ParentIndices"));
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = objc_msgSend(obj, "count");
      if (v13 == -[NSObject count](v12, "count"))
      {
        objc_storeStrong((id *)v8 + 1, obj);
        v14 = (void **)(v8 + 16);
        std::vector<long>::reserve((void **)v8 + 2, -[NSObject count](v12, "count"));
        for (i = 0; i < -[NSObject count](v12, "count"); ++i)
        {
          v69 = 0;
          -[NSObject objectAtIndexedSubscript:](v12, "objectAtIndexedSubscript:", i);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "integerValue");

          v69 = v17;
          v19 = (uint64_t *)*((_QWORD *)v8 + 3);
          v18 = *((_QWORD *)v8 + 4);
          if ((unint64_t)v19 >= v18)
          {
            v21 = (uint64_t *)*v14;
            v22 = ((char *)v19 - (_BYTE *)*v14) >> 3;
            v23 = v22 + 1;
            if ((unint64_t)(v22 + 1) >> 61)
              goto LABEL_82;
            v24 = v18 - (_QWORD)v21;
            if (v24 >> 2 > v23)
              v23 = v24 >> 2;
            if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8)
              v25 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v25 = v23;
            if (v25)
            {
              v26 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)(v8 + 32), v25);
              v21 = (uint64_t *)*((_QWORD *)v8 + 2);
              v19 = (uint64_t *)*((_QWORD *)v8 + 3);
              v17 = v69;
            }
            else
            {
              v26 = 0;
            }
            v27 = (uint64_t *)&v26[8 * v22];
            *v27 = v17;
            v20 = v27 + 1;
            while (v19 != v21)
            {
              v28 = *--v19;
              *--v27 = v28;
            }
            *((_QWORD *)v8 + 2) = v27;
            *((_QWORD *)v8 + 3) = v20;
            *((_QWORD *)v8 + 4) = &v26[8 * v25];
            if (v21)
              operator delete(v21);
          }
          else
          {
            *v19 = v17;
            v20 = v19 + 1;
          }
          *((_QWORD *)v8 + 3) = v20;
          if (v69 != -1)
          {
            *(_QWORD *)buf = &v69;
            v29 = std::__tree<std::__value_type<long,std::vector<long>>,std::__map_value_compare<long,std::__value_type<long,std::vector<long>>,std::less<long>,true>,std::allocator<std::__value_type<long,std::vector<long>>>>::__emplace_unique_key_args<long,std::piecewise_construct_t const&,std::tuple<long const&>,std::tuple<>>((uint64_t **)v8 + 5, &v69, (uint64_t)&std::piecewise_construct, (uint64_t **)buf);
            v30 = v29;
            v31 = (unint64_t *)v29[6];
            v32 = (uint64_t)(v29 + 7);
            v33 = v29[7];
            if ((unint64_t)v31 >= v33)
            {
              v35 = (unint64_t *)v29[5];
              v36 = v31 - v35;
              if ((unint64_t)(v36 + 1) >> 61)
LABEL_82:
                std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
              v37 = v33 - (_QWORD)v35;
              v38 = (uint64_t)(v33 - (_QWORD)v35) >> 2;
              if (v38 <= v36 + 1)
                v38 = v36 + 1;
              if (v37 >= 0x7FFFFFFFFFFFFFF8)
                v39 = 0x1FFFFFFFFFFFFFFFLL;
              else
                v39 = v38;
              if (v39)
              {
                v40 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v32, v39);
                v35 = (unint64_t *)v30[5];
                v31 = (unint64_t *)v30[6];
              }
              else
              {
                v40 = 0;
              }
              v41 = (unint64_t *)&v40[8 * v36];
              *v41 = i;
              v34 = v41 + 1;
              while (v31 != v35)
              {
                v42 = *--v31;
                *--v41 = v42;
              }
              v30[5] = (uint64_t)v41;
              v30[6] = (uint64_t)v34;
              v30[7] = (uint64_t)&v40[8 * v39];
              if (v35)
                operator delete(v35);
            }
            else
            {
              *v31 = i;
              v34 = v31 + 1;
            }
            v30[6] = (uint64_t)v34;
          }
        }
        v49 = *((_QWORD *)v8 + 2);
        v50 = *((_QWORD *)v8 + 3);
        v51 = v50 - v49;
        if (v50 == v49)
        {
          v54 = -1;
LABEL_72:
          *((_QWORD *)v8 + 10) = v54;
          +[ABPKSkeletonDefinition computeParentChildOrderFor:withRoot:](ABPKSkeletonDefinition, "computeParentChildOrderFor:withRoot:", v8 + 16);
          v57 = objc_claimAutoreleasedReturnValue();
          v58 = (void *)*((_QWORD *)v8 + 8);
          *((_QWORD *)v8 + 8) = v57;

          v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v8, "jointCount"));
          v60 = (void *)*((_QWORD *)v8 + 1);
          v67[0] = MEMORY[0x24BDAC760];
          v67[1] = 3221225472;
          v67[2] = __51__ABPKSkeletonDefinition_initWithPlist_fromBundle___block_invoke;
          v67[3] = &unk_24CA6E8C8;
          v45 = v59;
          v68 = v45;
          objc_msgSend(v60, "enumerateObjectsUsingBlock:", v67);
          v61 = -[NSObject copy](v45, "copy");
          v62 = (void *)*((_QWORD *)v8 + 9);
          *((_QWORD *)v8 + 9) = v61;

          v43 = v8;
          goto LABEL_73;
        }
        v52 = 0;
        v53 = v51 >> 3;
        if (v53 <= 1)
          v53 = 1;
        v54 = -1;
        while (1)
        {
          v55 = *(_QWORD *)(v49 + 8 * v52);
          if (v55 < 0)
          {
            if (v55 != -1)
            {
              __ABPKLogSharedInstance();
              v45 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                goto LABEL_60;
              *(_DWORD *)buf = 134217984;
              *(_QWORD *)&buf[4] = v55;
              v46 = " Found parent index (%ld) < -1. ";
              v47 = v45;
              v48 = 12;
              goto LABEL_59;
            }
            v56 = v54 == -1;
            v54 = v52;
            if (!v56)
              break;
          }
          if (v53 == ++v52)
            goto LABEL_72;
        }
        __ABPKLogSharedInstance();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          v46 = " Found multiple joints without parent joint. ";
          goto LABEL_58;
        }
LABEL_60:
        v43 = 0;
LABEL_73:

LABEL_74:
LABEL_75:

LABEL_76:
        goto LABEL_77;
      }
      __ABPKLogSharedInstance();
      v45 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        goto LABEL_60;
      *(_WORD *)buf = 0;
      v46 = " Mismatch in nr of elements between JointNames and ParentIndices. ";
    }
    else
    {
      __ABPKLogSharedInstance();
      v45 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        goto LABEL_60;
      *(_WORD *)buf = 0;
      v46 = " Dictionary has not key 'ParentIndices' ";
    }
LABEL_58:
    v47 = v45;
    v48 = 2;
LABEL_59:
    _os_log_impl(&dword_210836000, v47, OS_LOG_TYPE_ERROR, v46, buf, v48);
    goto LABEL_60;
  }
  v43 = 0;
LABEL_77:

  return v43;
}

void __51__ABPKSkeletonDefinition_initWithPlist_fromBundle___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValue:forKey:", v6, v7);

}

- (unint64_t)jointCount
{
  return -[NSArray count](self->_jointNames, "count");
}

- (id)jointName:(int64_t)a3
{
  void *v5;

  if (a3 < 0)
  {
    v5 = 0;
  }
  else if (-[NSArray count](self->_jointNames, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_jointNames, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (int64_t)indexOfJointWithName:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[NSDictionary objectForKey:](self->_jointNamesToIndices, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "integerValue");
  else
    v5 = -1;

  return v5;
}

- (int64_t)parentJoint:(int64_t)a3
{
  int64_t *begin;

  if (a3 < 0)
    return -1;
  begin = self->_jointParentIndicesVector.__begin_;
  if (a3 >= (unint64_t)(self->_jointParentIndicesVector.__end_ - begin))
    return -1;
  else
    return begin[a3];
}

- (id)getChildrenIndices:(int64_t)a3
{
  uint64_t *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t *v11;

  v10 = a3;
  if (a3 < 0
    || a3 >= (unint64_t)(self->_jointParentIndicesVector.__end_ - self->_jointParentIndicesVector.__begin_))
  {
    return (id)objc_opt_new();
  }
  v11 = &v10;
  v3 = std::__tree<std::__value_type<long,std::vector<long>>,std::__map_value_compare<long,std::__value_type<long,std::vector<long>>,std::less<long>,true>,std::allocator<std::__value_type<long,std::vector<long>>>>::__emplace_unique_key_args<long,std::piecewise_construct_t const&,std::tuple<long const&>,std::tuple<>>((uint64_t **)&self->_parentsToChildIndicesMap, &v10, (uint64_t)&std::piecewise_construct, &v11);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", (v3[6] - v3[5]) >> 3);
  v5 = v3[5];
  if (v3[6] != v5)
  {
    v6 = 0;
    do
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", *(_QWORD *)(v5 + 8 * v6));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v7);

      ++v6;
      v5 = v3[5];
    }
    while (v6 < (v3[6] - v5) >> 3);
  }
  v8 = (void *)objc_msgSend(v4, "copy");

  return v8;
}

- (void)enumerateChildrenJointIndicesOfJointAtIndex:(int64_t)a3 withBlock:(id)a4
{
  void (**v6)(id, _QWORD);
  uint64_t *v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t *v11;

  v10 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  if ((a3 & 0x8000000000000000) == 0
    && a3 < (unint64_t)(self->_jointParentIndicesVector.__end_ - self->_jointParentIndicesVector.__begin_))
  {
    v11 = &v10;
    v7 = std::__tree<std::__value_type<long,std::vector<long>>,std::__map_value_compare<long,std::__value_type<long,std::vector<long>>,std::less<long>,true>,std::allocator<std::__value_type<long,std::vector<long>>>>::__emplace_unique_key_args<long,std::piecewise_construct_t const&,std::tuple<long const&>,std::tuple<>>((uint64_t **)&self->_parentsToChildIndicesMap, &v10, (uint64_t)&std::piecewise_construct, &v11);
    v8 = (_QWORD *)v7[5];
    v9 = (_QWORD *)v7[6];
    while (v8 != v9)
      v6[2](v6, *v8++);
  }

}

+ (id)computeParentChildOrderFor:(const void *)a3 withRoot:(int64_t)a4
{
  std::vector<int>::size_type v6;
  std::vector<int>::pointer begin;
  uint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  int v11;
  unint64_t *v12;
  unint64_t i;
  unint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char *v19;
  unint64_t *v20;
  unint64_t *v21;
  unint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char *v27;
  char *v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char *v35;
  char *v36;
  int v37;
  std::vector<unsigned int>::pointer end;
  unsigned int *v39;
  std::vector<unsigned int>::pointer v40;
  int64_t v41;
  unint64_t v42;
  int64_t v43;
  unint64_t v44;
  char *v45;
  unsigned int *v46;
  unsigned int *v47;
  unsigned int v48;
  char *v49;
  char *v50;
  int v51;
  unsigned int *v52;
  std::vector<unsigned int>::pointer v53;
  uint64_t v54;
  unint64_t v55;
  int64_t v56;
  unint64_t v57;
  char *v58;
  unsigned int *v59;
  unsigned int v60;
  std::vector<int>::size_type v61;
  std::vector<int>::pointer v62;
  std::vector<int>::pointer v63;
  uint64_t v64;
  unint64_t v65;
  std::vector<unsigned int>::pointer v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  std::vector<int>::pointer v70;
  unint64_t v71;
  void *v72;
  void *v73;
  std::vector<int>::value_type v75;
  std::vector<int> v76;
  std::vector<unsigned int> v77;
  void *__p;
  char *v79;
  char *v80;
  std::vector<int>::value_type __x[2];
  unint64_t *v82;
  char *v83;
  std::vector<int> v84;

  v6 = (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3;
  __x[0] = -1;
  std::vector<int>::vector(&v84, v6, __x);
  begin = v84.__begin_;
  v84.__begin_[a4] = 0;
  *(_QWORD *)__x = 0;
  v82 = 0;
  v83 = 0;
  v8 = *(_QWORD *)a3;
  if (*((_QWORD *)a3 + 1) == *(_QWORD *)a3)
  {
    v26 = 0;
    v28 = 0;
    __p = 0;
    v79 = 0;
    v80 = 0;
  }
  else
  {
    v9 = 0;
    v10 = 0;
    do
    {
      v11 = begin[v10];
      v12 = v9;
      for (i = v10; v11 < 0; v11 = v84.__begin_[i])
      {
        if (v12 >= (unint64_t *)v83)
        {
          v14 = *(unint64_t **)__x;
          v15 = ((uint64_t)v12 - *(_QWORD *)__x) >> 3;
          v16 = v15 + 1;
          if ((unint64_t)(v15 + 1) >> 61)
            std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
          v17 = (uint64_t)&v83[-*(_QWORD *)__x];
          if ((uint64_t)&v83[-*(_QWORD *)__x] >> 2 > v16)
            v16 = v17 >> 2;
          if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8)
            v18 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v18 = v16;
          if (v18)
          {
            v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>((uint64_t)&v83, v18);
            v14 = *(unint64_t **)__x;
            v12 = v82;
          }
          else
          {
            v19 = 0;
          }
          v20 = (unint64_t *)&v19[8 * v15];
          *v20 = i;
          v21 = v20 + 1;
          while (v12 != v14)
          {
            v22 = *--v12;
            *--v20 = v22;
          }
          *(_QWORD *)__x = v20;
          v82 = v21;
          v83 = &v19[8 * v18];
          if (v14)
            operator delete(v14);
          v12 = v21;
        }
        else
        {
          *v12++ = i;
        }
        v82 = v12;
        v8 = *(_QWORD *)a3;
        i = *(_QWORD *)(*(_QWORD *)a3 + 8 * i);
        begin = v84.__begin_;
      }
      v9 = *(unint64_t **)__x;
      if (v12 != *(unint64_t **)__x)
      {
        v23 = v11 + 1;
        do
        {
          v24 = *--v12;
          begin[v24] = v23++;
        }
        while (v12 != v9);
        v82 = v9;
      }
      ++v10;
      v25 = *((_QWORD *)a3 + 1);
    }
    while (v10 < (v25 - v8) >> 3);
    __p = 0;
    v79 = 0;
    v80 = 0;
    if (v25 == v8)
    {
      v26 = 0;
      v28 = 0;
    }
    else
    {
      v26 = 0;
      v27 = 0;
      v28 = 0;
      v29 = 0;
      do
      {
        v30 = v84.__begin_[v29];
        v31 = (v28 - v27) >> 2;
        if (v31 < v30 + 1)
        {
          do
          {
            if (v28 >= v80)
            {
              v32 = v31 + 1;
              if ((v31 + 1) >> 62)
                std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
              v33 = v80 - v27;
              if ((v80 - v27) >> 1 > v32)
                v32 = v33 >> 1;
              if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFFCLL)
                v34 = 0x3FFFFFFFFFFFFFFFLL;
              else
                v34 = v32;
              if (v34)
              {
                v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v80, v34);
                v27 = (char *)__p;
                v28 = v79;
              }
              else
              {
                v35 = 0;
              }
              v26 = &v35[4 * v31];
              *(_DWORD *)v26 = 0;
              v36 = v26 + 4;
              while (v28 != v27)
              {
                v37 = *((_DWORD *)v28 - 1);
                v28 -= 4;
                *((_DWORD *)v26 - 1) = v37;
                v26 -= 4;
              }
              __p = v26;
              v79 = v36;
              v80 = &v35[4 * v34];
              if (v27)
              {
                operator delete(v27);
                v26 = (char *)__p;
              }
              v28 = v36;
            }
            else
            {
              *(_DWORD *)v28 = 0;
              v28 += 4;
            }
            v79 = v28;
            v31 = (v28 - v26) >> 2;
            v27 = v26;
          }
          while (v31 < v30 + 1);
          v8 = *(_QWORD *)a3;
          v25 = *((_QWORD *)a3 + 1);
          v27 = v26;
        }
        ++*(_DWORD *)&v27[4 * v30];
        ++v29;
      }
      while (v29 < (v25 - v8) >> 3);
    }
  }
  memset(&v77, 0, sizeof(v77));
  std::vector<int>::reserve(&v77, ((v28 - v26) >> 2) + 1);
  end = v77.__end_;
  if (v77.__end_ >= v77.__end_cap_.__value_)
  {
    v40 = v77.__begin_;
    v41 = v77.__end_ - v77.__begin_;
    v42 = v41 + 1;
    if ((unint64_t)(v41 + 1) >> 62)
      std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
    v43 = (char *)v77.__end_cap_.__value_ - (char *)v77.__begin_;
    if (((char *)v77.__end_cap_.__value_ - (char *)v77.__begin_) >> 1 > v42)
      v42 = v43 >> 1;
    if ((unint64_t)v43 >= 0x7FFFFFFFFFFFFFFCLL)
      v44 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v44 = v42;
    if (v44)
    {
      v45 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v77.__end_cap_, v44);
      v40 = v77.__begin_;
      end = v77.__end_;
    }
    else
    {
      v45 = 0;
    }
    v46 = (unsigned int *)&v45[4 * v41];
    v47 = (unsigned int *)&v45[4 * v44];
    *v46 = 0;
    v39 = v46 + 1;
    while (end != v40)
    {
      v48 = *--end;
      *--v46 = v48;
    }
    v77.__begin_ = v46;
    v77.__end_ = v39;
    v77.__end_cap_.__value_ = v47;
    if (v40)
      operator delete(v40);
  }
  else
  {
    *v77.__end_ = 0;
    v39 = end + 1;
  }
  v77.__end_ = v39;
  v49 = (char *)__p;
  v50 = v79;
  if (__p != v79)
  {
    do
    {
      v51 = *(v39 - 1) + *(_DWORD *)v49;
      if (v39 >= v77.__end_cap_.__value_)
      {
        v53 = v77.__begin_;
        v54 = v39 - v77.__begin_;
        v55 = v54 + 1;
        if ((unint64_t)(v54 + 1) >> 62)
          std::vector<std::array<float,3ul>>::__throw_length_error[abi:ne180100]();
        v56 = (char *)v77.__end_cap_.__value_ - (char *)v77.__begin_;
        if (((char *)v77.__end_cap_.__value_ - (char *)v77.__begin_) >> 1 > v55)
          v55 = v56 >> 1;
        if ((unint64_t)v56 >= 0x7FFFFFFFFFFFFFFCLL)
          v57 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v57 = v55;
        if (v57)
        {
          v58 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v77.__end_cap_, v57);
          v53 = v77.__begin_;
          v39 = v77.__end_;
        }
        else
        {
          v58 = 0;
        }
        v59 = (unsigned int *)&v58[4 * v54];
        *v59 = v51;
        v52 = v59 + 1;
        while (v39 != v53)
        {
          v60 = *--v39;
          *--v59 = v60;
        }
        v77.__begin_ = v59;
        v77.__end_ = v52;
        v77.__end_cap_.__value_ = (unsigned int *)&v58[4 * v57];
        if (v53)
          operator delete(v53);
      }
      else
      {
        *v39 = v51;
        v52 = v39 + 1;
      }
      v77.__end_ = v52;
      v49 += 4;
      v39 = v52;
    }
    while (v49 != v50);
  }
  v61 = (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3;
  v75 = -1;
  std::vector<int>::vector(&v76, v61, &v75);
  v62 = v84.__begin_;
  v63 = v76.__begin_;
  if (v84.__end_ != v84.__begin_)
  {
    v64 = 0;
    v65 = v84.__end_ - v84.__begin_;
    v66 = v77.__begin_;
    if (v65 <= 1)
      v65 = 1;
    do
    {
      v67 = v62[v64];
      v68 = (int)v66[v67];
      v66[v67] = v68 + 1;
      v63[v68] = v64++;
    }
    while (v65 != v64);
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v76.__end_ - v63);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = v76.__begin_;
  if (v76.__end_ != v76.__begin_)
  {
    v71 = 0;
    do
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v70[v71]);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "addObject:", v72);

      ++v71;
      v70 = v76.__begin_;
    }
    while (v71 < v76.__end_ - v76.__begin_);
  }
  v73 = (void *)objc_msgSend(v69, "copy");

  if (v76.__begin_)
  {
    v76.__end_ = v76.__begin_;
    operator delete(v76.__begin_);
  }
  if (v77.__begin_)
  {
    v77.__end_ = v77.__begin_;
    operator delete(v77.__begin_);
  }
  if (__p)
  {
    v79 = (char *)__p;
    operator delete(__p);
  }
  if (*(_QWORD *)__x)
  {
    v82 = *(unint64_t **)__x;
    operator delete(*(void **)__x);
  }
  if (v84.__begin_)
  {
    v84.__end_ = v84.__begin_;
    operator delete(v84.__begin_);
  }
  return v73;
}

- (int64_t)rootJointIndex
{
  return self->_rootJointIndex;
}

- (NSArray)parentChildOrder
{
  return self->_parentChildOrder;
}

- (void).cxx_destruct
{
  int64_t *begin;

  objc_storeStrong((id *)&self->_jointNamesToIndices, 0);
  objc_storeStrong((id *)&self->_parentChildOrder, 0);
  std::__tree<std::__value_type<long,std::vector<long>>,std::__map_value_compare<long,std::__value_type<long,std::vector<long>>,std::less<long>,true>,std::allocator<std::__value_type<long,std::vector<long>>>>::destroy((uint64_t)&self->_parentsToChildIndicesMap, (_QWORD *)self->_parentsToChildIndicesMap.__tree_.__pair1_.__value_.__left_);
  begin = self->_jointParentIndicesVector.__begin_;
  if (begin)
  {
    self->_jointParentIndicesVector.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_jointNames, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 6) = 0;
  *((_QWORD *)self + 4) = 0;
  *((_QWORD *)self + 5) = (char *)self + 48;
  return self;
}

@end
