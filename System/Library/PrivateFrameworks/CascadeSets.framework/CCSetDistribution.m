@implementation CCSetDistribution

- (CCSetDistribution)init
{
  id v2;

  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("init unsupported"), MEMORY[0x24BDBD1B8]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (CCSetDistribution)initWithSet:(id)a3
{
  id v5;
  CCSetDistribution *v6;
  CCSetDistribution *v7;
  NSMutableSet *v8;
  NSMutableSet *devices;
  _QWORD *v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  _QWORD *v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  __int128 v19;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CCSetDistribution;
  v6 = -[CCSetDistribution init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_set, a3);
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    devices = v7->_devices;
    v7->_devices = v8;

    v10 = operator new(0x30uLL);
    v10[1] = 0;
    v10[2] = 0;
    *v10 = &unk_2509901F8;
    v10[4] = 0;
    v10[5] = 0;
    v10[3] = 0;
    *(_QWORD *)&v19 = v10 + 3;
    *((_QWORD *)&v19 + 1) = v10;
    std::shared_ptr<std::vector<unsigned short>>::operator=[abi:ne180100]((uint64_t)&v7->_contentLengths, &v19);
    v11 = (std::__shared_weak_count *)*((_QWORD *)&v19 + 1);
    if (*((_QWORD *)&v19 + 1))
    {
      v12 = (unint64_t *)(*((_QWORD *)&v19 + 1) + 8);
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
    v14 = operator new(0x30uLL);
    v14[1] = 0;
    v14[2] = 0;
    *v14 = &unk_2509901F8;
    v14[4] = 0;
    v14[5] = 0;
    v14[3] = 0;
    *(_QWORD *)&v19 = v14 + 3;
    *((_QWORD *)&v19 + 1) = v14;
    std::shared_ptr<std::vector<unsigned short>>::operator=[abi:ne180100]((uint64_t)&v7->_metaContentLengths, &v19);
    v15 = (std::__shared_weak_count *)*((_QWORD *)&v19 + 1);
    if (*((_QWORD *)&v19 + 1))
    {
      v16 = (unint64_t *)(*((_QWORD *)&v19 + 1) + 8);
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
  }

  return v7;
}

- (void)addSetChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  unsigned __int16 v7;
  unsigned __int16 **ptr;
  unsigned __int16 *v9;
  unint64_t v10;
  unsigned __int16 *v11;
  unsigned __int16 *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  char *v20;
  __int16 v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  unsigned __int16 v28;
  unsigned __int16 **v29;
  unsigned __int16 *v30;
  unint64_t v31;
  unsigned __int16 *v32;
  unsigned __int16 *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  __int16 v41;
  void *v42;
  void *v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v44 = a3;
  objc_msgSend(v44, "sharedItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  ptr = (unsigned __int16 **)self->_contentLengths.__ptr_;
  v9 = ptr[1];
  v10 = (unint64_t)ptr[2];
  if ((unint64_t)v9 >= v10)
  {
    v12 = *ptr;
    v13 = (char *)v9 - (char *)*ptr;
    if (v13 <= -3)
      std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
    v14 = v13 >> 1;
    v15 = v10 - (_QWORD)v12;
    if (v15 <= (v13 >> 1) + 1)
      v16 = v14 + 1;
    else
      v16 = v15;
    if (v15 >= 0x7FFFFFFFFFFFFFFELL)
      v17 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v17 = v16;
    if (v17)
    {
      v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)(ptr + 2), v17);
      v12 = *ptr;
      v9 = ptr[1];
    }
    else
    {
      v18 = 0;
    }
    v19 = &v18[2 * v14];
    v20 = &v18[2 * v17];
    *(_WORD *)v19 = v7;
    v11 = (unsigned __int16 *)(v19 + 2);
    while (v9 != v12)
    {
      v21 = *--v9;
      *((_WORD *)v19 - 1) = v21;
      v19 -= 2;
    }
    *ptr = (unsigned __int16 *)v19;
    ptr[1] = v11;
    ptr[2] = (unsigned __int16 *)v20;
    if (v12)
      operator delete(v12);
  }
  else
  {
    *v9 = v7;
    v11 = v9 + 1;
  }
  ptr[1] = v11;
  self->_sumContentLength += v7;
  objc_msgSend(v44, "allLocalInstances");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v43, "count"))
  {
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v22 = v43;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v46 != v24)
            objc_enumerationMutation(v22);
          objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "metaContent");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "data");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "length");

          v29 = (unsigned __int16 **)self->_metaContentLengths.__ptr_;
          v30 = v29[1];
          v31 = (unint64_t)v29[2];
          if ((unint64_t)v30 >= v31)
          {
            v33 = *v29;
            v34 = (char *)v30 - (char *)*v29;
            if (v34 <= -3)
              std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
            v35 = v34 >> 1;
            v36 = v31 - (_QWORD)v33;
            if (v36 <= (v34 >> 1) + 1)
              v37 = v35 + 1;
            else
              v37 = v36;
            if (v36 >= 0x7FFFFFFFFFFFFFFELL)
              v38 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v38 = v37;
            if (v38)
            {
              v39 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<unsigned short>>((uint64_t)(v29 + 2), v38);
              v33 = *v29;
              v30 = v29[1];
            }
            else
            {
              v39 = 0;
            }
            v40 = &v39[2 * v35];
            *(_WORD *)v40 = v28;
            v32 = (unsigned __int16 *)(v40 + 2);
            while (v30 != v33)
            {
              v41 = *--v30;
              *((_WORD *)v40 - 1) = v41;
              v40 -= 2;
            }
            *v29 = (unsigned __int16 *)v40;
            v29[1] = v32;
            v29[2] = (unsigned __int16 *)&v39[2 * v38];
            if (v33)
              operator delete(v33);
          }
          else
          {
            *v30 = v28;
            v32 = v30 + 1;
          }
          v29[1] = v32;
          self->_sumMetaContentLength += v28;
        }
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v23);
    }

    ++self->_localContentCount;
  }
  objc_msgSend(v44, "allDevices");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObjectsFromArray:](self->_devices, "addObjectsFromArray:", v42);
  self->_deviceContentCount += objc_msgSend(v42, "count");

}

- (id)compute
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  __shared_weak_count *cntrl;
  unint64_t *v7;
  unint64_t v8;
  double v9;
  double v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  __shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  double v20;
  double v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __shared_weak_count *v41;
  void *ptr;
  __shared_weak_count *v43;
  _QWORD v44[12];
  _QWORD v45[14];

  v45[12] = *MEMORY[0x24BDAC8D0];
  v3 = *((_QWORD *)self->_contentLengths.__ptr_ + 1) - *(_QWORD *)self->_contentLengths.__ptr_;
  v4 = v3 >> 1;
  if (v3)
    v5 = (double)self->_sumContentLength / (double)(unint64_t)v4;
  else
    v5 = 0.0;
  cntrl = self->_contentLengths.__cntrl_;
  ptr = self->_contentLengths.__ptr_;
  v43 = cntrl;
  if (cntrl)
  {
    v7 = (unint64_t *)((char *)cntrl + 8);
    do
      v8 = __ldxr(v7);
    while (__stxr(v8 + 1, v7));
  }
  +[CCSetMetrics _populationStandardDeviation:mean:](CCSetMetrics, "_populationStandardDeviation:mean:", &ptr, v5);
  v10 = v9;
  v11 = (std::__shared_weak_count *)v43;
  if (v43)
  {
    v12 = (unint64_t *)((char *)v43 + 8);
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  v14 = *((_QWORD *)self->_metaContentLengths.__ptr_ + 1) - *(_QWORD *)self->_metaContentLengths.__ptr_;
  v15 = v14 >> 1;
  if (v14)
    v16 = (double)self->_sumMetaContentLength / (double)(unint64_t)v15;
  else
    v16 = 0.0;
  v17 = self->_metaContentLengths.__cntrl_;
  v40 = self->_metaContentLengths.__ptr_;
  v41 = v17;
  if (v17)
  {
    v18 = (unint64_t *)((char *)v17 + 8);
    do
      v19 = __ldxr(v18);
    while (__stxr(v19 + 1, v18));
  }
  +[CCSetMetrics _populationStandardDeviation:mean:](CCSetMetrics, "_populationStandardDeviation:mean:", &v40, v16);
  v21 = v20;
  v22 = (std::__shared_weak_count *)v41;
  if (v41)
  {
    v23 = (unint64_t *)((char *)v41 + 8);
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  v25 = -[CCSet itemType](self->_set, "itemType");
  -[CCSetDistribution _sanitizedEncodedDescriptors](self, "_sanitizedEncodedDescriptors");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = CFSTR("itemType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v25);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v38;
  v45[1] = v39;
  v44[1] = CFSTR("encodedDescriptors");
  v44[2] = CFSTR("contentCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v37;
  v44[3] = CFSTR("contentLengthMean");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v5);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v45[3] = v36;
  v44[4] = CFSTR("contentLengthStdev");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v10);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v45[4] = v26;
  v44[5] = CFSTR("metaContentCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v15);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v45[5] = v27;
  v44[6] = CFSTR("metaContentLengthMean");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v16);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v45[6] = v28;
  v44[7] = CFSTR("metaContentLengthStdev");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v21);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v45[7] = v29;
  v44[8] = CFSTR("localContentCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_localContentCount);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v45[8] = v30;
  v44[9] = CFSTR("deviceContributorCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[NSMutableSet count](self->_devices, "count"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v45[9] = v31;
  v44[10] = CFSTR("deviceContributedContentCount");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_deviceContentCount);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v45[10] = v32;
  v44[11] = CFSTR("isSynchronized");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v45[11] = v33;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 12);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

- (id)_sanitizedEncodedDescriptors
{
  uint64_t *p_set;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  __CFString *v14;
  NSObject *v15;
  void *v17;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  p_set = (uint64_t *)&self->_set;
  -[CCSet descriptors](self->_set, "descriptors");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v17, "count"));
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = v17;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v8, "key");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "isEqual:", CFSTR("sourceIdentifier")) & 1) != 0
          || objc_msgSend(v9, "isEqual:", CFSTR("localeIdentifier")))
        {
          objc_msgSend(v3, "addObject:", v8);
        }
        __biome_log_for_category();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          v11 = *p_set;
          *(_DWORD *)buf = 138412546;
          v24 = v9;
          v25 = 2112;
          v26 = v11;
          _os_log_debug_impl(&dword_237B25000, v10, OS_LOG_TYPE_DEBUG, "Filtering out descriptor with key: %@ for set: %@", buf, 0x16u);
        }

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v5);
  }

  v18 = 0;
  +[BMResourceDescriptor encodedStringFromDescriptors:error:](CCSetDescriptor, "encodedStringFromDescriptors:error:", v3, &v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v18;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    __biome_log_for_category();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CCSetDistribution _sanitizedEncodedDescriptors].cold.1(p_set, (uint64_t)v13, v15);

    v14 = &stru_250991730;
  }

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
  std::shared_ptr<std::vector<unsigned short>>::~shared_ptr[abi:ne180100]((uint64_t)&self->_metaContentLengths);
  std::shared_ptr<std::vector<unsigned short>>::~shared_ptr[abi:ne180100]((uint64_t)&self->_contentLengths);
  objc_storeStrong((id *)&self->_set, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  return self;
}

- (void)_sanitizedEncodedDescriptors
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_237B25000, log, OS_LOG_TYPE_ERROR, "Failed to encode sanitized descriptors for set: %@ error: %@", (uint8_t *)&v4, 0x16u);
}

@end
