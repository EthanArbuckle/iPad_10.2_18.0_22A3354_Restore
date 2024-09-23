@implementation _ACComponentVector

- (_ACComponentVector)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  char *end;
  char *value;
  uint64_t v16;
  unint64_t *v17;
  unint64_t v18;
  void *v19;
  _BYTE *begin;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  uint64_t v26;
  char *v27;
  __int128 v28;
  unint64_t *v29;
  unint64_t v30;
  _QWORD *v31;
  _QWORD *v32;
  char *v33;
  __int128 v34;
  int64x2_t v35;
  void *v36;
  id v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  int64x2_t v45;
  void *v46;
  __compressed_pair<std::shared_ptr<APComponent> *, std::allocator<std::shared_ptr<APComponent>>> *p_end_cap;
  _BYTE v48[128];
  _QWORD v49[4];

  v49[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v49[0] = objc_opt_class();
  v49[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("components"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v39;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v38 = v4;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    v9 = v39;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v41 != v11)
            objc_enumerationMutation(v9);
          v13 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            end = (char *)self->mVector.__end_;
            value = (char *)self->mVector.__end_cap_.__value_;
            if (end >= value)
            {
              begin = self->mVector.__begin_;
              v21 = (end - begin) >> 4;
              v22 = v21 + 1;
              if ((unint64_t)(v21 + 1) >> 60)
                std::vector<float>::__throw_length_error[abi:ne180100]();
              v23 = value - begin;
              if (v23 >> 3 > v22)
                v22 = v23 >> 3;
              if ((unint64_t)v23 >= 0x7FFFFFFFFFFFFFF0)
                v24 = 0xFFFFFFFFFFFFFFFLL;
              else
                v24 = v22;
              p_end_cap = &self->mVector.__end_cap_;
              v25 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<applesauce::CF::StringRef,applesauce::CF::StringRef>>>(v24);
              v27 = &v25[16 * v21];
              v28 = *(_OWORD *)(v13 + 8);
              *(_OWORD *)v27 = v28;
              if (*((_QWORD *)&v28 + 1))
              {
                v29 = (unint64_t *)(*((_QWORD *)&v28 + 1) + 8);
                do
                  v30 = __ldxr(v29);
                while (__stxr(v30 + 1, v29));
              }
              v32 = self->mVector.__begin_;
              v31 = self->mVector.__end_;
              if (v31 == v32)
              {
                v35 = vdupq_n_s64((unint64_t)v31);
                v33 = &v25[16 * v21];
              }
              else
              {
                v33 = &v25[16 * v21];
                do
                {
                  v34 = *((_OWORD *)v31 - 1);
                  v31 -= 2;
                  *((_OWORD *)v33 - 1) = v34;
                  v33 -= 16;
                  *v31 = 0;
                  v31[1] = 0;
                }
                while (v31 != v32);
                v35 = *(int64x2_t *)&self->mVector.__begin_;
              }
              v19 = v27 + 16;
              self->mVector.__begin_ = v33;
              self->mVector.__end_ = v27 + 16;
              v45 = v35;
              v36 = self->mVector.__end_cap_.__value_;
              self->mVector.__end_cap_.__value_ = &v25[16 * v26];
              v46 = v36;
              v44 = v35.i64[0];
              std::__split_buffer<std::shared_ptr<unsigned char []>>::~__split_buffer((uint64_t)&v44);
            }
            else
            {
              *(_QWORD *)end = *(_QWORD *)(v13 + 8);
              v16 = *(_QWORD *)(v13 + 16);
              *((_QWORD *)end + 1) = v16;
              if (v16)
              {
                v17 = (unint64_t *)(v16 + 8);
                do
                  v18 = __ldxr(v17);
                while (__stxr(v18 + 1, v17));
              }
              v19 = end + 16;
            }
            self->mVector.__end_ = v19;
            self->mVector.mSorted = 0;
          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      }
      while (v10);
    }

    v4 = v38;
    v8 = v39;
  }

  return self;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_BYTE *)self + 32) = 1;
  return self;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  char *begin;
  char *i;
  _ACComponentWrapper *v7;
  id v8;

  v8 = a3;
  v4 = (void *)objc_opt_new();
  begin = (char *)self->mVector.__begin_;
  for (i = (char *)self->mVector.__end_; begin != i; begin += 16)
  {
    v7 = -[_ACComponentWrapper initWithComponent:]([_ACComponentWrapper alloc], "initWithComponent:", begin);
    objc_msgSend(v4, "addObject:", v7);

  }
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("components"));

}

- (void).cxx_destruct
{
  AudioComponentVector *p_mVector;

  p_mVector = &self->mVector;
  std::vector<std::shared_ptr<AudioMetadataTimeline::Node<AudioMetadataStreamFormat,AudioMetadataTimeline::Node<AudioMetadataTrackFormat,AudioMetadataTimeline::Node<AudioMetadataTrackUID,AudioMetadataTimeline::Node<AudioMetadataObject,AudioMetadataTimeline::Node<AudioMetadataContent,AudioMetadataTimeline::Node<AudioMetadataProgramme,AudioMetadataTimeline::Node<AudioMetadataFormatExtended,decltype(nullptr)>>>>>>>>>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_mVector);
}

- (_ACComponentVector)initWithVector:(const void *)a3
{
  AudioComponentVector *p_mVector;

  p_mVector = &self->mVector;
  if (p_mVector != a3)
    std::vector<std::shared_ptr<APComponent>>::__assign_with_size[abi:ne180100]<std::shared_ptr<APComponent>*,std::shared_ptr<APComponent>*>((uint64_t)p_mVector, *(uint64_t **)a3, *((uint64_t **)a3 + 1), (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 4);
  self->mVector.mSorted = *((_BYTE *)a3 + 24);
  return self;
}

@end
