@implementation VCPEmbeddingSummarizationAnalyzer

- (int)findSummarizedEmbeddings:(id)a3
{
  NSArray *v4;
  NSArray *videoEmbeddings;
  NSMutableArray *v6;
  NSMutableArray *summarizedEmbeddingIds;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t embeddingSize;
  std::vector<int>::pointer begin;
  int *v18;
  int v19;
  uint64_t *v20;
  uint64_t *v21;
  std::vector<int>::pointer v22;
  int v23;
  unint64_t v24;
  NSMutableArray *v25;
  void *v26;
  _QWORD v28[2];
  id v29;
  NSArray *v30;
  std::vector<int> v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  std::vector<int> v36;
  std::vector<int> v37;
  uint64_t *v38;
  uint64_t *v39;
  unint64_t v40;
  std::vector<int> *v41;
  _QWORD v42[18];

  v42[16] = *MEMORY[0x1E0C80C00];
  v29 = a3;
  objc_msgSend(v29, "embeddingsArray");
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  videoEmbeddings = self->_videoEmbeddings;
  self->_videoEmbeddings = v4;

  self->_embeddingSize = objc_msgSend(v29, "embeddingSize");
  if (!-[NSArray count](self->_videoEmbeddings, "count"))
  {
    v23 = 0;
    goto LABEL_36;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  summarizedEmbeddingIds = self->_summarizedEmbeddingIds;
  self->_summarizedEmbeddingIds = v6;

  v28[1] = v28;
  v38 = 0;
  v39 = 0;
  v40 = 0;
  memset(&v37, 0, sizeof(v37));
  memset(&v36, 0, sizeof(v36));
  MEMORY[0x1E0C80A78]();
  v9 = (char *)v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = self->_videoEmbeddings;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v33 != v11)
          objc_enumerationMutation(v30);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("attributes"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("embeddings"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = objc_msgSend(v14, "length");
        if (v15 != 4 * self->_embeddingSize)
        {

          v22 = 0;
          v23 = -18;
          goto LABEL_23;
        }
        objc_msgSend(v14, "getBytes:length:", v9, v15);
        dlib::matrix<float,1l,0l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>::matrix((uint64_t *)&v31, self->_embeddingSize);
        embeddingSize = self->_embeddingSize;
        if (embeddingSize)
        {
          begin = v31.__begin_;
          v18 = (int *)v9;
          do
          {
            v19 = *v18++;
            *begin++ = v19;
            --embeddingSize;
          }
          while (embeddingSize);
        }
        v20 = v39;
        if ((unint64_t)v39 >= v40)
        {
          v21 = (uint64_t *)std::vector<dlib::matrix<float,1l,0l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>>::__push_back_slow_path<dlib::matrix<float,1l,0l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout> const&>((uint64_t *)&v38, &v31.__begin_);
        }
        else
        {
          dlib::matrix<float,1l,0l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>::matrix(v39, &v31.__begin_);
          v21 = v20 + 3;
        }
        v39 = v21;
        if (v31.__begin_)
          MEMORY[0x1BCCA128C](v31.__begin_, 0x1000C8052888210);

      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
      if (v10)
        continue;
      break;
    }
  }

  if (v39 == v38)
    goto LABEL_32;
  if (0xAAAAAAAAAAAAAAABLL * (v39 - v38) > 0x3E8)
  {
    partitionEmbeddingsByKmeansWithSilhouetteScore((uint64_t *)&v38, (void **)&v37.__begin_, (uint64_t)&v31);
    v36 = v31;
  }
  else
  {
    partitionEmbeddingsBySpectralClustering((uint64_t *)&v38, &v31);
    v36 = v31;
    if (v31.__begin_ == v31.__end_)
      goto LABEL_32;
    getClusterCentroids(&v38, &v36.__begin_, (uint64_t *)&v31);
    std::vector<dlib::matrix<float,1l,0l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>>::__vdeallocate((void **)&v37.__begin_);
    v37 = v31;
    memset(&v31, 0, sizeof(v31));
    v41 = &v31;
    std::vector<dlib::matrix<float,1l,0l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v41);
  }
  if (v37.__end_ != v37.__begin_)
  {
    pickRepresentativesByDistribution((uint64_t *)&v38, (uint64_t *)&v37, &v31);
    v22 = v31.__begin_;
    if (v37.__end_ != v37.__begin_)
    {
      v24 = 0;
      do
      {
        v25 = self->_summarizedEmbeddingIds;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v22[v24]);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v25, "addObject:", v26);

        ++v24;
      }
      while (0xAAAAAAAAAAAAAAABLL * (((char *)v37.__end_ - (char *)v37.__begin_) >> 3) > v24);
    }
    v23 = 0;
LABEL_23:
    if (v22)
      operator delete(v22);
    goto LABEL_33;
  }
LABEL_32:
  v23 = -18;
LABEL_33:
  if (v36.__begin_)
    operator delete(v36.__begin_);
  v36.__begin_ = (std::vector<int>::pointer)&v37;
  std::vector<dlib::matrix<float,1l,0l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v36);
  v37.__begin_ = (std::vector<int>::pointer)&v38;
  std::vector<dlib::matrix<float,1l,0l,dlib::memory_manager_stateless_kernel_1<char>,dlib::row_major_layout>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v37);
LABEL_36:

  return v23;
}

- (id)summarizedEmbeddings
{
  void *v3;
  __int128 v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  unsigned int v10;
  const __CFDictionary *v11;
  CFDictionaryRef v12;
  CFDictionaryRef v13;
  NSMutableArray *summarizedEmbeddingIds;
  void *v15;
  void *v16;
  CMTimeRange v18;
  CMTimeRange range;
  CMTimeRange v20;
  CMTimeRange v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  CMTimeRange v26;
  const __CFString *v27;
  NSMutableArray *v28;
  _QWORD v29[3];
  _QWORD v30[3];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_videoEmbeddings, "count")
    && -[NSMutableArray count](self->_summarizedEmbeddingIds, "count"))
  {
    v4 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
    *(_OWORD *)&v26.start.value = *MEMORY[0x1E0CA2E50];
    *(_OWORD *)&v26.start.epoch = v4;
    *(_OWORD *)&v26.duration.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 32);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v5 = self->_summarizedEmbeddingIds;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v23 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          v10 = objc_msgSend(v9, "unsignedIntValue");
          if (-[NSArray count](self->_videoEmbeddings, "count") > v10)
          {
            memset(&v21, 0, sizeof(v21));
            -[NSArray objectAtIndexedSubscript:](self->_videoEmbeddings, "objectAtIndexedSubscript:", objc_msgSend(v9, "unsignedIntValue"));
            v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
            CMTimeRangeMakeFromDictionary(&v21, v11);

            range = v21;
            v18 = v26;
            CMTimeRangeGetUnion(&v20, &range, &v18);
            v26 = v20;
          }
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
      }
      while (v6);
    }

    v29[0] = CFSTR("start");
    *(_OWORD *)&v21.start.value = *(_OWORD *)&v26.start.value;
    v21.start.epoch = v26.start.epoch;
    v12 = CMTimeCopyAsDictionary(&v21.start, 0);
    v30[0] = v12;
    v29[1] = CFSTR("duration");
    v21.start = v26.duration;
    v13 = CMTimeCopyAsDictionary(&v21.start, 0);
    v30[1] = v13;
    v29[2] = CFSTR("attributes");
    summarizedEmbeddingIds = self->_summarizedEmbeddingIds;
    v27 = CFSTR("embeddingIds");
    v28 = summarizedEmbeddingIds;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v16);

  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summarizedEmbeddingIds, 0);
  objc_storeStrong((id *)&self->_videoEmbeddings, 0);
}

@end
