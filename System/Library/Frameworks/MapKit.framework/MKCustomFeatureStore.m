@implementation MKCustomFeatureStore

void __46___MKCustomFeatureStore__clearTileAnnotations__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  char *v10;
  _QWORD *v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  BOOL v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  id v21;

  v21 = a2;
  objc_msgSend(v21, "feature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDataSource:", 0);

  v4 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(v21, "coordinate");
  GEOMapPointForCoordinate();
  v7 = v5;
  v8 = v6;
  v10 = (char *)v4[7];
  v9 = v4[8];
  if ((unint64_t)v10 >= v9)
  {
    v12 = (char *)v4[6];
    v13 = (v10 - v12) >> 4;
    v14 = v13 + 1;
    if ((unint64_t)(v13 + 1) >> 60)
      std::vector<VKRouteInfo * {__strong}>::__throw_length_error[abi:ne180100]();
    v15 = v9 - (_QWORD)v12;
    if (v15 >> 3 > v14)
      v14 = v15 >> 3;
    v16 = (unint64_t)v15 >= 0x7FFFFFFFFFFFFFF0;
    v17 = 0xFFFFFFFFFFFFFFFLL;
    if (!v16)
      v17 = v14;
    if (v17)
    {
      v17 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<CLLocationCoordinate2D>>(v17);
      v12 = (char *)v4[6];
      v10 = (char *)v4[7];
    }
    else
    {
      v18 = 0;
    }
    v19 = (_QWORD *)(v17 + 16 * v13);
    v20 = v17 + 16 * v18;
    *v19 = v7;
    v19[1] = v8;
    v11 = v19 + 2;
    if (v10 != v12)
    {
      do
      {
        *((_OWORD *)v19 - 1) = *((_OWORD *)v10 - 1);
        v19 -= 2;
        v10 -= 16;
      }
      while (v10 != v12);
      v12 = (char *)v4[6];
    }
    v4[6] = v19;
    v4[7] = v11;
    v4[8] = v20;
    if (v12)
      operator delete(v12);
  }
  else
  {
    *(_QWORD *)v10 = v5;
    *((_QWORD *)v10 + 1) = v6;
    v11 = v10 + 16;
  }
  v4[7] = v11;

}

@end
