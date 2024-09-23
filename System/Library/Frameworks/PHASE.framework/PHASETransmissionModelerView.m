@implementation PHASETransmissionModelerView

- (PHASETransmissionModelerView)initWithEngine:(id)a3
{
  id v4;
  PHASETransmissionModelerView *v5;
  objc_super v7;

  v4 = a3;
  if (!v4)
    __assert_rtn("-[PHASETransmissionModelerView initWithEngine:]", "PHASETransmissionModelerView.mm", 130, "engine");
  v7.receiver = self;
  v7.super_class = (Class)PHASETransmissionModelerView;
  v5 = -[PHASETransmissionModelerView init](&v7, sel_init);
  objc_storeWeak((id *)&v5->_engine, v4);

  return v5;
}

- (void)beginTrackingSource:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD v15[3];
  _QWORD *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "geoEntityHandle");
  v9 = _Block_copy(v7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_engine);
  v11 = *(_QWORD *)(objc_msgSend(WeakRetained, "implementation") + 368);
  v12 = objc_msgSend(v6, "geoEntityHandle");
  v15[0] = &off_24D57FCB8;
  v15[1] = v8;
  v15[2] = _Block_copy(v9);
  v16 = v15;
  (*(void (**)(uint64_t, uint64_t, _QWORD *))(*(_QWORD *)v11 + 328))(v11, v12, v15);
  v13 = v16;
  if (v16 == v15)
  {
    v14 = 4;
    v13 = v15;
    goto LABEL_5;
  }
  if (v16)
  {
    v14 = 5;
LABEL_5:
    (*(void (**)(void))(*v13 + 8 * v14))();
  }

}

- (void)endTrackingSource:(id)a3
{
  id v4;
  id v5;
  PHASEEngine **p_engine;
  id WeakRetained;
  uint64_t v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (!v4)
    __assert_rtn("-[PHASETransmissionModelerView endTrackingSource:]", "PHASETransmissionModelerView.mm", 153, "source");
  objc_msgSend(v4, "engine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  p_engine = &self->_engine;
  if (v5 != objc_loadWeakRetained((id *)p_engine))
    __assert_rtn("-[PHASETransmissionModelerView endTrackingSource:]", "PHASETransmissionModelerView.mm", 154, "source.engine == _engine");

  WeakRetained = objc_loadWeakRetained((id *)p_engine);
  v8 = *(_QWORD *)(objc_msgSend(WeakRetained, "implementation") + 368);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v8 + 344))(v8, objc_msgSend(v9, "geoEntityHandle"));

}

- (void)beginTrackingAudibleGeometryForSource:(id)a3 callback:(id)a4
{
  id v6;
  id v7;
  id v8;
  PHASEEngine **p_engine;
  uint64_t v10;
  void *v11;
  id WeakRetained;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _QWORD v17[3];
  _QWORD *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v6)
    __assert_rtn("-[PHASETransmissionModelerView beginTrackingAudibleGeometryForSource:callback:]", "PHASETransmissionModelerView.mm", 161, "source");
  objc_msgSend(v6, "engine");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  p_engine = &self->_engine;
  if (v8 != objc_loadWeakRetained((id *)p_engine))
    __assert_rtn("-[PHASETransmissionModelerView beginTrackingAudibleGeometryForSource:callback:]", "PHASETransmissionModelerView.mm", 162, "source.engine == _engine");

  v10 = objc_msgSend(v6, "geoEntityHandle");
  v11 = _Block_copy(v7);
  WeakRetained = objc_loadWeakRetained((id *)p_engine);
  v13 = *(_QWORD *)(objc_msgSend(WeakRetained, "implementation") + 368);
  v14 = objc_msgSend(v6, "geoEntityHandle");
  v17[0] = &off_24D57FD00;
  v17[1] = v10;
  v17[2] = _Block_copy(v11);
  v18 = v17;
  (*(void (**)(uint64_t, uint64_t, _QWORD *))(*(_QWORD *)v13 + 352))(v13, v14, v17);
  v15 = v18;
  if (v18 == v17)
  {
    v16 = 4;
    v15 = v17;
    goto LABEL_7;
  }
  if (v18)
  {
    v16 = 5;
LABEL_7:
    (*(void (**)(void))(*v15 + 8 * v16))();
  }

}

- (void)endTrackingAudibleGeometryForSource:(id)a3
{
  id v4;
  id v5;
  PHASEEngine **p_engine;
  id WeakRetained;
  uint64_t v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (!v4)
    __assert_rtn("-[PHASETransmissionModelerView endTrackingAudibleGeometryForSource:]", "PHASETransmissionModelerView.mm", 197, "source");
  objc_msgSend(v4, "engine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  p_engine = &self->_engine;
  if (v5 != objc_loadWeakRetained((id *)p_engine))
    __assert_rtn("-[PHASETransmissionModelerView endTrackingAudibleGeometryForSource:]", "PHASETransmissionModelerView.mm", 198, "source.engine == _engine");

  WeakRetained = objc_loadWeakRetained((id *)p_engine);
  v8 = *(_QWORD *)(objc_msgSend(WeakRetained, "implementation") + 368);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)v8 + 368))(v8, objc_msgSend(v9, "geoEntityHandle"));

}

- (void)overrideMaximumSampleCountForSource:(id)a3 count:(int64_t)a4
{
  id v6;
  PHASEEngine **p_engine;
  id WeakRetained;
  uint64_t v9;
  Phase::Logger *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _BYTE v16[24];
  _BYTE *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  p_engine = &self->_engine;
  WeakRetained = objc_loadWeakRetained((id *)p_engine);
  v9 = objc_msgSend(WeakRetained, "engineMode");

  if (!v9)
  {
    v12 = objc_loadWeakRetained((id *)p_engine);
    v13 = Phase::Controller::TaskManager::GetService<Phase::Geometry::System>((Phase::Logger *)(objc_msgSend(v12, "implementation") + 48), 2);

    if (!v13)
      __assert_rtn("-[PHASETransmissionModelerView overrideMaximumSampleCountForSource:count:]", "PHASETransmissionModelerView.mm", 213, "nullptr != geoSystem");
    *(_QWORD *)v16 = &off_24D57FD48;
    *(_QWORD *)&v16[8] = objc_msgSend(v6, "geoEntityHandle");
    *(_QWORD *)&v16[16] = a4;
    v17 = v16;
    Phase::Geometry::SystemScheduler::RunDebugFunction(v13 + 2352, v16);
    v14 = v17;
    if (v17 == v16)
    {
      v15 = 4;
      v14 = v16;
    }
    else
    {
      if (!v17)
        goto LABEL_10;
      v15 = 5;
    }
    (*(void (**)(void))(*v14 + 8 * v15))();
    goto LABEL_10;
  }
  v11 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v10) + 432));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v16 = 136315394;
    *(_QWORD *)&v16[4] = "PHASETransmissionModelerView.mm";
    *(_WORD *)&v16[12] = 1024;
    *(_DWORD *)&v16[14] = 208;
    _os_log_impl(&dword_2164CC000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d overrideMaximumSampleCountForSource: Cannot be called when running Client/Server mode.", v16, 0x12u);
  }
LABEL_10:

}

- (void)overrideSampleHistoryLengthForSource:(id)a3 length:(int64_t)a4
{
  id v6;
  PHASEEngine **p_engine;
  id WeakRetained;
  uint64_t v9;
  Phase::Logger *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _BYTE v16[24];
  _BYTE *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  p_engine = &self->_engine;
  WeakRetained = objc_loadWeakRetained((id *)p_engine);
  v9 = objc_msgSend(WeakRetained, "engineMode");

  if (!v9)
  {
    v12 = objc_loadWeakRetained((id *)p_engine);
    v13 = Phase::Controller::TaskManager::GetService<Phase::Geometry::System>((Phase::Logger *)(objc_msgSend(v12, "implementation") + 48), 2);

    if (!v13)
      __assert_rtn("-[PHASETransmissionModelerView overrideSampleHistoryLengthForSource:length:]", "PHASETransmissionModelerView.mm", 232, "nullptr != geoSystem");
    *(_QWORD *)v16 = &off_24D57FD90;
    *(_QWORD *)&v16[8] = objc_msgSend(v6, "geoEntityHandle");
    *(_QWORD *)&v16[16] = a4;
    v17 = v16;
    Phase::Geometry::SystemScheduler::RunDebugFunction(v13 + 2352, v16);
    v14 = v17;
    if (v17 == v16)
    {
      v15 = 4;
      v14 = v16;
    }
    else
    {
      if (!v17)
        goto LABEL_10;
      v15 = 5;
    }
    (*(void (**)(void))(*v14 + 8 * v15))();
    goto LABEL_10;
  }
  v11 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v10) + 432));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v16 = 136315394;
    *(_QWORD *)&v16[4] = "PHASETransmissionModelerView.mm";
    *(_WORD *)&v16[12] = 1024;
    *(_DWORD *)&v16[14] = 227;
    _os_log_impl(&dword_2164CC000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d overrideSampleHistoryLengthForSource: Cannot be called when running Client/Server mode.", v16, 0x12u);
  }
LABEL_10:

}

- (void)overrideSampleSubdivisionIndexForSource:(id)a3 index:(int64_t)a4
{
  id v6;
  PHASEEngine **p_engine;
  id WeakRetained;
  uint64_t v9;
  Phase::Logger *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _BYTE v16[24];
  _BYTE *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  p_engine = &self->_engine;
  WeakRetained = objc_loadWeakRetained((id *)p_engine);
  v9 = objc_msgSend(WeakRetained, "engineMode");

  if (!v9)
  {
    v12 = objc_loadWeakRetained((id *)p_engine);
    v13 = Phase::Controller::TaskManager::GetService<Phase::Geometry::System>((Phase::Logger *)(objc_msgSend(v12, "implementation") + 48), 2);

    if (!v13)
      __assert_rtn("-[PHASETransmissionModelerView overrideSampleSubdivisionIndexForSource:index:]", "PHASETransmissionModelerView.mm", 252, "nullptr != geoSystem");
    *(_QWORD *)v16 = &off_24D57FDD8;
    *(_QWORD *)&v16[8] = objc_msgSend(v6, "geoEntityHandle");
    *(_QWORD *)&v16[16] = a4;
    v17 = v16;
    Phase::Geometry::SystemScheduler::RunDebugFunction(v13 + 2352, v16);
    v14 = v17;
    if (v17 == v16)
    {
      v15 = 4;
      v14 = v16;
    }
    else
    {
      if (!v17)
        goto LABEL_10;
      v15 = 5;
    }
    (*(void (**)(void))(*v14 + 8 * v15))();
    goto LABEL_10;
  }
  v11 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v10) + 432));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v16 = 136315394;
    *(_QWORD *)&v16[4] = "PHASETransmissionModelerView.mm";
    *(_WORD *)&v16[12] = 1024;
    *(_DWORD *)&v16[14] = 247;
    _os_log_impl(&dword_2164CC000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d overrideSampleSubdivisionIndexForSource: Cannot be called when running Client/Server mode.", v16, 0x12u);
  }
LABEL_10:

}

- (void)overrideGeometrySubdivisionForSource:(id)a3 subdivideGeometry:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  PHASEEngine **p_engine;
  id WeakRetained;
  uint64_t v9;
  Phase::Logger *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _BYTE v16[24];
  _BYTE *v17;
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  p_engine = &self->_engine;
  WeakRetained = objc_loadWeakRetained((id *)p_engine);
  v9 = objc_msgSend(WeakRetained, "engineMode");

  if (!v9)
  {
    v12 = objc_loadWeakRetained((id *)p_engine);
    v13 = Phase::Controller::TaskManager::GetService<Phase::Geometry::System>((Phase::Logger *)(objc_msgSend(v12, "implementation") + 48), 2);

    if (!v13)
      __assert_rtn("-[PHASETransmissionModelerView overrideGeometrySubdivisionForSource:subdivideGeometry:]", "PHASETransmissionModelerView.mm", 271, "nullptr != geoSystem");
    *(_QWORD *)v16 = &off_24D57FE20;
    *(_QWORD *)&v16[8] = objc_msgSend(v6, "geoEntityHandle");
    *(_QWORD *)&v16[16] = v4;
    v17 = v16;
    Phase::Geometry::SystemScheduler::RunDebugFunction(v13 + 2352, v16);
    v14 = v17;
    if (v17 == v16)
    {
      v15 = 4;
      v14 = v16;
    }
    else
    {
      if (!v17)
        goto LABEL_10;
      v15 = 5;
    }
    (*(void (**)(void))(*v14 + 8 * v15))();
    goto LABEL_10;
  }
  v11 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v10) + 432));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)v16 = 136315394;
    *(_QWORD *)&v16[4] = "PHASETransmissionModelerView.mm";
    *(_WORD *)&v16[12] = 1024;
    *(_DWORD *)&v16[14] = 266;
    _os_log_impl(&dword_2164CC000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d overrideGeometrySubdivisionForSource: Cannot be called when running Client/Server mode.", v16, 0x12u);
  }
LABEL_10:

}

- (PHASEEngine)engine
{
  return (PHASEEngine *)objc_loadWeakRetained((id *)&self->_engine);
}

- (void)setEngine:(id)a3
{
  objc_storeWeak((id *)&self->_engine, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_engine);
}

- (uint64_t)beginTrackingSource:callback:
{

  return a1;
}

- (void)beginTrackingSource:callback:
{
  _QWORD *v2;
  PHASETransmissionModelerSourcePointSet *v4;

  v2 = *a2;
  if (!*a2)
    __assert_rtn("operator()", "PHASETransmissionModelerView.mm", 141, "nullptr != inView");
  if (*(_QWORD *)(a1 + 8) != *v2)
    __assert_rtn("operator()", "PHASETransmissionModelerView.mm", 142, "handle == inView->mSource");
  v4 = -[PHASETransmissionModelerSourcePointSet initWithRenderSourceView:]([PHASETransmissionModelerSourcePointSet alloc], "initWithRenderSourceView:", v2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 16) + 16))();

}

- (_QWORD)beginTrackingSource:callback:
{
  _QWORD *v2;
  const void *v3;
  uint64_t v4;

  v2 = operator new(0x18uLL);
  v4 = *(_QWORD *)(a1 + 8);
  v3 = *(const void **)(a1 + 16);
  *v2 = &off_24D57FCB8;
  v2[1] = v4;
  v2[2] = _Block_copy(v3);
  return v2;
}

- (uint64_t)beginTrackingAudibleGeometryForSource:callback:
{

  return a1;
}

- (void)beginTrackingAudibleGeometryForSource:callback:
{
  _QWORD *v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  PHASETriangleSet *v11;
  unint64_t v12;
  double v13;
  PHASETriangleSet *v14;
  id v16;

  v2 = *a2;
  if (!*a2)
    __assert_rtn("operator()", "PHASETransmissionModelerView.mm", 166, "nullptr != inView");
  if (*(_QWORD *)(a1 + 8) != *v2)
    __assert_rtn("operator()", "PHASETransmissionModelerView.mm", 167, "handle == inView->mSource");
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v2[7]);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v3 = v2[7];
  if (v3)
  {
    v4 = 0;
    v5 = 0;
    v6 = 0x7ABA4977B4617663;
    v7 = 0x5BC180D1366118D2;
    do
    {
      v8 = v2[2];
      v9 = *(_QWORD *)(v8 + v4 + 40);
      if (v9)
      {
        objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", *(_QWORD *)(v8 + v4), 36 * v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = [PHASETriangleSet alloc];
        v12 = (v6 >> 26) ^ ((v7 ^ (v7 << 23)) >> 17) ^ v6 ^ v7 ^ (v7 << 23);
        *(float *)&v13 = (float)((float)(v12 + v6) * 5.421e-20) + 0.0;
        v7 = ((v6 ^ (v6 << 23)) >> 17) ^ (v12 >> 26) ^ v6 ^ (v6 << 23) ^ v12;
        v6 = ((v12 ^ (v12 << 23)) >> 17) ^ (v7 >> 26) ^ v12 ^ (v12 << 23) ^ v7;
        *((float *)&v13 + 1) = (float)((float)(v7 + v12) * 5.421e-20) + 0.0;
        v14 = -[PHASETriangleSet initWithTriangleData:color:](v11, "initWithTriangleData:color:", v10, v13);
        objc_msgSend(v16, "addObject:", v14);

        v3 = v2[7];
      }
      ++v5;
      v4 += 48;
    }
    while (v3 > v5);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 16) + 16))();

}

- (_QWORD)beginTrackingAudibleGeometryForSource:callback:
{
  _QWORD *v2;
  const void *v3;
  uint64_t v4;

  v2 = operator new(0x18uLL);
  v4 = *(_QWORD *)(a1 + 8);
  v3 = *(const void **)(a1 + 16);
  *v2 = &off_24D57FD00;
  v2[1] = v4;
  v2[2] = _Block_copy(v3);
  return v2;
}

- (void)overrideMaximumSampleCountForSource:count:
{
  JUMPOUT(0x2199F9D70);
}

- (__n128)overrideMaximumSampleCountForSource:count:
{
  __n128 result;

  *(_QWORD *)a2 = &off_24D57FD48;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

- (uint64_t)overrideMaximumSampleCountForSource:count:
{
  uint64_t v2;
  uint64_t v3;
  uint64_t **result;
  unint64_t v5;
  unint64_t *v6;

  v2 = *a2;
  v3 = *(_QWORD *)(a1 + 16);
  v5 = *(_QWORD *)(a1 + 8);
  v6 = &v5;
  result = std::__tree<std::__value_type<Phase::Handle64,Phase::SpatialModeler::DirectPathTransmissionDebugger::SourceDebugInfo>,std::__map_value_compare<Phase::Handle64,std::__value_type<Phase::Handle64,Phase::SpatialModeler::DirectPathTransmissionDebugger::SourceDebugInfo>,std::less<Phase::Handle64>,true>,std::allocator<std::__value_type<Phase::Handle64,Phase::SpatialModeler::DirectPathTransmissionDebugger::SourceDebugInfo>>>::__emplace_unique_key_args<Phase::Handle64,std::piecewise_construct_t const&,std::tuple<Phase::Handle64 const&>,std::tuple<>>((uint64_t **)(v2 + 16), &v5, (uint64_t)&std::piecewise_construct, &v6);
  *((_DWORD *)result + 10) = v3;
  return result;
}

- (void)overrideSampleHistoryLengthForSource:length:
{
  JUMPOUT(0x2199F9D70);
}

- (__n128)overrideSampleHistoryLengthForSource:length:
{
  __n128 result;

  *(_QWORD *)a2 = &off_24D57FD90;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

- (uint64_t)overrideSampleHistoryLengthForSource:length:
{
  uint64_t v2;
  uint64_t v3;
  uint64_t **result;
  unint64_t v5;
  unint64_t *v6;

  v2 = *a2;
  v3 = *(_QWORD *)(a1 + 16);
  v5 = *(_QWORD *)(a1 + 8);
  v6 = &v5;
  result = std::__tree<std::__value_type<Phase::Handle64,Phase::SpatialModeler::DirectPathTransmissionDebugger::SourceDebugInfo>,std::__map_value_compare<Phase::Handle64,std::__value_type<Phase::Handle64,Phase::SpatialModeler::DirectPathTransmissionDebugger::SourceDebugInfo>,std::less<Phase::Handle64>,true>,std::allocator<std::__value_type<Phase::Handle64,Phase::SpatialModeler::DirectPathTransmissionDebugger::SourceDebugInfo>>>::__emplace_unique_key_args<Phase::Handle64,std::piecewise_construct_t const&,std::tuple<Phase::Handle64 const&>,std::tuple<>>((uint64_t **)(v2 + 16), &v5, (uint64_t)&std::piecewise_construct, &v6);
  *((_DWORD *)result + 11) = v3;
  return result;
}

- (void)overrideSampleSubdivisionIndexForSource:index:
{
  JUMPOUT(0x2199F9D70);
}

- (__n128)overrideSampleSubdivisionIndexForSource:index:
{
  __n128 result;

  *(_QWORD *)a2 = &off_24D57FDD8;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

- (uint64_t)overrideSampleSubdivisionIndexForSource:index:
{
  uint64_t v2;
  uint64_t v3;
  uint64_t **result;
  unint64_t v5;
  unint64_t *v6;

  v2 = *a2;
  v3 = *(_QWORD *)(a1 + 16);
  v5 = *(_QWORD *)(a1 + 8);
  v6 = &v5;
  result = std::__tree<std::__value_type<Phase::Handle64,Phase::SpatialModeler::DirectPathTransmissionDebugger::SourceDebugInfo>,std::__map_value_compare<Phase::Handle64,std::__value_type<Phase::Handle64,Phase::SpatialModeler::DirectPathTransmissionDebugger::SourceDebugInfo>,std::less<Phase::Handle64>,true>,std::allocator<std::__value_type<Phase::Handle64,Phase::SpatialModeler::DirectPathTransmissionDebugger::SourceDebugInfo>>>::__emplace_unique_key_args<Phase::Handle64,std::piecewise_construct_t const&,std::tuple<Phase::Handle64 const&>,std::tuple<>>((uint64_t **)(v2 + 16), &v5, (uint64_t)&std::piecewise_construct, &v6);
  *((_DWORD *)result + 12) = v3;
  return result;
}

- (void)overrideGeometrySubdivisionForSource:subdivideGeometry:
{
  JUMPOUT(0x2199F9D70);
}

- (__n128)overrideGeometrySubdivisionForSource:subdivideGeometry:
{
  __n128 result;

  *(_QWORD *)a2 = &off_24D57FE20;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

- (uint64_t)overrideGeometrySubdivisionForSource:subdivideGeometry:
{
  uint64_t v2;
  char v3;
  uint64_t **result;
  unint64_t v5;
  unint64_t *v6;

  v2 = *a2;
  v3 = *(_BYTE *)(a1 + 16);
  v5 = *(_QWORD *)(a1 + 8);
  v6 = &v5;
  result = std::__tree<std::__value_type<Phase::Handle64,Phase::SpatialModeler::DirectPathTransmissionDebugger::SourceDebugInfo>,std::__map_value_compare<Phase::Handle64,std::__value_type<Phase::Handle64,Phase::SpatialModeler::DirectPathTransmissionDebugger::SourceDebugInfo>,std::less<Phase::Handle64>,true>,std::allocator<std::__value_type<Phase::Handle64,Phase::SpatialModeler::DirectPathTransmissionDebugger::SourceDebugInfo>>>::__emplace_unique_key_args<Phase::Handle64,std::piecewise_construct_t const&,std::tuple<Phase::Handle64 const&>,std::tuple<>>((uint64_t **)(v2 + 16), &v5, (uint64_t)&std::piecewise_construct, &v6);
  *((_BYTE *)result + 52) = v3;
  return result;
}

@end
