@implementation EARFormatter

void __111___EARFormatter_initWithQuasarConfig_overrideConfigFiles_supportEmojiRecognition_language_skipPathsExistCheck___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  std::string *v13;
  std::string *v14;
  uint64_t v15;
  void *__p[2];
  std::string::size_type v17;
  std::__split_buffer<std::string> __v;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v3)
  {
    objc_msgSend(v3, "ear_toString");
  }
  else
  {
    *(_OWORD *)__p = 0uLL;
    v17 = 0;
  }
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_QWORD *)(v5 + 56);
  if (v7 >= v6)
  {
    v8 = *(_QWORD *)(v5 + 48);
    v9 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - v8) >> 3);
    v10 = v9 + 1;
    if (v9 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<int>::__throw_length_error[abi:ne180100]();
    v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v6 - v8) >> 3);
    if (2 * v11 > v10)
      v10 = 2 * v11;
    if (v11 >= 0x555555555555555)
      v12 = 0xAAAAAAAAAAAAAAALL;
    else
      v12 = v10;
    __v.__end_cap_.__value_ = (std::allocator<std::string> *)(v5 + 64);
    if (v12)
      v13 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>(v5 + 64, v12);
    else
      v13 = 0;
    v14 = v13 + v9;
    __v.__first_ = v13;
    __v.__begin_ = v14;
    __v.__end_cap_.__value_ = &v13[v12];
    v14->__r_.__value_.__r.__words[2] = v17;
    *(_OWORD *)&v14->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
    __v.__end_ = v14 + 1;
    std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)(v5 + 48), &__v);
    v15 = *(_QWORD *)(v5 + 56);
    std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::wstring> *)&__v);
    *(_QWORD *)(v5 + 56) = v15;
  }
  else
  {
    *(_QWORD *)(v7 + 16) = v17;
    *(_OWORD *)v7 = *(_OWORD *)__p;
    *(_QWORD *)(v5 + 56) = v7 + 24;
  }

}

void __82___EARFormatter_recognizeEmojiForTokens_emojiTokenIndices_persistEmoji_choiceIdx___block_invoke(uint64_t a1, void *a2, _BOOL8 a3, uint64_t a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = v7;
  if (a3)
  {
    a3 = *(_BYTE *)(a1 + 40) == 0;
    a4 += *(unsigned __int8 *)(a1 + 40);
  }
  v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a3, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v11);

}

uint64_t __82___EARFormatter_recognizeEmojiForTokens_emojiTokenIndices_persistEmoji_choiceIdx___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  objc_msgSend(a2, "objectAtIndex:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "rangeValue");
  v8 = objc_msgSend(v6, "rangeValue");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "compare:", v10);

  return v11;
}

@end
