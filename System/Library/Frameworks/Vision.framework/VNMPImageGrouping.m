@implementation VNMPImageGrouping

+ (int64_t)computeHierarchicalClusteringOfImageDescriptors:(id)a3 results:(MPClusteringTreeNode *)a4 context:(id)a5
{
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  float v19;
  float v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t **v23;
  uint64_t **v24;
  uint64_t *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  int v30;
  uint64_t *v31;
  float v32;
  MPClusteringTreeNode *v33;
  MPClusteringTreeNode *v34;
  uint64_t *v35;
  uint64_t **v36;
  uint64_t **v37;
  BOOL v38;
  int var1;
  _QWORD **v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD **v43;
  int v44;
  _QWORD *v45;
  _QWORD *v46;
  _QWORD *v47;
  int v48;
  _QWORD **v49;
  _QWORD *v50;
  _QWORD *v51;
  _QWORD **v52;
  int v53;
  _QWORD *v54;
  MPClusteringTreeNode *v55;
  float v56;
  float v57;
  float v58;
  id *p_var0;
  int v60;
  id v64;
  uint64_t **v65;
  uint64_t *v66;
  uint64_t v67;
  _QWORD **v68;
  _QWORD *v69[2];

  v6 = a3;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v69[0] = 0;
  v69[1] = 0;
  v67 = 0;
  v68 = v69;
  v66 = 0;
  v64 = a5;
  v65 = &v66;
  while (v7 < (int)objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = malloc_type_malloc(0x38uLL, 0x10A00406DB9B953uLL);
    *v11 = v10;
    v11[3] = 0;
    v11[4] = 0;
    v11[5] = v11;
    v11[6] = v11;
    *((_DWORD *)v11 + 4) = 0;
    *((_DWORD *)v11 + 5) = 1;
    *((_DWORD *)v11 + 2) = v7;
    *((_DWORD *)v11 + 3) = 0;
    if (v9)
    {
      v12 = objc_msgSend(v10, "exifTimestamp");
      v13 = objc_msgSend(v8, "exifTimestamp");
      objc_msgSend((id)*v11, "distanceFromDescriptor:", *v9);
      v15 = v14;
      v16 = objc_msgSend(v64, "useTimestampAdjustedDistances");
      v17 = v12 - v13;
      LODWORD(v18) = v15;
      objc_msgSend(a1, "computeTotalDistanceForDescriptorDistance:timestampDiff:useTimestampAdjustment:", v17, v16, v18);
      v20 = v19;
      v21 = (uint64_t *)operator new(0x38uLL);
      v22 = v21;
      *((float *)v21 + 8) = v20;
      v21[5] = (uint64_t)v9;
      v21[6] = (uint64_t)v11;
      v23 = &v66;
      v24 = &v66;
      v25 = v66;
      if (v66)
      {
        do
        {
          while (1)
          {
            v23 = (uint64_t **)v25;
            if (v20 >= *((float *)v25 + 8))
              break;
            v25 = (uint64_t *)*v25;
            v24 = v23;
            if (!*v23)
              goto LABEL_10;
          }
          v25 = (uint64_t *)v25[1];
        }
        while (v25);
        v24 = v23 + 1;
      }
LABEL_10:
      *v21 = 0;
      v21[1] = 0;
      v21[2] = (uint64_t)v23;
      *v24 = v21;
      if (*v65)
      {
        v65 = (uint64_t **)*v65;
        v22 = *v24;
      }
      std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v66, v22);
      ++v67;
      objc_msgSend(v10, "setPreviousLeafId:", objc_msgSend(v8, "descriptorId"));
      objc_msgSend(v8, "setNextLeafId:", objc_msgSend(v10, "descriptorId"));
      LODWORD(v26) = v15;
      objc_msgSend(v10, "setPreviousLeafDescriptorDistance:", v26);
      LODWORD(v27) = v15;
      objc_msgSend(v8, "setNextLeafDescriptorDistance:", v27);
      objc_msgSend(v10, "setPreviousLeafTimestampDistance:", v17);
      objc_msgSend(v8, "setNextLeafTimestampDistance:", v17);
      *(float *)&v28 = v20;
      objc_msgSend(v10, "setPreviousLeafTotalDistance:", v28);
      *(float *)&v29 = v20;
      objc_msgSend(v8, "setNextLeafTotalDistance:", v29);
    }
    ++v7;

    v8 = v10;
    v9 = v11;
  }
  syslog(5, "starting clustering");
  if (v67)
  {
    v30 = 0;
    do
    {
      v31 = (uint64_t *)v65;
      v32 = *((float *)v65 + 8);
      v34 = (MPClusteringTreeNode *)v65[5];
      v33 = (MPClusteringTreeNode *)v65[6];
      syslog(5, "merging leaf clusters [%d, %d] with score : %f", v34->var1, v33->var1, v32);
      v35 = v65[1];
      v36 = v65;
      if (v35)
      {
        do
        {
          v37 = (uint64_t **)v35;
          v35 = (uint64_t *)*v35;
        }
        while (v35);
      }
      else
      {
        do
        {
          v37 = (uint64_t **)v36[2];
          v38 = *v37 == (uint64_t *)v36;
          v36 = v37;
        }
        while (!v38);
      }
      v65 = v37;
      --v67;
      std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v66, v31);
      operator delete(v31);
      if (v69[0])
      {
        while (1)
        {
          var1 = v34->var1;
          v40 = v69;
          v41 = v69[0];
          do
          {
            v42 = v41;
            v43 = v40;
            v44 = *((_DWORD *)v41 + 8);
            if (v44 >= var1)
              v40 = (_QWORD **)v41;
            else
              ++v41;
            v41 = (_QWORD *)*v41;
          }
          while (v41);
          if (v40 == v69)
            break;
          v45 = v44 >= var1 ? v42 : v43;
          if (var1 < *((_DWORD *)v45 + 8))
            break;
          if (v44 >= var1)
            v46 = v42;
          else
            v46 = v43;
          v34 = (MPClusteringTreeNode *)v46[5];
        }
        while (1)
        {
          v48 = v33->var1;
          v49 = v69;
          v50 = v69[0];
          do
          {
            v51 = v50;
            v52 = v49;
            v53 = *((_DWORD *)v50 + 8);
            if (v53 >= v48)
              v49 = (_QWORD **)v50;
            else
              ++v50;
            v50 = (_QWORD *)*v50;
          }
          while (v50);
          if (v49 == v69)
            break;
          v54 = v53 >= v48 ? v51 : v52;
          if (v48 < *((_DWORD *)v54 + 8))
            break;
          if (v53 >= v48)
            v47 = v51;
          else
            v47 = v52;
          v33 = (MPClusteringTreeNode *)v47[5];
        }
      }
      else
      {
        var1 = v34->var1;
        v48 = v33->var1;
      }
      syslog(5, "found parent clusters to merge [%d, %d]", var1, v48);
      v55 = (MPClusteringTreeNode *)malloc_type_malloc(0x38uLL, 0x10A00406DB9B953uLL);
      v55->var1 = v7;
      objc_msgSend(v34->var0, "quality");
      v57 = v56;
      objc_msgSend(v33->var0, "quality");
      if (v57 <= v58)
        p_var0 = &v33->var0;
      else
        p_var0 = &v34->var0;
      v55->var0 = *p_var0;
      v55->var5 = v34;
      v55->var6 = v33;
      v55->var7 = v34->var7;
      v55->var8 = v33->var8;
      v55->var2 = v32;
      v60 = v33->var4 + v34->var4;
      v55->var4 = v60;
      v55->var3 = (float)((float)((float)(v34->var3 * (float)(v34->var4 - 1))
                                + (float)(v33->var3 * (float)(v33->var4 - 1)))
                        + v32)
                / (float)(v60 - 1);
      std::__tree<std::__value_type<int,MPClusteringTreeNode *>,std::__map_value_compare<int,std::__value_type<int,MPClusteringTreeNode *>,std::less<int>,true>,std::allocator<std::__value_type<int,MPClusteringTreeNode *>>>::__emplace_unique_key_args<int,std::pair<int,MPClusteringTreeNode *>>((uint64_t *)&v68, v34->var1, v34->var1, (uint64_t)v55);
      std::__tree<std::__value_type<int,MPClusteringTreeNode *>,std::__map_value_compare<int,std::__value_type<int,MPClusteringTreeNode *>,std::less<int>,true>,std::allocator<std::__value_type<int,MPClusteringTreeNode *>>>::__emplace_unique_key_args<int,std::pair<int,MPClusteringTreeNode *>>((uint64_t *)&v68, v33->var1, v33->var1, (uint64_t)v55);
      ++v30;
      LODWORD(v7) = v7 + 1;
    }
    while (v67);
  }
  else
  {
    v55 = 0;
    v30 = 0;
  }
  syslog(5, "end clustering, iterations : %d", v30);
  *a4 = v55;

  std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy(v66);
  std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy(v69[0]);

  return 2432;
}

+ (float)getDistanceForClusterNode:(MPClusteringTreeNode *)a3 splitDistanceType:(int)a4
{
  float result;

  if (!a4)
    return a3->var2;
  if (a4 == 1)
    return a3->var3;
  return result;
}

+ (vector<MPClusteringTreeNode)computeClusteringIntoKGroups:(id)a2 orUsingDistanceThreshold:(SEL)a3 forHierarchicalTree:(int)a4 context:(float)a5
{
  id v12;
  float v13;
  uint64_t *v14;
  uint64_t **v15;
  uint64_t *v16;
  BOOL v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  float v22;
  float v23;
  uint64_t *v24;
  MPClusteringTreeNode **v25;
  MPClusteringTreeNode **var0;
  MPClusteringTreeNode **v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  MPClusteringTreeNode **v33;
  MPClusteringTreeNode **v34;
  MPClusteringTreeNode *v35;
  uint64_t *v36;
  uint64_t **v37;
  vector<MPClusteringTreeNode *, std::allocator<MPClusteringTreeNode *>> *result;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;

  v12 = a7;
  v40 = 0;
  v41 = 0;
  v39 = (uint64_t *)&v40;
  objc_msgSend(a2, "getDistanceForClusterNode:splitDistanceType:", a6, objc_msgSend(v12, "clusterSplitDistanceType"));
  std::__tree<std::__value_type<float,MPClusteringTreeNode *>,std::__map_value_compare<float,std::__value_type<float,MPClusteringTreeNode *>,std::less<float>,true>,std::allocator<std::__value_type<float,MPClusteringTreeNode *>>>::__emplace_multi<std::pair<float,MPClusteringTreeNode *>>(&v39, (uint64_t)a6, v13);
  while ((int)v41 < a4)
  {
    v14 = v40;
    v15 = &v40;
    if (v40)
    {
      do
      {
        v16 = v14;
        v14 = (uint64_t *)v14[1];
      }
      while (v14);
    }
    else
    {
      do
      {
        v16 = v15[2];
        v17 = *v16 == (_QWORD)v15;
        v15 = (uint64_t **)v16;
      }
      while (v17);
    }
    if (*((float *)v16 + 8) < a5)
      break;
    v18 = v16[5];
    if (*(_DWORD *)(v18 + 20) == 1)
      break;
    v19 = (uint64_t *)v16[1];
    v20 = v16;
    if (v19)
    {
      do
      {
        v21 = v19;
        v19 = (uint64_t *)*v19;
      }
      while (v19);
    }
    else
    {
      do
      {
        v21 = (uint64_t *)v20[2];
        v17 = *v21 == (_QWORD)v20;
        v20 = v21;
      }
      while (!v17);
    }
    if (v39 == v16)
      v39 = v21;
    --v41;
    std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v40, v16);
    operator delete(v16);
    objc_msgSend(a2, "getDistanceForClusterNode:splitDistanceType:", *(_QWORD *)(v18 + 24), objc_msgSend(v12, "clusterSplitDistanceType"));
    std::__tree<std::__value_type<float,MPClusteringTreeNode *>,std::__map_value_compare<float,std::__value_type<float,MPClusteringTreeNode *>,std::less<float>,true>,std::allocator<std::__value_type<float,MPClusteringTreeNode *>>>::__emplace_multi<std::pair<float,MPClusteringTreeNode *>>(&v39, *(_QWORD *)(v18 + 24), v22);
    objc_msgSend(a2, "getDistanceForClusterNode:splitDistanceType:", *(_QWORD *)(v18 + 32), objc_msgSend(v12, "clusterSplitDistanceType"));
    std::__tree<std::__value_type<float,MPClusteringTreeNode *>,std::__map_value_compare<float,std::__value_type<float,MPClusteringTreeNode *>,std::less<float>,true>,std::allocator<std::__value_type<float,MPClusteringTreeNode *>>>::__emplace_multi<std::pair<float,MPClusteringTreeNode *>>(&v39, *(_QWORD *)(v18 + 32), v23);
  }
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  v24 = v39;
  if (v39 != (uint64_t *)&v40)
  {
    v25 = 0;
    do
    {
      var0 = retstr->var2.var0;
      if (v25 >= var0)
      {
        v27 = retstr->var0;
        v28 = v25 - retstr->var0;
        v29 = v28 + 1;
        if ((unint64_t)(v28 + 1) >> 61)
          std::vector<vision::mod::DescriptorItemSideInfo>::__throw_length_error[abi:ne180100]();
        v30 = (char *)var0 - (char *)v27;
        if (v30 >> 2 > v29)
          v29 = v30 >> 2;
        if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF8)
          v31 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v31 = v29;
        if (v31)
          v31 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned long>>(v31);
        else
          v32 = 0;
        v33 = (MPClusteringTreeNode **)(v31 + 8 * v28);
        *v33 = (MPClusteringTreeNode *)v24[5];
        v34 = v33 + 1;
        if (v25 != v27)
        {
          do
          {
            v35 = *--v25;
            *--v33 = v35;
          }
          while (v25 != v27);
          v25 = retstr->var0;
        }
        retstr->var0 = v33;
        retstr->var1 = v34;
        retstr->var2.var0 = (MPClusteringTreeNode **)(v31 + 8 * v32);
        if (v25)
          operator delete(v25);
        v25 = v34;
      }
      else
      {
        *v25++ = (MPClusteringTreeNode *)v24[5];
      }
      retstr->var1 = v25;
      v36 = (uint64_t *)v24[1];
      if (v36)
      {
        do
        {
          v37 = (uint64_t **)v36;
          v36 = (uint64_t *)*v36;
        }
        while (v36);
      }
      else
      {
        do
        {
          v37 = (uint64_t **)v24[2];
          v17 = *v37 == v24;
          v24 = (uint64_t *)v37;
        }
        while (!v17);
      }
      v24 = (uint64_t *)v37;
    }
    while (v37 != &v40);
  }
  std::__tree<std::__value_type<long long,int>,std::__map_value_compare<long long,std::__value_type<long long,int>,std::less<long long>,true>,std::allocator<std::__value_type<long long,int>>>::destroy(v40);

  return result;
}

+ (vector<MPClusteringTreeNode)computeClusteringIntoKGroups:(id)a2 forHierarchicalTree:(SEL)a3 context:(int)a4
{
  double v6;

  LODWORD(v6) = 0;
  return (vector<MPClusteringTreeNode *, std::allocator<MPClusteringTreeNode *>> *)objc_msgSend(a2, "computeClusteringIntoKGroups:orUsingDistanceThreshold:forHierarchicalTree:context:", *(_QWORD *)&a4, a5, a6, v6);
}

+ (vector<MPClusteringTreeNode)computeClusteringUsingDistanceThreshold:(id)a2 forHierarchicalTree:(SEL)a3 context:(float)a4
{
  return (vector<MPClusteringTreeNode *, std::allocator<MPClusteringTreeNode *>> *)objc_msgSend(a2, "computeClusteringIntoKGroups:orUsingDistanceThreshold:forHierarchicalTree:context:", 0x7FFFFFFFLL, a5, a6);
}

+ (vector<MPClusteringTreeNode)computeNaturalClusteringForHierarchicalTree:(id)a2 context:(SEL)a3
{
  vector<MPClusteringTreeNode *, std::allocator<MPClusteringTreeNode *>> *result;
  id v8;

  v8 = a5;
  objc_msgSend(v8, "naturalClusteringDistanceThreshold");
  objc_msgSend(a2, "computeClusteringIntoKGroups:orUsingDistanceThreshold:forHierarchicalTree:context:", 0x7FFFFFFFLL, a4, v8);

  return result;
}

+ (float)computeTimestampAdjustedDistanceForBaseDistance:(float)a3 andTimestampDiff:(int64_t)a4
{
  float v4;
  float v5;

  if (a4 >= 10)
  {
    if ((unint64_t)a4 >= 0x3C)
    {
      if ((unint64_t)a4 <= 0x15180)
      {
        if ((unint64_t)a4 <= 0x4650)
        {
          v4 = 0.12;
          if ((unint64_t)a4 <= 0xE10)
            v4 = 0.0;
        }
        else
        {
          v4 = 0.24;
        }
      }
      else
      {
        v4 = 0.4;
      }
    }
    else
    {
      v4 = -0.03;
    }
  }
  else
  {
    v4 = -0.06;
  }
  v5 = v4 + a3;
  if (v5 < 0.0)
    v5 = 0.0;
  return fminf(v5, 1.0);
}

+ (float)computeTotalDistanceForDescriptorDistance:(float)result timestampDiff:(int64_t)a4 useTimestampAdjustment:(BOOL)a5
{
  if (a5)
    objc_msgSend(a1, "computeTimestampAdjustedDistanceForBaseDistance:andTimestampDiff:", a4);
  return result;
}

@end
