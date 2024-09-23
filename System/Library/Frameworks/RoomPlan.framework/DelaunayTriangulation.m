@implementation DelaunayTriangulation

+ (DelaunayTriangulation)shared
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__DelaunayTriangulation_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[DelaunayTriangulation shared]::onceToken[0] != -1)
    dispatch_once(+[DelaunayTriangulation shared]::onceToken, block);
  return (DelaunayTriangulation *)(id)+[DelaunayTriangulation shared]::singleton;
}

void __31__DelaunayTriangulation_shared__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)+[DelaunayTriangulation shared]::singleton;
  +[DelaunayTriangulation shared]::singleton = v0;

}

- (id)computeTriangulation:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  float32x2_t v6;
  uint64_t i;
  float32x2_t v8;
  int64x2_t v9;
  char *v10;
  uint64_t *v11;
  char *v12;
  int64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t *v18;
  _QWORD *v19;
  uint64_t **v20;
  uint64_t v21;
  uint64_t **v22;
  uint64_t v23;
  uint64_t v24;
  DelaunayTriangle *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  id v34;
  float v35;
  void *v36;
  id v38;
  void *v39;
  int64x2_t v40;
  _QWORD *j;
  void *v42[2];
  void *v43[2];
  __int128 v44;
  void *v45[2];
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  void *__p;
  char *v52;
  unint64_t v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x24BDAC8D0];
  v38 = a3;
  v39 = (void *)objc_opt_new();
  __p = 0;
  v52 = 0;
  v53 = 0;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v3 = v38;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v47, v54, 16, v38);
  if (v4)
  {
    v5 = *(_QWORD *)v48;
    v6 = (float32x2_t)vdup_n_s32(0x47C35000u);
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v48 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "value");
        v9 = vcvtq_s64_f64(vcvtq_f64_f32(vmul_f32(v8, v6)));
        v10 = v52;
        if ((unint64_t)v52 >= v53)
        {
          v40 = v9;
          v12 = (char *)__p;
          v13 = (v52 - (_BYTE *)__p) >> 4;
          v14 = v13 + 1;
          if ((unint64_t)(v13 + 1) >> 60)
            std::vector<PointInt64>::__throw_length_error[abi:ne180100]();
          v15 = v53 - (_QWORD)__p;
          if ((uint64_t)(v53 - (_QWORD)__p) >> 3 > v14)
            v14 = v15 >> 3;
          if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF0)
            v16 = 0xFFFFFFFFFFFFFFFLL;
          else
            v16 = v14;
          if (v16)
          {
            v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PointInt64>>((uint64_t)&v53, v16);
            v12 = (char *)__p;
            v10 = v52;
          }
          else
          {
            v17 = 0;
          }
          v18 = (uint64_t *)&v17[16 * v13];
          *(int64x2_t *)v18 = v40;
          v11 = v18 + 2;
          if (v10 != v12)
          {
            do
            {
              *((_OWORD *)v18 - 1) = *((_OWORD *)v10 - 1);
              v18 -= 2;
              v10 -= 16;
            }
            while (v10 != v12);
            v12 = (char *)__p;
          }
          __p = v18;
          v52 = (char *)v11;
          v53 = (unint64_t)&v17[16 * v16];
          if (v12)
            operator delete(v12);
        }
        else
        {
          *(int64x2_t *)v52 = v9;
          v11 = (uint64_t *)(v10 + 16);
        }
        v52 = (char *)v11;
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    }
    while (v4);
  }

  v46 = 0;
  v44 = 0u;
  *(_OWORD *)v45 = 0u;
  *(_OWORD *)v42 = 0u;
  *(_OWORD *)v43 = 0u;
  boost::polygon::construct_voronoi<std::__wrap_iter<PointInt64 *>,boost::polygon::voronoi_diagram<double,boost::polygon::voronoi_diagram_traits<double>>>((uint64_t)__p, (uint64_t *)v52, v42);
  v19 = v43[1];
  for (j = (_QWORD *)v44; v19 != j; v19 += 4)
  {
    v20 = (uint64_t **)v19[2];
    v21 = **v20;
    v22 = (uint64_t **)v20[4][2];
    v23 = **v22;
    do
    {
      v22 = (uint64_t **)v22[4][2];
      v24 = **v22;
      v25 = [DelaunayTriangle alloc];
      objc_msgSend(v3, "objectAtIndexedSubscript:", v21);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "value");
      v28 = v27;
      objc_msgSend(v3, "objectAtIndexedSubscript:", v23);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "value");
      v31 = v30;
      objc_msgSend(v3, "objectAtIndexedSubscript:", v24);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "value");
      v34 = -[DelaunayTriangle initFirst:second:third:](v25, "initFirst:second:third:", v28, v31, v33);

      objc_msgSend(v34, "area");
      if (v35 >= 0.00000011921)
        objc_msgSend(v39, "addObject:", v34);

      v23 = v24;
    }
    while (v24 != v21);
  }
  v36 = (void *)objc_msgSend(v39, "copy");
  if (v45[0])
  {
    v45[1] = v45[0];
    operator delete(v45[0]);
  }
  if (v43[1])
  {
    *(void **)&v44 = v43[1];
    operator delete(v43[1]);
  }
  if (v42[0])
  {
    v42[1] = v42[0];
    operator delete(v42[0]);
  }
  if (__p)
  {
    v52 = (char *)__p;
    operator delete(__p);
  }

  return v36;
}

@end
