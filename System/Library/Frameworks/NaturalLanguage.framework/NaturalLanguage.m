void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  std::string *v5;
  std::string::size_type v6;
  std::string::size_type v7;
  std::string *v8;

  v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8)
      std::string::__throw_length_error[abi:ne180100]();
    v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17)
      v6 = __sz | 7;
    v7 = v6 + 1;
    v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    v5 = v8;
  }
  else
  {
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

void std::vector<std::string>::__swap_out_circular_buffer(std::vector<std::string> *this, std::__split_buffer<std::string> *__v)
{
  std::string *v4;
  std::string *begin;
  std::string *end;
  std::string *value;

  std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>((uint64_t)&this->__end_cap_, (uint64_t)this->__end_, (uint64_t)this->__end_, (uint64_t)this->__begin_, (uint64_t)this->__begin_, (uint64_t)__v->__begin_, (uint64_t)__v->__begin_);
  __v->__begin_ = v4;
  begin = this->__begin_;
  this->__begin_ = v4;
  __v->__begin_ = begin;
  end = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = end;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
}

void std::__split_buffer<std::string>::~__split_buffer(std::__split_buffer<std::string> *this)
{
  std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100]((uint64_t)this, (void **)&this->__begin_->__r_.__value_.__l.__data_);
  if (this->__first_)
    operator delete(this->__first_);
}

std::vector<int> *__cdecl std::vector<int>::vector(std::vector<int> *this, std::vector<int>::size_type __n, const std::vector<int>::value_type *__x)
{
  std::vector<int>::pointer end;
  int *v7;
  std::vector<int>::size_type v8;

  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  if (__n)
  {
    std::vector<int>::__vallocate[abi:ne180100](this, __n);
    end = this->__end_;
    v7 = &end[__n];
    v8 = 4 * __n;
    do
    {
      *end++ = *__x;
      v8 -= 4;
    }
    while (v8);
    this->__end_ = v7;
  }
  return this;
}

void sub_1A36A91A4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<double>::__append(char **a1, unint64_t a2)
{
  uint64_t v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;

  v6 = a1[2];
  v4 = (uint64_t)(a1 + 2);
  v5 = v6;
  v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 3)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 8 * a2);
      v7 += 8 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    v8 = *a1;
    v9 = v7 - *a1;
    v10 = a2 + (v9 >> 3);
    if (v10 >> 61)
      std::vector<double>::__throw_length_error[abi:ne180100]();
    v11 = v9 >> 3;
    v12 = v5 - v8;
    if (v12 >> 2 > v10)
      v10 = v12 >> 2;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8)
      v13 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v13 = v10;
    if (v13)
    {
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v4, v13);
      v8 = *a1;
      v7 = a1[1];
    }
    else
    {
      v14 = 0;
    }
    v15 = &v14[8 * v11];
    v16 = &v14[8 * v13];
    bzero(v15, 8 * a2);
    v17 = &v15[8 * a2];
    while (v7 != v8)
    {
      v18 = *((_QWORD *)v7 - 1);
      v7 -= 8;
      *((_QWORD *)v15 - 1) = v18;
      v15 -= 8;
    }
    *a1 = v15;
    a1[1] = v17;
    a1[2] = v16;
    if (v8)
      operator delete(v8);
  }
}

BOOL BOOLDefaultForKey(uint64_t a1)
{
  id v1;
  const char *v2;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NL%@"), a1);
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v2 = (const char *)objc_msgSend(v1, "UTF8String");

  return getenv(v2) != 0;
}

id stringDefaultForKey(uint64_t a1)
{
  id v1;
  const char *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NL%@"), a1);
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v2 = (const char *)objc_msgSend(v1, "UTF8String");

  v3 = getenv(v2);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

uint64_t BOOLForKey(void *a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "objectForKey:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("YES")) & 1) != 0)
    {
      a3 = 1;
    }
    else
    {
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("NO")) & 1) == 0)
      {
        v5 = objc_msgSend(v4, "length");
        a3 = 1;
        if (!objc_msgSend(v4, "compare:options:range:", CFSTR("YES"), 1, 0, v5))
          goto LABEL_13;
        if (objc_msgSend(v4, "compare:options:range:", CFSTR("NO"), 1, 0, v5))
        {
          a3 = 1;
          if (!objc_msgSend(v4, "compare:options:range:", CFSTR("Y"), 1, 0, v5))
            goto LABEL_13;
          if (objc_msgSend(v4, "compare:options:range:", CFSTR("N"), 1, 0, v5))
          {
            a3 = objc_msgSend(v4, "integerValue") != 0;
            goto LABEL_13;
          }
        }
      }
      a3 = 0;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      a3 = objc_msgSend(v4, "BOOLValue");
  }
LABEL_13:

  return a3;
}

uint64_t BOOLForKeyWithDefault(void *a1, void *a2)
{
  id v3;
  id v4;
  _BOOL8 v5;
  uint64_t v6;

  v3 = a2;
  v4 = a1;
  v5 = BOOLDefaultForKey((uint64_t)v3);
  v6 = BOOLForKey(v4, (uint64_t)v3, v5);

  return v6;
}

uint64_t unsignedIntegerForKey(void *a1, uint64_t a2, uint64_t a3)
{
  void *v4;

  objc_msgSend(a1, "objectForKey:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      a3 = objc_msgSend(v4, "unsignedIntegerValue");
  }

  return a3;
}

id stringForKey(void *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  objc_msgSend(a1, "objectForKey:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (v6)
  {
    objc_opt_class();
    v7 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v6;

    }
  }

  return v7;
}

id stringForKeyWithDefault(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = a2;
  v7 = a1;
  stringDefaultForKey((uint64_t)v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v10 = v9;

    v8 = v10;
  }
  else if (!v8)
  {
    v8 = v5;
  }

  return v8;
}

id localizationForOptions(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  objc_msgSend(v1, "objectForKey:", CFSTR("Localization"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(v1, "objectForKey:", CFSTR("Locale"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (!v3 || (objc_msgSend(v3, "localeIdentifier"), (v2 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(v1, "objectForKey:", CFSTR("Language"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v2;
}

uint64_t granularityForOptions(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "objectForKey:", CFSTR("Granularity"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    if (objc_msgSend(v1, "integerValue") == 1)
      v3 = 1;
    else
      v3 = 2;
  }
  else
  {
    v3 = 2;
  }

  return v3;
}

id splitIndexes(unint64_t a1, double a2, double a3)
{
  NLNumberGenerator *v6;
  void *v7;
  void *v8;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(NLNumberGenerator);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  if (a2 >= 0.0 && a3 >= 0.0 && a2 + a3 <= 1.0)
  {
    v10 = (unint64_t)((double)a1 * a2);
    v11 = (unint64_t)((double)a1 * a3);
    v12 = a1 - (v10 + v11);
    if (a1)
    {
      v13 = 0;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v14);

        ++v13;
      }
      while (a1 != v13);
      if (a1 >= 2)
      {
        do
        {
          v15 = a1--;
          v16 = -[NLNumberGenerator numberInRange:](v6, "numberInRange:", 0, v15);
          if (a1 != v16)
            objc_msgSend(v7, "exchangeObjectAtIndex:withObjectAtIndex:", a1, v16);
        }
        while (a1 > 1);
      }
    }
    objc_msgSend(v7, "subarrayWithRange:", 0, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sortedArrayUsingSelector:", sel_compare_);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "subarrayWithRange:", v12, v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sortedArrayUsingSelector:", sel_compare_);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "subarrayWithRange:", v12 + v10, v11);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sortedArrayUsingSelector:", sel_compare_);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v24[0] = v18;
    v24[1] = v20;
    v24[2] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

uint64_t tokenIsSentenceTerminator(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = a1;
  if (tokenIsSentenceTerminator_onceToken != -1)
    dispatch_once(&tokenIsSentenceTerminator_onceToken, &__block_literal_global);
  objc_msgSend(v1, "rangeOfCharacterFromSet:", tokenIsSentenceTerminator_sentenceTerminatorCharacterSet);
  if (!v2
    || (objc_msgSend(v1, "rangeOfCharacterFromSet:", tokenIsSentenceTerminator_nonSentenceTerminatorCharacterSet), v3)
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("..")) & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v4 = objc_msgSend(v1, "isEqualToString:", CFSTR("...")) ^ 1;
  }

  return v4;
}

void __tokenIsSentenceTerminator_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(".?!。！．？｡"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)tokenIsSentenceTerminator_sentenceTerminatorCharacterSet;
  tokenIsSentenceTerminator_sentenceTerminatorCharacterSet = v0;

  objc_msgSend((id)tokenIsSentenceTerminator_sentenceTerminatorCharacterSet, "invertedSet");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)tokenIsSentenceTerminator_nonSentenceTerminatorCharacterSet;
  tokenIsSentenceTerminator_nonSentenceTerminatorCharacterSet = v2;

}

id normalizedWord(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  void *v4;

  v1 = a1;
  if (normalizedWord_onceToken != -1)
    dispatch_once(&normalizedWord_onceToken, &__block_literal_global_21);
  objc_msgSend(v1, "rangeOfCharacterFromSet:", normalizedWord_nonLatinBasicExtendedABCharacterSet);
  if (v2)
  {
    objc_msgSend(v1, "precomposedStringWithCanonicalMapping");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = v1;
  }
  v4 = v3;

  return v4;
}

void __normalizedWord_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithRange:", 0, 591);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)normalizedWord_latinBasicExtendedABCharacterSet;
  normalizedWord_latinBasicExtendedABCharacterSet = v0;

  objc_msgSend((id)normalizedWord_latinBasicExtendedABCharacterSet, "invertedSet");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)normalizedWord_nonLatinBasicExtendedABCharacterSet;
  normalizedWord_nonLatinBasicExtendedABCharacterSet = v2;

}

uint64_t tokenIDFromTokenAndVocabularyMap(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  normalizedWord(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = objc_msgSend(v5, "unsignedIntegerValue");
  else
    v6 = 3;

  return v6;
}

id wordRangesFromSentence(void *a1, __CFStringTokenizer *a2)
{
  __CFString *v3;
  void *v4;
  unint64_t v5;
  CFStringTokenizerRef v6;
  CFRange CurrentTokenRange;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  CFRange v23;
  CFRange v24;
  CFRange v25;

  v3 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[__CFString length](v3, "length");
  if (wordRangesFromSentence_onceToken != -1)
  {
    dispatch_once(&wordRangesFromSentence_onceToken, &__block_literal_global_22);
    if (a2)
      goto LABEL_3;
LABEL_5:
    v23.location = 0;
    v23.length = 0;
    v6 = CFStringTokenizerCreate(0, &stru_1E4A3BA10, v23, 0, 0);
    a2 = v6;
    goto LABEL_6;
  }
  if (!a2)
    goto LABEL_5;
LABEL_3:
  v6 = 0;
LABEL_6:
  v24.location = 0;
  v24.length = v5;
  CFStringTokenizerSetString(a2, v3, v24);
  while (CFStringTokenizerAdvanceToNextToken(a2))
  {
    CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(a2);
    if (CurrentTokenRange.length < 1)
      break;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", CurrentTokenRange.location, CurrentTokenRange.length);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

  }
  v25.location = 0;
  v25.length = 0;
  CFStringTokenizerSetString(a2, &stru_1E4A3BA10, v25);
  if (v6)
    CFRelease(v6);
  if (objc_msgSend(v4, "count"))
  {
    v9 = 0;
    do
    {
      v10 = v9;
      objc_msgSend(v4, "objectAtIndex:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "rangeValue");
      v14 = v13;

      v9 = v10 + 1;
      while (v9 < objc_msgSend(v4, "count"))
      {
        v15 = v14 + v12;
        if (v15 >= v5)
          break;
        -[__CFString rangeOfCharacterFromSet:options:range:](v3, "rangeOfCharacterFromSet:options:range:", wordRangesFromSentence_wordJoinerCharacterSet, 8, v15, 1);
        if (!v16)
          break;
        objc_msgSend(v4, "objectAtIndex:", v10 + 1);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "rangeValue");
        v20 = v19;

        if (v18 != v15 + 1)
          break;
        v14 = v20 - v12 + v18;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v12, v14);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "replaceObjectAtIndex:withObject:", v10, v21);

        objc_msgSend(v4, "removeObjectAtIndex:", v10 + 1);
      }
    }
    while (v9 < objc_msgSend(v4, "count"));
  }

  return v4;
}

void __wordRangesFromSentence_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(".-'_‐‑’"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)wordRangesFromSentence_wordJoinerCharacterSet;
  wordRangesFromSentence_wordJoinerCharacterSet = v0;

}

id tokenRangesFromSentence(void *a1, __CFStringTokenizer *a2)
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  unint64_t v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;

  v3 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  wordRangesFromSentence(v3, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "length");
  v7 = objc_msgSend(v5, "count");
  v8 = v7;
  if (tokenRangesFromSentence_onceToken == -1)
  {
    if (!v7)
      goto LABEL_10;
  }
  else
  {
    dispatch_once(&tokenRangesFromSentence_onceToken, &__block_literal_global_28);
    if (!v8)
      goto LABEL_10;
  }
  v23 = v6;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  do
  {
    v12 = v11;
    v13 = v9;
    objc_msgSend(v5, "objectAtIndex:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v14, "rangeValue");
    v9 = v15;

    v16 = v12 + v13;
    v17 = v11 >= v12 + v13;
    v18 = v11 - (v12 + v13);
    if (v18 != 0 && v17)
    {
      objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", tokenRangesFromSentence_nonWhitespaceAndNewlineCharacterSet, 0, v16, v18);
      if (v19)
      {
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __tokenRangesFromSentence_block_invoke_2;
        v26[3] = &unk_1E4A3A538;
        v27 = v4;
        objc_msgSend(v3, "enumerateSubstringsInRange:options:usingBlock:", v16, v18, 2, v26);

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v11, v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v20);

    ++v10;
  }
  while (v8 != v10);
  v8 = v11 + v9;
  v6 = v23;
LABEL_10:
  if (v6 > v8)
  {
    objc_msgSend(v3, "rangeOfCharacterFromSet:options:range:", tokenRangesFromSentence_nonWhitespaceAndNewlineCharacterSet, 0, v8, v6 - v8);
    if (v21)
    {
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __tokenRangesFromSentence_block_invoke_3;
      v24[3] = &unk_1E4A3A538;
      v25 = v4;
      objc_msgSend(v3, "enumerateSubstringsInRange:options:usingBlock:", v8, v6 - v8, 2, v24);

    }
  }

  return v4;
}

void __tokenRangesFromSentence_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invertedSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)tokenRangesFromSentence_nonWhitespaceAndNewlineCharacterSet;
  tokenRangesFromSentence_nonWhitespaceAndNewlineCharacterSet = v0;

}

void __tokenRangesFromSentence_block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  BOOL v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  if (a4 != 1 || (v7 = objc_msgSend(v12, "characterAtIndex:", 0) == 32, v8 = v12, !v7))
  {
    objc_msgSend(v12, "rangeOfCharacterFromSet:", tokenRangesFromSentence_nonWhitespaceAndNewlineCharacterSet);
    v8 = v12;
    if (v9)
    {
      v10 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a3, a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v11);

      v8 = v12;
    }
  }

}

void __tokenRangesFromSentence_block_invoke_3(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  BOOL v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  if (a4 != 1 || (v7 = objc_msgSend(v12, "characterAtIndex:", 0) == 32, v8 = v12, !v7))
  {
    objc_msgSend(v12, "rangeOfCharacterFromSet:", tokenRangesFromSentence_nonWhitespaceAndNewlineCharacterSet);
    v8 = v12;
    if (v9)
    {
      v10 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a3, a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v11);

      v8 = v12;
    }
  }

}

void generateTokenSequence(void *a1, __CFStringTokenizer *a2, void *a3, void *a4, void *a5)
{
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;

  v25 = a1;
  v24 = a3;
  v23 = a4;
  v9 = a5;
  tokenRangesFromSentence(v25, a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = 0;
    do
    {
      v15 = v14;
      objc_msgSend(v10, "objectAtIndex:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "rangeValue");
      v19 = v18;

      objc_msgSend(v25, "substringWithRange:", v17, v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      normalizedWord(v20);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v24, "addObject:", v14);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObject:", v21);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v22);

      }
      ++v13;
    }
    while (v12 != v13);

  }
}

id inputSequenceFromSentence(void *a1, __CFStringTokenizer *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v3 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  tokenRangesFromSentence(v3, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    do
    {
      v10 = v9;
      objc_msgSend(v5, "objectAtIndex:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "rangeValue");
      v14 = v13;

      objc_msgSend(v3, "substringWithRange:", v12, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      normalizedWord(v15);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
        objc_msgSend(v4, "addObject:", v9);
      ++v8;
    }
    while (v7 != v8);

  }
  return v4;
}

id formattedOutputFromSentence(void *a1, __CFStringTokenizer *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  id v24;

  v5 = a1;
  v24 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  tokenRangesFromSentence(v5, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v9);
  objc_msgSend(v6, "appendString:", CFSTR(" "));
  if (!v8)
  {
    objc_msgSend(v6, "appendString:", v10);
    v12 = 0;
    v13 = 1;
LABEL_9:
    objc_msgSend(&stru_1E4A3BA10, "stringByPaddingToLength:withString:startingAtIndex:", 62 - 2 * v13, CFSTR("0 "), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertString:atIndex:", v20, 0);

    goto LABEL_10;
  }
  v22 = v10;
  v23 = v9;
  v11 = 0;
  v12 = 0;
  v13 = 1;
  do
  {
    v14 = v12;
    objc_msgSend(v7, "objectAtIndex:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "rangeValue");
    v18 = v17;

    objc_msgSend(v5, "substringWithRange:", v16, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    normalizedWord(v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)(v13 + 2) <= 0x1F)
    {
      objc_msgSend(v6, "appendFormat:", CFSTR("%llu "), tokenIDFromTokenAndVocabularyMap(v12, v24));
      ++v13;
    }
    ++v11;
  }
  while (v8 != v11);
  v10 = v22;
  objc_msgSend(v6, "appendString:", v22);
  v9 = v23;
  if ((unint64_t)(v13 + 1) <= 0x1F)
    goto LABEL_9;
LABEL_10:

  return v6;
}

id labelFromFormattedOutput(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (labelFromFormattedOutput_onceToken != -1)
    dispatch_once(&labelFromFormattedOutput_onceToken, &__block_literal_global_39);
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", labelFromFormattedOutput_whitespaceAndNewlineCharacterSet);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(" "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v4)
    v4 = &unk_1E4A47C30;
  if (v8)
  {
    v9 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v4, "unsignedIntegerValue"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendString:", v10);

      if (++v9 < v8)
        objc_msgSend(v5, "appendString:", CFSTR(" "));
    }
    while (v8 != v9);
  }

  return v5;
}

void __labelFromFormattedOutput_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)labelFromFormattedOutput_whitespaceAndNewlineCharacterSet;
  labelFromFormattedOutput_whitespaceAndNewlineCharacterSet = v0;

}

void reportInstanceCompletionToTrainer(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  id v12;

  v7 = a1;
  if (v7)
  {
    v8 = 3 * a3;
    if ((unint64_t)(3 * a3) >= 0x2EE)
    {
      v9 = a2 + a4 * a3 + 1;
      v10 = v8 / 0xA;
      if (v8 >> 2 < 0x753)
        v10 = (unsigned __int16)(3 * a3) / 5u;
      if (v10 < 0x2EE)
        v10 = v8 >> 2;
      if (v10 < 0x2EE)
        v10 = v8 >> 1;
      if (!(v9 % v10))
      {
        v12 = v7;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u%% complete"), vcvtmd_u64_f64((double)v9 / (double)v8 * 100.0 + 0.5) | 0x4059000000000000);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "logMessage:", v11);

        v7 = v12;
      }
    }
  }

}

id topHypotheses(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v3 = a1;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __topHypotheses_block_invoke;
  v12[3] = &unk_1E4A3A560;
  v6 = v3;
  v13 = v6;
  objc_msgSend(v5, "sortedArrayUsingComparator:", v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (a2)
  {
    v8 = 0;
    do
    {
      if (objc_msgSend(v7, "count") <= v8)
        break;
      objc_msgSend(v7, "objectAtIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKey:", v10, v9);

      ++v8;
    }
    while (a2 != v8);
  }

  return v4;
}

uint64_t __topHypotheses_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKey:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  if (v9 > v12)
    return -1;
  else
    return v9 < v12;
}

double ME_Model::FunctionGradient(ME_Model *this, uint64_t a2, double **a3)
{
  uint64_t *v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;
  double *v17;
  double *v18;
  double *v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  unint64_t v24;
  double *v25;
  double *v26;
  double *v27;
  double v28;
  double *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;

  v6 = *(uint64_t **)a2;
  v7 = *(_QWORD *)(a2 + 8) - *(_QWORD *)a2;
  if (v7)
  {
    v8 = v7 >> 3;
    v9 = (_QWORD *)*((_QWORD *)this + 24);
    if (v8 <= 1)
      v8 = 1;
    do
    {
      v10 = *v6++;
      *v9++ = v10;
      --v8;
    }
    while (v8);
  }
  ME_Model::update_model_expectation(this);
  v12 = *((double *)this + 5);
  v14 = *(uint64_t **)a2;
  v13 = *(_QWORD *)(a2 + 8);
  if (v12 == 0.0)
  {
    v15 = v13 - (_QWORD)v14;
    if (v15)
    {
      v16 = v15 >> 3;
      v17 = (double *)*((_QWORD *)this + 36);
      v18 = (double *)*((_QWORD *)this + 39);
      v19 = *a3;
      if (v16 <= 1)
        v16 = 1;
      do
      {
        v20 = *v17++;
        v21 = v20;
        v22 = *v18++;
        *v19++ = -(v21 - v22);
        --v16;
      }
      while (v16);
    }
  }
  else
  {
    v23 = v13 - (_QWORD)v14;
    if (v23)
    {
      v24 = v23 >> 3;
      v25 = (double *)*((_QWORD *)this + 36);
      v26 = (double *)*((_QWORD *)this + 39);
      v27 = (double *)*((_QWORD *)this + 24);
      v28 = v12 * -2.0;
      v29 = *a3;
      if (v24 <= 1)
        v24 = 1;
      do
      {
        v30 = *v25++;
        v31 = v30;
        v32 = *v26++;
        v33 = v31 - v32;
        v34 = *v27++;
        *v29++ = -(v33 + v28 * v34);
        --v24;
      }
      while (v24);
    }
  }
  return -v11;
}

void ME_Model::update_model_expectation(ME_Model *this)
{
  void **v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  int v6;
  double v7;
  _QWORD *v8;
  int v9;
  uint64_t v10;
  double *v11;
  double v12;
  int *v13;
  int *v14;
  uint64_t v15;
  int **v16;
  int *v17;
  int *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double *v22;
  int *v23;
  uint64_t v24;
  int **v25;
  int *v26;
  int *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  uint64_t v33;
  double *v34;
  uint64_t v35;
  double v36;
  double v37;
  double *v38;
  double v39;
  double *v40[3];

  v2 = (void **)((char *)this + 312);
  std::vector<double>::resize((uint64_t)this + 312, (int)((uint64_t)(*((_QWORD *)this + 33) - *((_QWORD *)this + 32)) >> 2));
  v3 = *((_QWORD *)this + 33) - *((_QWORD *)this + 32);
  v4 = v3 >> 2;
  if ((int)(v3 >> 2) >= 1)
    bzero(*v2, (2 * v3) & 0x7FFFFFFF8);
  v5 = *((_QWORD *)this + 6);
  if (v5 == *((_QWORD *)this + 7))
  {
    v31 = 0.0;
    v8 = (_QWORD *)*((_QWORD *)this + 6);
    v7 = 0.0;
  }
  else
  {
    v6 = 0;
    v7 = 0.0;
    v8 = (_QWORD *)*((_QWORD *)this + 6);
    do
    {
      std::vector<double>::vector(v40, *((int *)this + 70));
      v9 = ME_Model::conditional_probability((uint64_t)this, v8, v40);
      v10 = *(int *)v8;
      v11 = v40[0];
      v12 = log(v40[0][v10]);
      if (v9 == (_DWORD)v10)
        ++v6;
      v13 = (int *)v8[1];
      v14 = (int *)v8[2];
      if (v13 != v14)
      {
        v15 = *((_QWORD *)this + 42);
        do
        {
          v16 = (int **)(v15 + 24 * *v13);
          v17 = *v16;
          v18 = v16[1];
          if (v17 != v18)
          {
            v19 = *((_QWORD *)this + 32);
            v20 = *((_QWORD *)this + 39);
            do
            {
              v21 = *v17++;
              *(double *)(v20 + 8 * v21) = v11[*(unsigned __int8 *)(v19 + 4 * v21)] + *(double *)(v20 + 8 * v21);
            }
            while (v17 != v18);
          }
          ++v13;
        }
        while (v13 != v14);
      }
      v22 = (double *)v8[4];
      v23 = (int *)v8[5];
      if (v22 != (double *)v23)
      {
        v24 = *((_QWORD *)this + 42);
        do
        {
          v25 = (int **)(v24 + 24 * *(int *)v22);
          v26 = *v25;
          v27 = v25[1];
          if (v26 != v27)
          {
            v28 = *((_QWORD *)this + 32);
            v29 = *((_QWORD *)this + 39);
            do
            {
              v30 = *v26++;
              *(double *)(v29 + 8 * v30) = *(double *)(v29 + 8 * v30)
                                         + v11[*(unsigned __int8 *)(v28 + 4 * v30)] * v22[1];
            }
            while (v26 != v27);
          }
          v22 += 2;
        }
        while (v22 != (double *)v23);
      }
      if (v11)
      {
        v40[1] = v11;
        operator delete(v11);
      }
      v7 = v7 + v12;
      v8 += 10;
    }
    while (v8 != *((_QWORD **)this + 7));
    v5 = *((_QWORD *)this + 6);
    v4 = (*((_QWORD *)this + 33) - *((_QWORD *)this + 32)) >> 2;
    v31 = (double)v6;
  }
  v32 = (double)(0xCCCCCCCCCCCCCCCDLL * (((uint64_t)v8 - v5) >> 4));
  v33 = v4;
  if ((int)v4 >= 1)
  {
    v34 = (double *)*v2;
    v35 = v4;
    do
    {
      *v34 = *v34 / v32;
      ++v34;
      --v35;
    }
    while (v35);
  }
  *((double *)this + 48) = 1.0 - v31 / v32;
  v36 = v7 / v32;
  v37 = *((double *)this + 5);
  if (v37 > 0.0 && (int)v4 >= 1)
  {
    v38 = (double *)*((_QWORD *)this + 24);
    do
    {
      v39 = *v38++;
      v36 = v36 + -(v39 * v39) * v37;
      --v33;
    }
    while (v33);
  }
}

void sub_1A36AC3C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t ME_Model::perform_GIS(ME_Model *this)
{
  int v2;
  void **v3;
  int v4;
  double v5;
  double v6;
  double v7;
  unint64_t v8;
  BOOL v9;
  int v10;
  unint64_t v11;
  double *v12;
  double *v13;
  uint64_t v14;
  long double *v15;
  double v16;
  double v17;
  double v18;
  void *__p;
  _BYTE *v21;
  uint64_t v22;

  v2 = 0;
  __p = 0;
  v21 = 0;
  v22 = 0;
  v3 = (void **)((char *)this + 192);
  v4 = 1;
  v5 = -999999.0;
  do
  {
    ME_Model::update_model_expectation(this);
    v7 = v6;
    if (v6 >= v5)
    {
      HIDWORD(v8) = -858993459 * v2 + 429496728;
      LODWORD(v8) = HIDWORD(v8);
      v9 = (v8 >> 1) >= 0x19999999 || v4 <= 1;
      v10 = !v9;
      if (&__p != v3)
        std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>((char *)&__p, *((char **)this + 24), *((_QWORD *)this + 25), (uint64_t)(*((_QWORD *)this + 25) - *((_QWORD *)this + 24)) >> 3);
      v4 -= v10;
      v11 = *((_QWORD *)this + 33) - *((_QWORD *)this + 32);
      if ((int)(v11 >> 2) >= 1)
      {
        v12 = (double *)*((_QWORD *)this + 36);
        v13 = (double *)*((_QWORD *)this + 39);
        v14 = (v11 >> 2);
        v15 = (long double *)*((_QWORD *)this + 24);
        do
        {
          v16 = *v12++;
          v17 = v16;
          v18 = *v13++;
          *v15 = *v15 + log(v17 / v18) / (double)v4;
          ++v15;
          --v14;
        }
        while (v14);
      }
      v5 = v7;
    }
    else
    {
      if (&__p != v3)
        std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>((char *)v3, (char *)__p, (uint64_t)v21, (v21 - (_BYTE *)__p) >> 3);
      ++v4;
      --v2;
    }
    v9 = v2++ < 199;
  }
  while (v9);
  if (__p)
  {
    v21 = __p;
    operator delete(__p);
  }
  return 0;
}

void sub_1A36AC550(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t ME_Model::perform_QUASI_NEWTON(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  void *v12;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t v15;
  void *__p[3];
  void *v18[3];

  v4 = *(_QWORD *)(a1 + 264) - *(_QWORD *)(a1 + 256);
  v5 = (unint64_t)v4 >> 2;
  std::vector<double>::vector(v18, (int)(v4 >> 2));
  v6 = ((unint64_t)v4 >> 2);
  if ((int)v5 >= 1)
  {
    v7 = *(uint64_t **)(a1 + 192);
    v8 = v18[0];
    v9 = v6;
    do
    {
      v10 = *v7++;
      *v8++ = v10;
      --v9;
    }
    while (v9);
  }
  v11 = *(double *)(a1 + 32);
  if (v11 <= 0.0)
    ME_Model::perform_LBFGS(a1, (uint64_t)v18, a2, __p);
  else
    ME_Model::perform_OWLQN((int *)a1, (uint64_t)v18, __p, v11);
  v12 = __p[0];
  if ((int)v5 < 1)
  {
    if (!__p[0])
      goto LABEL_13;
  }
  else
  {
    v13 = *(_QWORD **)(a1 + 192);
    v14 = (uint64_t *)__p[0];
    do
    {
      v15 = *v14++;
      *v13++ = v15;
      --v6;
    }
    while (v6);
  }
  operator delete(v12);
LABEL_13:
  if (v18[0])
  {
    v18[1] = v18[0];
    operator delete(v18[0]);
  }
  return 0;
}

void sub_1A36AC654(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t ME_Model::conditional_probability(uint64_t a1, _QWORD *a2, double **a3)
{
  unint64_t v6;
  int *v7;
  int *v8;
  double *v9;
  uint64_t v10;
  int **v11;
  int *v12;
  int *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double *v17;
  int *v18;
  uint64_t v19;
  int **v20;
  int *v21;
  int *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double *v26;
  BOOL v27;
  double *v28;
  double v29;
  double *v30;
  double v31;
  double v32;
  uint64_t v33;
  double v34;
  double v35;
  uint64_t v36;
  double *v37;
  double *v38;
  uint64_t v39;
  double *v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  double *v44;
  double v45;
  uint64_t v47;
  double *v48;
  double *v49;

  v6 = *(int *)(a1 + 280);
  v47 = 0;
  std::vector<double>::vector(&v48, v6, &v47);
  v7 = (int *)a2[1];
  v8 = (int *)a2[2];
  v9 = v48;
  if (v7 != v8)
  {
    v10 = *(_QWORD *)(a1 + 336);
    do
    {
      v11 = (int **)(v10 + 24 * *v7);
      v12 = *v11;
      v13 = v11[1];
      if (v12 != v13)
      {
        v14 = *(_QWORD *)(a1 + 192);
        v15 = *(_QWORD *)(a1 + 256);
        do
        {
          v16 = *v12++;
          v9[*(unsigned __int8 *)(v15 + 4 * v16)] = *(double *)(v14 + 8 * v16) + v9[*(unsigned __int8 *)(v15 + 4 * v16)];
        }
        while (v12 != v13);
      }
      ++v7;
    }
    while (v7 != v8);
    v9 = v48;
  }
  v17 = (double *)a2[4];
  v18 = (int *)a2[5];
  if (v17 != (double *)v18)
  {
    v19 = *(_QWORD *)(a1 + 336);
    do
    {
      v20 = (int **)(v19 + 24 * *(int *)v17);
      v21 = *v20;
      v22 = v20[1];
      if (v21 != v22)
      {
        v23 = *(_QWORD *)(a1 + 192);
        v24 = *(_QWORD *)(a1 + 256);
        do
        {
          v25 = *v21++;
          v9[*(unsigned __int8 *)(v24 + 4 * v25)] = v9[*(unsigned __int8 *)(v24 + 4 * v25)]
                                                  + *(double *)(v23 + 8 * v25) * v17[1];
        }
        while (v21 != v22);
      }
      v17 += 2;
    }
    while (v17 != (double *)v18);
  }
  v26 = v9 + 1;
  v27 = v9 == v49 || v26 == v49;
  v28 = v9;
  if (!v27)
  {
    v29 = *v9;
    v28 = v9;
    v30 = v9 + 1;
    do
    {
      v31 = *v30++;
      v32 = v31;
      if (v29 < v31)
      {
        v29 = v32;
        v28 = v26;
      }
      v26 = v30;
    }
    while (v30 != v49);
  }
  v33 = *(unsigned int *)(a1 + 280);
  if ((int)v33 < 1)
  {
    v43 = 0;
    if (!v9)
      return v43;
    goto LABEL_33;
  }
  v34 = 0.0;
  v35 = fmax(*v28 + -700.0, 0.0);
  v36 = *(_QWORD *)(a1 + 432);
  v37 = (double *)a2[7];
  v38 = *a3;
  v39 = v33;
  v40 = v9;
  do
  {
    v41 = exp(*v40 - v35);
    if (v36)
      v41 = v41 * *v37;
    *v38++ = v41;
    v34 = v34 + v41;
    ++v40;
    ++v37;
    --v39;
  }
  while (v39);
  v42 = 0;
  LODWORD(v43) = 0;
  v44 = *a3;
  do
  {
    v45 = v44[v42] / v34;
    v44[v42] = v45;
    if (v45 <= v44[(int)v43])
      v43 = v43;
    else
      v43 = v42;
    ++v42;
  }
  while (v33 != v42);
  if (v9)
  {
LABEL_33:
    v49 = v9;
    operator delete(v9);
  }
  return v43;
}

uint64_t ME_Model::make_feature_bag(ME_Model *this, int a2)
{
  uint64_t i;
  _DWORD *j;
  _QWORD *v6;
  _DWORD *k;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  unint64_t v13;
  int v14;
  _DWORD *m;
  int v16;
  int v18;
  int v19;
  _OWORD v20[2];
  int v21;
  int *v22;

  memset(v20, 0, sizeof(v20));
  v21 = 1065353216;
  if (a2 <= 0)
  {
    i = *((_QWORD *)this + 7);
  }
  else
  {
    for (i = *((_QWORD *)this + 6); i != *((_QWORD *)this + 7); i += 80)
    {
      for (j = *(_DWORD **)(i + 8); j != *(_DWORD **)(i + 16); ++j)
      {
        v19 = *(_DWORD *)i + (*j << 8);
        v22 = &v19;
        v6 = std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t)v20, (unsigned int *)&v19, (uint64_t)&std::piecewise_construct, &v22);
        ++*((_DWORD *)v6 + 5);
      }
      for (k = *(_DWORD **)(i + 32); k != *(_DWORD **)(i + 40); k += 4)
      {
        v19 = *(_DWORD *)i + (*k << 8);
        v22 = &v19;
        v8 = std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t)v20, (unsigned int *)&v19, (uint64_t)&std::piecewise_construct, &v22);
        ++*((_DWORD *)v8 + 5);
      }
    }
  }
  v9 = *((_QWORD *)this + 6);
  if (v9 == i)
  {
    v10 = 0;
  }
  else
  {
    LODWORD(v10) = 0;
    do
    {
      v12 = *(char **)(v9 + 8);
      v11 = *(char **)(v9 + 16);
      v13 = (unint64_t)(v11 - v12) >> 2;
      if ((int)v10 <= (int)v13)
        v10 = v13;
      else
        v10 = v10;
      if (v11 != v12)
      {
        do
        {
          v14 = *(_DWORD *)v9 + (*(_DWORD *)v12 << 8);
          v19 = v14;
          if (a2 < 1
            || (v18 = v14,
                v22 = &v18,
                *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t)v20, (unsigned int *)&v18, (uint64_t)&std::piecewise_construct, &v22)+ 5) > a2))
          {
            ME_Model::ME_FeatureBag::Put((_QWORD *)this + 27, &v19);
          }
          v12 += 4;
        }
        while (v12 != *(char **)(v9 + 16));
      }
      for (m = *(_DWORD **)(v9 + 32); m != *(_DWORD **)(v9 + 40); m += 4)
      {
        v16 = *(_DWORD *)v9 + (*m << 8);
        v19 = v16;
        if (a2 >= 1)
        {
          v18 = v16;
          v22 = &v18;
          if (*((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t)v20, (unsigned int *)&v18, (uint64_t)&std::piecewise_construct, &v22)+ 5) <= a2)continue;
        }
        ME_Model::ME_FeatureBag::Put((_QWORD *)this + 27, &v19);
      }
      v9 += 80;
    }
    while (v9 != *((_QWORD *)this + 7));
  }
  std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::clear(v20);
  ME_Model::init_feature2mef(this);
  std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::~__hash_table((uint64_t)v20);
  return v10;
}

void sub_1A36ACAF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::~__hash_table((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t ME_Model::ME_FeatureBag::Put(_QWORD *a1, _DWORD *a2)
{
  uint64_t *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  unint64_t v8;
  _DWORD *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  char *v15;
  int v16;
  unsigned int v18;
  unsigned int *v19;

  LODWORD(v19) = *a2;
  v4 = std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::find<unsigned int>(a1, (unsigned int *)&v19);
  if (v4)
    return *((unsigned int *)v4 + 5);
  v6 = (char *)a1[5];
  v7 = (char *)a1[6];
  v5 = (v7 - v6) >> 2;
  v8 = a1[7];
  if ((unint64_t)v7 >= v8)
  {
    if ((unint64_t)(v5 + 1) >> 62)
      std::vector<double>::__throw_length_error[abi:ne180100]();
    v10 = v8 - (_QWORD)v6;
    v11 = (uint64_t)(v8 - (_QWORD)v6) >> 1;
    if (v11 <= v5 + 1)
      v11 = v5 + 1;
    if (v10 >= 0x7FFFFFFFFFFFFFFCLL)
      v12 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v12 = v11;
    if (v12)
    {
      v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ME_Model::ME_Feature>>((uint64_t)(a1 + 7), v12);
      v6 = (char *)a1[5];
      v7 = (char *)a1[6];
    }
    else
    {
      v13 = 0;
    }
    v14 = &v13[4 * v5];
    v15 = &v13[4 * v12];
    *(_DWORD *)v14 = *a2;
    v9 = v14 + 4;
    while (v7 != v6)
    {
      v16 = *((_DWORD *)v7 - 1);
      v7 -= 4;
      *((_DWORD *)v14 - 1) = v16;
      v14 -= 4;
    }
    a1[5] = v14;
    a1[6] = v9;
    a1[7] = v15;
    if (v6)
      operator delete(v6);
  }
  else
  {
    *(_DWORD *)v7 = *a2;
    v9 = v7 + 4;
  }
  a1[6] = v9;
  v18 = *a2;
  v19 = &v18;
  *((_DWORD *)std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>((uint64_t)a1, &v18, (uint64_t)&std::piecewise_construct, &v19)+ 5) = v5;
  return v5;
}

void ME_Model::init_feature2mef(ME_Model *this)
{
  int v2;
  int v3;
  uint64_t *v4;
  int v5;
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  int v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  void *__p;
  char *v20;
  char *v21;
  unsigned int v22;

  v18 = (uint64_t *)((char *)this + 336);
  std::vector<std::vector<int>>::__clear[abi:ne180100]((uint64_t *)this + 42);
  if (*((int *)this + 36) >= 1)
  {
    v2 = 0;
    do
    {
      __p = 0;
      v20 = 0;
      v21 = 0;
      if (*((int *)this + 70) >= 1)
      {
        v3 = 0;
        do
        {
          v22 = v3 + (v2 << 8);
          v4 = std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::find<unsigned int>((_QWORD *)this + 27, &v22);
          if (v4)
          {
            v5 = *((_DWORD *)v4 + 5);
            if ((v5 & 0x80000000) == 0)
            {
              v6 = v20;
              if (v20 >= v21)
              {
                v8 = (char *)__p;
                v9 = (v20 - (_BYTE *)__p) >> 2;
                v10 = v9 + 1;
                if ((unint64_t)(v9 + 1) >> 62)
                  std::vector<double>::__throw_length_error[abi:ne180100]();
                v11 = v21 - (_BYTE *)__p;
                if ((v21 - (_BYTE *)__p) >> 1 > v10)
                  v10 = v11 >> 1;
                if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFFCLL)
                  v12 = 0x3FFFFFFFFFFFFFFFLL;
                else
                  v12 = v10;
                if (v12)
                {
                  v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ME_Model::ME_Feature>>((uint64_t)&v21, v12);
                  v8 = (char *)__p;
                  v6 = v20;
                }
                else
                {
                  v13 = 0;
                }
                v14 = &v13[4 * v9];
                *(_DWORD *)v14 = v5;
                v7 = v14 + 4;
                while (v6 != v8)
                {
                  v15 = *((_DWORD *)v6 - 1);
                  v6 -= 4;
                  *((_DWORD *)v14 - 1) = v15;
                  v14 -= 4;
                }
                __p = v14;
                v20 = v7;
                v21 = &v13[4 * v12];
                if (v8)
                  operator delete(v8);
              }
              else
              {
                *(_DWORD *)v20 = v5;
                v7 = v6 + 4;
              }
              v20 = v7;
            }
          }
          ++v3;
        }
        while (v3 < *((_DWORD *)this + 70));
      }
      v16 = *((_QWORD *)this + 43);
      if (v16 >= *((_QWORD *)this + 44))
      {
        v17 = std::vector<std::vector<int>>::__push_back_slow_path<std::vector<int> const&>(v18, (uint64_t)&__p);
      }
      else
      {
        std::vector<std::vector<int>>::__construct_one_at_end[abi:ne180100]<std::vector<int> const&>((uint64_t)v18, (uint64_t)&__p);
        v17 = v16 + 24;
      }
      *((_QWORD *)this + 43) = v17;
      if (__p)
      {
        v20 = (char *)__p;
        operator delete(__p);
      }
      ++v2;
    }
    while (v2 < *((_DWORD *)this + 36));
  }
}

void sub_1A36ACE18(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

double ME_Model::heldout_likelihood(ME_Model *this)
{
  uint64_t v2;
  int v3;
  double v4;
  _QWORD *v5;
  int v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  _QWORD v12[3];

  v2 = *((_QWORD *)this + 45);
  if (v2 == *((_QWORD *)this + 46))
  {
    v9 = 0.0;
    v4 = 0.0;
    v5 = (_QWORD *)*((_QWORD *)this + 45);
  }
  else
  {
    v3 = 0;
    v4 = 0.0;
    v5 = (_QWORD *)*((_QWORD *)this + 45);
    do
    {
      std::vector<double>::vector(v12, *((int *)this + 70));
      v6 = ME_Model::classify((uint64_t)this, v5, (uint64_t)v12);
      v7 = *(int *)v5;
      v5 += 10;
      v8 = (void *)v12[0];
      v4 = v4 + log(*(long double *)(v12[0] + 8 * v7));
      if (v6 == (_DWORD)v7)
        ++v3;
      v12[1] = v8;
      operator delete(v8);
    }
    while (v5 != *((_QWORD **)this + 46));
    v2 = *((_QWORD *)this + 45);
    v9 = (double)v3;
  }
  v10 = (double)(0xCCCCCCCCCCCCCCCDLL * (((uint64_t)v5 - v2) >> 4));
  *((double *)this + 49) = 1.0 - v9 / v10;
  return v4 / v10;
}

void sub_1A36ACF2C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t ME_Model::classify(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  double v8;
  double v9;

  ME_Model::conditional_probability(a1, a2, (double **)a3);
  v4 = *(_QWORD *)(a3 + 8) - *(_QWORD *)a3;
  if ((int)(v4 >> 3) < 1)
    return 0;
  v5 = 0;
  LODWORD(result) = 0;
  v7 = (v4 >> 3);
  v8 = 0.0;
  do
  {
    v9 = *(double *)(*(_QWORD *)a3 + 8 * v5);
    if (v9 <= v8)
      result = result;
    else
      result = v5;
    if (v9 > v8)
      v8 = *(double *)(*(_QWORD *)a3 + 8 * v5);
    ++v5;
  }
  while (v7 != v5);
  return result;
}

void std::vector<double>::resize(uint64_t a1, unint64_t a2)
{
  unint64_t v2;

  v2 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3;
  if (a2 <= v2)
  {
    if (a2 < v2)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 8 * a2;
  }
  else
  {
    std::vector<double>::__append((char **)a1, a2 - v2);
  }
}

uint64_t ME_Model::train(ME_Model *this, const ME_Sample **a2, uint64_t a3)
{
  _QWORD *i;
  _QWORD *v7;
  const ME_Sample *j;

  v7 = (_QWORD *)*((_QWORD *)this + 6);
  for (i = (_QWORD *)*((_QWORD *)this + 7); i != v7; std::__destroy_at[abi:ne180100]<ME_Model::Sample,0>(i))
    i -= 10;
  *((_QWORD *)this + 7) = v7;
  for (j = *a2; j != a2[1]; j = (const ME_Sample *)((char *)j + 72))
    ME_Model::add_training_sample(this, j);
  ME_Model::train(this, a3);
  return 0;
}

void ME_Model::add_training_sample(ME_Model *this, const ME_Sample *a2)
{
  uint64_t *i;
  int v5;
  int v6;
  char *v7;
  void *v8;
  char *v9;
  int64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  int v16;
  uint64_t *j;
  int v18;
  int v19;
  uint64_t v20;
  _QWORD *v21;
  char *v22;
  _QWORD *v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  unint64_t v27;
  char *v28;
  char *v29;
  char *v30;
  unint64_t v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  std::string v35;
  std::string v36;
  std::string v37;
  int v38;
  void *__p[2];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;

  v43 = 0;
  v42 = 0u;
  v41 = 0u;
  v40 = 0u;
  *(_OWORD *)__p = 0u;
  v38 = ME_Model::StringBag::Put((_QWORD *)this + 9, (uint64_t *)a2);
  if (v38 >= 256)
    exit(1);
  for (i = (uint64_t *)*((_QWORD *)a2 + 3); i != *((uint64_t **)a2 + 4); i += 3)
  {
    v5 = ME_Model::MiniStringBag::Put((unsigned int *)this + 36, i);
    v6 = v5;
    v7 = (char *)__p[1];
    if (__p[1] >= (void *)v40)
    {
      v9 = (char *)__p[0];
      v10 = ((char *)__p[1] - (char *)__p[0]) >> 2;
      v11 = v10 + 1;
      if ((unint64_t)(v10 + 1) >> 62)
        std::vector<double>::__throw_length_error[abi:ne180100]();
      v12 = v40 - (unint64_t)__p[0];
      if ((uint64_t)(v40 - (unint64_t)__p[0]) >> 1 > v11)
        v11 = v12 >> 1;
      if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL)
        v13 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v13 = v11;
      if (v13)
      {
        v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ME_Model::ME_Feature>>((uint64_t)&v40, v13);
        v9 = (char *)__p[0];
        v7 = (char *)__p[1];
      }
      else
      {
        v14 = 0;
      }
      v15 = &v14[4 * v10];
      *(_DWORD *)v15 = v6;
      v8 = v15 + 4;
      while (v7 != v9)
      {
        v16 = *((_DWORD *)v7 - 1);
        v7 -= 4;
        *((_DWORD *)v15 - 1) = v16;
        v15 -= 4;
      }
      __p[0] = v15;
      __p[1] = v8;
      *(_QWORD *)&v40 = &v14[4 * v13];
      if (v9)
        operator delete(v9);
    }
    else
    {
      *(_DWORD *)__p[1] = v5;
      v8 = v7 + 4;
    }
    __p[1] = v8;
  }
  for (j = (uint64_t *)*((_QWORD *)a2 + 6); j != *((uint64_t **)a2 + 7); j += 4)
  {
    v18 = ME_Model::MiniStringBag::Put((unsigned int *)this + 36, j);
    v19 = v18;
    v20 = j[3];
    v21 = (_QWORD *)v41;
    if ((unint64_t)v41 >= *((_QWORD *)&v41 + 1))
    {
      v23 = (_QWORD *)*((_QWORD *)&v40 + 1);
      v24 = (uint64_t)(v41 - *((_QWORD *)&v40 + 1)) >> 4;
      v25 = v24 + 1;
      if ((unint64_t)(v24 + 1) >> 60)
        std::vector<double>::__throw_length_error[abi:ne180100]();
      v26 = *((_QWORD *)&v41 + 1) - *((_QWORD *)&v40 + 1);
      if ((uint64_t)(*((_QWORD *)&v41 + 1) - *((_QWORD *)&v40 + 1)) >> 3 > v25)
        v25 = v26 >> 3;
      if ((unint64_t)v26 >= 0x7FFFFFFFFFFFFFF0)
        v27 = 0xFFFFFFFFFFFFFFFLL;
      else
        v27 = v25;
      if (v27)
      {
        v28 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<int,double>>>((uint64_t)&v41 + 8, v27);
        v23 = (_QWORD *)*((_QWORD *)&v40 + 1);
        v21 = (_QWORD *)v41;
      }
      else
      {
        v28 = 0;
      }
      v29 = &v28[16 * v24];
      *(_DWORD *)v29 = v19;
      *((_QWORD *)v29 + 1) = v20;
      v30 = v29;
      if (v21 != v23)
      {
        do
        {
          *((_OWORD *)v30 - 1) = *((_OWORD *)v21 - 1);
          v30 -= 16;
          v21 -= 2;
        }
        while (v21 != v23);
        v23 = (_QWORD *)*((_QWORD *)&v40 + 1);
      }
      v22 = v29 + 16;
      *((_QWORD *)&v40 + 1) = v30;
      *(_QWORD *)&v41 = v29 + 16;
      *((_QWORD *)&v41 + 1) = &v28[16 * v27];
      if (v23)
        operator delete(v23);
    }
    else
    {
      *(_DWORD *)v41 = v18;
      v21[1] = v20;
      v22 = (char *)(v21 + 2);
    }
    *(_QWORD *)&v41 = v22;
  }
  if (*((_QWORD *)this + 54))
  {
    if (*((char *)a2 + 23) < 0)
      std::string::__init_copy_ctor_external(&v35, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
    else
      v35 = *(std::string *)a2;
    memset(&v36, 0, sizeof(v36));
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v36, *((__int128 **)a2 + 3), *((__int128 **)a2 + 4), 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a2 + 4) - *((_QWORD *)a2 + 3)) >> 3));
    memset(&v37, 0, sizeof(v37));
    std::vector<std::pair<std::string,double>>::__init_with_size[abi:ne180100]<std::pair<std::string,double>*,std::pair<std::string,double>*>(&v37, *((__int128 **)a2 + 6), *((__int128 **)a2 + 7), (uint64_t)(*((_QWORD *)a2 + 7) - *((_QWORD *)a2 + 6)) >> 5);
    ME_Model::classify(*((ME_Model **)this + 54), (ME_Sample *)&v35, &v33);
    if ((_QWORD)v42)
    {
      *((_QWORD *)&v42 + 1) = v42;
      operator delete((void *)v42);
    }
    v42 = v33;
    v43 = v34;
    *(_QWORD *)&v33 = &v37;
    std::vector<std::pair<std::string,double>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v33);
    *(_QWORD *)&v33 = &v36;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v33);
    if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v35.__r_.__value_.__l.__data_);
  }
  v31 = *((_QWORD *)this + 7);
  if (v31 >= *((_QWORD *)this + 8))
  {
    v32 = std::vector<ME_Model::Sample>::__push_back_slow_path<ME_Model::Sample const&>((uint64_t *)this + 6, (uint64_t)&v38);
  }
  else
  {
    std::construct_at[abi:ne180100]<ME_Model::Sample,ME_Model::Sample const&,ME_Model::Sample*>(*((_QWORD *)this + 7), (uint64_t)&v38);
    v32 = v31 + 80;
    *((_QWORD *)this + 7) = v31 + 80;
  }
  *((_QWORD *)this + 7) = v32;
  if ((_QWORD)v42)
  {
    *((_QWORD *)&v42 + 1) = v42;
    operator delete((void *)v42);
  }
  if (*((_QWORD *)&v40 + 1))
  {
    *(_QWORD *)&v41 = *((_QWORD *)&v40 + 1);
    operator delete(*((void **)&v40 + 1));
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

void sub_1A36AD434(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *__p, uint64_t a16, int a17, __int16 a18, char a19, char a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  ME_Model::Sample::~Sample((ME_Model::Sample *)&a28);
  _Unwind_Resume(a1);
}

uint64_t ME_Model::train(ME_Model *this, uint64_t a2)
{
  ME_Model::Sample *v4;
  ME_Model::Sample *v5;
  int v6;
  ME_Model::Sample *v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 *v13;
  __int128 v14;
  int v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  std::vector<int> *v19;
  unint64_t v20;
  uint64_t v21;
  void **v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  int *v28;
  int *v29;
  int *v30;
  uint64_t v31;
  int **v32;
  int *v33;
  int *v34;
  int v35;
  uint64_t v36;
  uint64_t v37;
  double *v38;
  int *v39;
  uint64_t v40;
  int **v41;
  int *v42;
  int *v43;
  int v44;
  uint64_t v45;
  double v46;
  double *v47;
  uint64_t v48;
  unint64_t v49;
  std::string __p;

  if (*((double *)this + 4) <= 0.0 || *((double *)this + 5) <= 0.0)
  {
    v4 = (ME_Model::Sample *)*((_QWORD *)this + 6);
    v5 = (ME_Model::Sample *)*((_QWORD *)this + 7);
    if (v5 != v4 && *((_DWORD *)this + 100) < (signed int)(-858993459 * ((unint64_t)(v5 - v4) >> 4)))
    {
      v6 = 0;
      v7 = (ME_Model::Sample *)*((_QWORD *)this + 6);
      do
      {
        v9 = *(_DWORD *)v7;
        v7 = (ME_Model::Sample *)((char *)v7 + 80);
        v8 = v9;
        if (v6 <= v9)
          v6 = v8;
      }
      while (v7 != v5);
      *((_DWORD *)this + 70) = v6 + 1;
      v10 = *((_QWORD *)this + 54);
      if (v10)
      {
        if (*(int *)(v10 + 280) >= 1)
        {
          v11 = 0;
          v12 = 0;
          do
          {
            v13 = (__int128 *)(*(_QWORD *)(v10 + 120) + v11);
            if (*((char *)v13 + 23) < 0)
            {
              std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v13, *((_QWORD *)v13 + 1));
            }
            else
            {
              v14 = *v13;
              __p.__r_.__value_.__r.__words[2] = *((_QWORD *)v13 + 2);
              *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v14;
            }
            ME_Model::StringBag::Put((_QWORD *)this + 9, (uint64_t *)&__p);
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
              operator delete(__p.__r_.__value_.__l.__data_);
            ++v12;
            v10 = *((_QWORD *)this + 54);
            v11 += 24;
          }
          while (v12 < *(int *)(v10 + 280));
          v4 = (ME_Model::Sample *)*((_QWORD *)this + 6);
          v5 = (ME_Model::Sample *)*((_QWORD *)this + 7);
        }
        *((_DWORD *)this + 70) = -1431655765 * ((*((_QWORD *)this + 16) - *((_QWORD *)this + 15)) >> 3);
        if (v4 != v5)
        {
          v5 = v4;
          do
          {
            ME_Model::set_ref_dist(this, v5);
            v5 = (ME_Model::Sample *)((char *)v5 + 80);
          }
          while (v5 != *((ME_Model::Sample **)this + 7));
        }
      }
      if (*((int *)this + 100) >= 1)
      {
        v15 = 0;
        do
        {
          v16 = (uint64_t)v5 - 80;
          v17 = *((_QWORD *)this + 46);
          if (v17 >= *((_QWORD *)this + 47))
          {
            v18 = std::vector<ME_Model::Sample>::__push_back_slow_path<ME_Model::Sample const&>((uint64_t *)this + 45, v16);
          }
          else
          {
            std::construct_at[abi:ne180100]<ME_Model::Sample,ME_Model::Sample const&,ME_Model::Sample*>(*((_QWORD *)this + 46), v16);
            v18 = v17 + 80;
            *((_QWORD *)this + 46) = v17 + 80;
          }
          *((_QWORD *)this + 46) = v18;
          v5 = (ME_Model::Sample *)(*((_QWORD *)this + 7) - 80);
          std::__destroy_at[abi:ne180100]<ME_Model::Sample,0>(v5);
          *((_QWORD *)this + 7) = v5;
          ++v15;
        }
        while (v15 < *((_DWORD *)this + 100));
      }
      v19 = (std::vector<int> *)*((_QWORD *)this + 6);
      v20 = 126 - 2 * __clz(0xCCCCCCCCCCCCCCCDLL * ((v5 - (ME_Model::Sample *)v19) >> 4));
      if (v5 == (ME_Model::Sample *)v19)
        v21 = 0;
      else
        v21 = v20;
      std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *,false>(v19, (int *)v5, (uint64_t)&__p, v21, 1);
      *((float64x2_t *)this + 2) = vdivq_f64(*((float64x2_t *)this + 2), (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)(0xCCCCCCCCCCCCCCCDLL* ((uint64_t)(*((_QWORD *)this + 7)- *((_QWORD *)this + 6)) >> 4))), 0));
      ME_Model::make_feature_bag(this, 0);
      v22 = (void **)((char *)this + 288);
      std::vector<double>::resize((uint64_t)this + 288, (int)((uint64_t)(*((_QWORD *)this + 33) - *((_QWORD *)this + 32)) >> 2));
      v23 = *((_QWORD *)this + 32);
      v24 = *((_QWORD *)this + 33) - v23;
      if ((int)(v24 >> 2) >= 1)
        bzero(*v22, (2 * v24) & 0x7FFFFFFF8);
      v25 = *((_QWORD *)this + 6);
      v26 = 0xCCCCCCCCCCCCCCCDLL * ((*((_QWORD *)this + 7) - v25) >> 4);
      if ((int)v26 >= 1)
      {
        v27 = 0;
        do
        {
          v28 = (int *)(v25 + 80 * v27);
          v29 = (int *)*((_QWORD *)v28 + 1);
          v30 = (int *)*((_QWORD *)v28 + 2);
          if (v29 != v30)
          {
            v31 = *((_QWORD *)this + 42);
            do
            {
              v32 = (int **)(v31 + 24 * *v29);
              v33 = *v32;
              v34 = v32[1];
              if (v33 != v34)
              {
                v35 = *v28;
                do
                {
                  v36 = *v33;
                  if (*(unsigned __int8 *)(v23 + 4 * v36) == v35)
                    *((double *)*v22 + v36) = *((double *)*v22 + v36) + 1.0;
                  ++v33;
                }
                while (v33 != v34);
              }
              ++v29;
            }
            while (v29 != v30);
          }
          v37 = v25 + 80 * v27;
          v38 = *(double **)(v37 + 32);
          v39 = *(int **)(v37 + 40);
          if (v38 != (double *)v39)
          {
            v40 = *((_QWORD *)this + 42);
            do
            {
              v41 = (int **)(v40 + 24 * *(int *)v38);
              v42 = *v41;
              v43 = v41[1];
              if (v42 != v43)
              {
                v44 = *v28;
                do
                {
                  v45 = *v42;
                  if (*(unsigned __int8 *)(v23 + 4 * v45) == v44)
                    *((double *)*v22 + v45) = v38[1] + *((double *)*v22 + v45);
                  ++v42;
                }
                while (v42 != v43);
              }
              v38 += 2;
            }
            while (v38 != (double *)v39);
          }
          ++v27;
        }
        while (v27 != v26);
      }
      if ((int)(v24 >> 2) >= 1)
      {
        v46 = (double)v26;
        v47 = (double *)*v22;
        v48 = (v24 >> 2);
        do
        {
          *v47 = *v47 / v46;
          ++v47;
          --v48;
        }
        while (v48);
      }
      std::vector<double>::resize((uint64_t)this + 192, (int)((uint64_t)v24 >> 2));
      v49 = *((_QWORD *)this + 33) - *((_QWORD *)this + 32);
      if ((int)(v49 >> 2) >= 1)
        bzero(*((void **)this + 24), (2 * v49) & 0x7FFFFFFF8);
      if (*(_DWORD *)this == 2)
        ME_Model::perform_SGD(this);
      else
        ME_Model::perform_QUASI_NEWTON((uint64_t)this, a2);
    }
  }
  return 0;
}

void sub_1A36AD8B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  uint64_t v14;
  uint64_t v15;

  *(_QWORD *)(v14 + 368) = v15;
  _Unwind_Resume(exception_object);
}

uint64_t ME_Model::StringBag::Put(_QWORD *a1, uint64_t *a2)
{
  uint64_t v4;
  unsigned __int8 *v5;
  uint64_t v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t v9;
  __int128 *v11;

  v4 = (uint64_t)(a1 + 1);
  v5 = std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>(a1 + 1, a2);
  if (v5)
    return *((unsigned int *)v5 + 10);
  v8 = a1[7];
  v7 = a1 + 6;
  v6 = -1431655765 * ((v8 - a1[6]) >> 3);
  if (v8 >= a1[8])
  {
    v9 = std::vector<std::string>::__push_back_slow_path<std::string const&>(v7, (__int128 *)a2);
  }
  else
  {
    std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>((uint64_t)v7, (__int128 *)a2);
    v9 = v8 + 24;
  }
  a1[7] = v9;
  v11 = (__int128 *)a2;
  *((_DWORD *)std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4, a2, (uint64_t)&std::piecewise_construct, &v11)+ 10) = v6;
  return v6;
}

uint64_t ME_Model::MiniStringBag::Put(unsigned int *a1, uint64_t *a2)
{
  uint64_t v4;
  unsigned __int8 *v5;
  uint64_t v6;
  __int128 *v8;

  v4 = (uint64_t)(a1 + 2);
  v5 = std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>((_QWORD *)a1 + 1, a2);
  if (v5)
    return *((unsigned int *)v5 + 10);
  v6 = *a1;
  *a1 = v6 + 1;
  v8 = (__int128 *)a2;
  *((_DWORD *)std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(v4, a2, (uint64_t)&std::piecewise_construct, &v8)+ 10) = v6;
  return v6;
}

void ME_Model::classify(ME_Model *this@<X0>, ME_Sample *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t *i;
  unsigned __int8 *v7;
  int v8;
  char *v9;
  void *v10;
  char *v11;
  int64_t v12;
  unint64_t v13;
  int64_t v14;
  unint64_t v15;
  char *v16;
  char *v17;
  int v18;
  uint64_t *j;
  unsigned __int8 *v20;
  int v21;
  uint64_t v22;
  _QWORD *v23;
  char *v24;
  _QWORD *v25;
  uint64_t v26;
  unint64_t v27;
  int64_t v28;
  unint64_t v29;
  char *v30;
  char *v31;
  char *v32;
  ME_Model *v33;
  uint64_t v34;
  __int128 v35;
  std::string v36;
  uint64_t v37;
  void *__p[2];
  void *v39[2];
  _BYTE v40[40];

  memset(v40, 0, sizeof(v40));
  *(_OWORD *)v39 = 0u;
  *(_OWORD *)__p = 0u;
  for (i = (uint64_t *)*((_QWORD *)a2 + 3); i != *((uint64_t **)a2 + 4); i += 3)
  {
    v7 = std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>((_QWORD *)this + 19, i);
    if (v7)
    {
      v8 = *((_DWORD *)v7 + 10);
      if ((v8 & 0x80000000) == 0)
      {
        v9 = (char *)__p[1];
        if (__p[1] >= v39[0])
        {
          v11 = (char *)__p[0];
          v12 = ((char *)__p[1] - (char *)__p[0]) >> 2;
          v13 = v12 + 1;
          if ((unint64_t)(v12 + 1) >> 62)
            std::vector<double>::__throw_length_error[abi:ne180100]();
          v14 = (char *)v39[0] - (char *)__p[0];
          if (((char *)v39[0] - (char *)__p[0]) >> 1 > v13)
            v13 = v14 >> 1;
          if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFFCLL)
            v15 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v15 = v13;
          if (v15)
          {
            v16 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ME_Model::ME_Feature>>((uint64_t)v39, v15);
            v11 = (char *)__p[0];
            v9 = (char *)__p[1];
          }
          else
          {
            v16 = 0;
          }
          v17 = &v16[4 * v12];
          *(_DWORD *)v17 = v8;
          v10 = v17 + 4;
          while (v9 != v11)
          {
            v18 = *((_DWORD *)v9 - 1);
            v9 -= 4;
            *((_DWORD *)v17 - 1) = v18;
            v17 -= 4;
          }
          __p[0] = v17;
          __p[1] = v10;
          v39[0] = &v16[4 * v15];
          if (v11)
            operator delete(v11);
        }
        else
        {
          *(_DWORD *)__p[1] = v8;
          v10 = v9 + 4;
        }
        __p[1] = v10;
      }
    }
  }
  for (j = (uint64_t *)*((_QWORD *)a2 + 6); j != *((uint64_t **)a2 + 7); j += 4)
  {
    v20 = std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>((_QWORD *)this + 19, j);
    if (v20)
    {
      v21 = *((_DWORD *)v20 + 10);
      if ((v21 & 0x80000000) == 0)
      {
        v22 = j[3];
        v23 = *(_QWORD **)v40;
        if (*(_QWORD *)v40 >= *(_QWORD *)&v40[8])
        {
          v25 = v39[1];
          v26 = (uint64_t)(*(_QWORD *)v40 - (unint64_t)v39[1]) >> 4;
          v27 = v26 + 1;
          if ((unint64_t)(v26 + 1) >> 60)
            std::vector<double>::__throw_length_error[abi:ne180100]();
          v28 = *(_QWORD *)&v40[8] - (unint64_t)v39[1];
          if ((uint64_t)(*(_QWORD *)&v40[8] - (unint64_t)v39[1]) >> 3 > v27)
            v27 = v28 >> 3;
          if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF0)
            v29 = 0xFFFFFFFFFFFFFFFLL;
          else
            v29 = v27;
          if (v29)
          {
            v30 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<int,double>>>((uint64_t)&v40[8], v29);
            v25 = v39[1];
            v23 = *(_QWORD **)v40;
          }
          else
          {
            v30 = 0;
          }
          v31 = &v30[16 * v26];
          *(_DWORD *)v31 = v21;
          *((_QWORD *)v31 + 1) = v22;
          v32 = v31;
          if (v23 != v25)
          {
            do
            {
              *((_OWORD *)v32 - 1) = *((_OWORD *)v23 - 1);
              v32 -= 16;
              v23 -= 2;
            }
            while (v23 != v25);
            v25 = v39[1];
          }
          v24 = v31 + 16;
          v39[1] = v32;
          *(_QWORD *)v40 = v31 + 16;
          *(_QWORD *)&v40[8] = &v30[16 * v29];
          if (v25)
            operator delete(v25);
        }
        else
        {
          **(_DWORD **)v40 = v21;
          v23[1] = v22;
          v24 = (char *)(v23 + 2);
        }
        *(_QWORD *)v40 = v24;
      }
    }
  }
  v33 = (ME_Model *)*((_QWORD *)this + 54);
  if (v33)
  {
    ME_Model::classify((uint64_t *)&v36, v33, a2);
    if (*(_QWORD *)&v40[16])
    {
      *(_QWORD *)&v40[24] = *(_QWORD *)&v40[16];
      operator delete(*(void **)&v40[16]);
    }
    *(std::string *)&v40[16] = v36;
    ME_Model::set_ref_dist(this, (ME_Model::Sample *)&v37);
  }
  std::vector<double>::vector(a3, *((int *)this + 70));
  v34 = *((_QWORD *)this + 15) + 24 * (int)ME_Model::classify((uint64_t)this, &v37, (uint64_t)a3);
  if (*(char *)(v34 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&v36, *(const std::string::value_type **)v34, *(_QWORD *)(v34 + 8));
  }
  else
  {
    v35 = *(_OWORD *)v34;
    v36.__r_.__value_.__r.__words[2] = *(_QWORD *)(v34 + 16);
    *(_OWORD *)&v36.__r_.__value_.__l.__data_ = v35;
  }
  if (*((char *)a2 + 23) < 0)
    operator delete(*(void **)a2);
  *(std::string *)a2 = v36;
  if (*(_QWORD *)&v40[16])
  {
    *(_QWORD *)&v40[24] = *(_QWORD *)&v40[16];
    operator delete(*(void **)&v40[16]);
  }
  if (v39[1])
  {
    *(void **)v40 = v39[1];
    operator delete(v39[1]);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
}

void sub_1A36ADD6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  void *v9;
  va_list va;

  va_start(va, a7);
  v9 = *(void **)v7;
  if (*(_QWORD *)v7)
  {
    *(_QWORD *)(v7 + 8) = v9;
    operator delete(v9);
  }
  ME_Model::Sample::~Sample((ME_Model::Sample *)va);
  _Unwind_Resume(a1);
}

void ME_Sample::~ME_Sample(void **this)
{
  void **v2;

  v2 = this + 6;
  std::vector<std::pair<std::string,double>>::__destroy_vector::operator()[abi:ne180100](&v2);
  v2 = this + 3;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v2);
  if (*((char *)this + 23) < 0)
    operator delete(*this);
}

void ME_Model::Sample::~Sample(ME_Model::Sample *this)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)*((_QWORD *)this + 7);
  if (v2)
  {
    *((_QWORD *)this + 8) = v2;
    operator delete(v2);
  }
  v3 = (void *)*((_QWORD *)this + 4);
  if (v3)
  {
    *((_QWORD *)this + 5) = v3;
    operator delete(v3);
  }
  v4 = (void *)*((_QWORD *)this + 1);
  if (v4)
  {
    *((_QWORD *)this + 2) = v4;
    operator delete(v4);
  }
}

void ME_Model::set_ref_dist(ME_Model *this, ME_Model::Sample *a2)
{
  const void *v4;
  uint64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  __int128 v11;
  unsigned __int8 *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  std::string __p;
  void *v18;
  char *v19;
  void *v20;
  void *v21;
  uint64_t v22;

  v4 = (const void *)*((_QWORD *)a2 + 7);
  v5 = *((_QWORD *)a2 + 8);
  v6 = (char *)a2 + 56;
  v20 = 0;
  v21 = 0;
  v22 = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v20, v4, v5, (v5 - (uint64_t)v4) >> 3);
  std::vector<double>::vector(&v18, *((int *)this + 70));
  v7 = v19;
  if (v19 == v18)
  {
    v15 = (v19 - (_BYTE *)v18) >> 3;
    v14 = (uint64_t)v19;
  }
  else
  {
    v8 = 0;
    v9 = 1;
    v7 = (char *)v18;
    do
    {
      *(_QWORD *)&v7[8 * v8] = 0;
      v10 = *((_QWORD *)this + 15) + 24 * (int)(v9 - 1);
      if (*(char *)(v10 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v10, *(_QWORD *)(v10 + 8));
      }
      else
      {
        v11 = *(_OWORD *)v10;
        __p.__r_.__value_.__r.__words[2] = *(_QWORD *)(v10 + 16);
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v11;
      }
      v12 = std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>((_QWORD *)(*((_QWORD *)this + 54) + 80), (uint64_t *)&__p);
      if (v12)
      {
        v13 = *((int *)v12 + 10);
        v7 = (char *)v18;
        if ((_DWORD)v13 != -1)
          *((_QWORD *)v18 + v8) = *((_QWORD *)v20 + v13);
      }
      else
      {
        v7 = (char *)v18;
      }
      if (*(double *)&v7[8 * v8] == 0.0)
        *(_QWORD *)&v7[8 * v8] = 0x3F50624DD2F1A9FCLL;
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(__p.__r_.__value_.__l.__data_);
        v7 = (char *)v18;
      }
      v8 = v9;
      v14 = (uint64_t)v19;
      v15 = (v19 - v7) >> 3;
    }
    while (v15 > v9++);
  }
  if (v6 != (char *)&v18)
  {
    std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>(v6, v7, v14, v15);
    v7 = (char *)v18;
  }
  if (v7)
  {
    v19 = v7;
    operator delete(v7);
  }
  if (v20)
  {
    v21 = v20;
    operator delete(v20);
  }
}

void sub_1A36ADFDC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, void *__p, uint64_t a17, uint64_t a18, void *a19, uint64_t a20)
{
  if (__p)
    operator delete(__p);
  if (a19)
    operator delete(a19);
  _Unwind_Resume(exception_object);
}

void ME_Model::get_features(_QWORD *a1, uint64_t *a2)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 *v9;
  __int128 v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  std::string v17;
  __int128 __p;
  uint64_t v19;
  std::string v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  std::string v24;
  std::string v25;

  std::__list_imp<std::pair<std::pair<std::string,std::string>,double>>::clear(a2);
  v4 = (uint64_t *)a1[21];
  if (v4)
  {
    v5 = a1[15];
    v6 = a1[16];
    do
    {
      if ((int)(-1431655765 * ((unint64_t)(v6 - v5) >> 3)) >= 1)
      {
        v7 = 0;
        v8 = 0;
        do
        {
          v9 = (__int128 *)(v5 + v7);
          if (*((char *)v9 + 23) < 0)
          {
            std::string::__init_copy_ctor_external(&v25, *(const std::string::value_type **)v9, *((_QWORD *)v9 + 1));
          }
          else
          {
            v10 = *v9;
            v25.__r_.__value_.__r.__words[2] = *((_QWORD *)v9 + 2);
            *(_OWORD *)&v25.__r_.__value_.__l.__data_ = v10;
          }
          if (*((char *)v4 + 39) < 0)
            std::string::__init_copy_ctor_external(&v24, (const std::string::value_type *)v4[2], v4[3]);
          else
            v24 = *(std::string *)(v4 + 2);
          LODWORD(v20.__r_.__value_.__l.__data_) = v8 + (*((_DWORD *)v4 + 10) << 8);
          v11 = std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::find<unsigned int>(a1 + 27, (unsigned int *)&v20);
          if (v11)
          {
            v12 = *((unsigned int *)v11 + 5);
            if ((v12 & 0x80000000) == 0)
            {
              std::pair<std::string,std::string>::pair[abi:ne180100]<std::string&,std::string&,0>(&v17, (__int128 *)&v25, (__int128 *)&v24);
              v13 = a1[24];
              v20 = v17;
              memset(&v17, 0, sizeof(v17));
              v21 = __p;
              v22 = v19;
              __p = 0uLL;
              v19 = 0;
              v23 = *(_QWORD *)(v13 + 8 * v12);
              v14 = v23;
              v15 = (char *)operator new(0x48uLL);
              *(std::string *)(v15 + 16) = v20;
              memset(&v20, 0, sizeof(v20));
              *((_QWORD *)v15 + 7) = v22;
              *(_OWORD *)(v15 + 40) = v21;
              *((_QWORD *)v15 + 8) = v14;
              v16 = *a2;
              *(_QWORD *)v15 = *a2;
              *((_QWORD *)v15 + 1) = a2;
              *(_QWORD *)(v16 + 8) = v15;
              *a2 = (uint64_t)v15;
              ++a2[2];
              if (SHIBYTE(v19) < 0)
                operator delete((void *)__p);
              if (SHIBYTE(v17.__r_.__value_.__r.__words[2]) < 0)
                operator delete(v17.__r_.__value_.__l.__data_);
            }
          }
          if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v24.__r_.__value_.__l.__data_);
          if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v25.__r_.__value_.__l.__data_);
          ++v8;
          v5 = a1[15];
          v6 = a1[16];
          v7 += 24;
        }
        while (v8 < (int)(-1431655765 * ((unint64_t)(v6 - v5) >> 3)));
      }
      v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
}

void sub_1A36AE250(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *__p,uint64_t a24,int a25,__int16 a26,char a27,char a28)
{
  uint64_t v28;

  std::pair<std::pair<std::string,std::string>,double>::~pair((uint64_t)&a15);
  std::pair<std::pair<std::string,std::string>,double>::~pair((uint64_t)&a9);
  if (a28 < 0)
    operator delete(__p);
  if (*(char *)(v28 - 105) < 0)
    operator delete(*(void **)(v28 - 128));
  _Unwind_Resume(a1);
}

uint64_t std::pair<std::pair<std::string,std::string>,double>::~pair(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0)
    operator delete(*(void **)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
  return a1;
}

void ME_Model::clear(ME_Model *this)
{
  _QWORD *i;
  _QWORD *v3;
  _QWORD *j;
  _QWORD *v5;

  *((_QWORD *)this + 25) = *((_QWORD *)this + 24);
  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::clear((uint64_t)this + 80);
  std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)this + 15);
  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::clear((uint64_t)this + 152);
  *((_DWORD *)this + 36) = 0;
  std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::clear((_QWORD *)this + 27);
  *((_QWORD *)this + 33) = *((_QWORD *)this + 32);
  std::vector<std::vector<int>>::__clear[abi:ne180100]((uint64_t *)this + 42);
  *((_QWORD *)this + 37) = *((_QWORD *)this + 36);
  *((_QWORD *)this + 40) = *((_QWORD *)this + 39);
  v3 = (_QWORD *)*((_QWORD *)this + 6);
  for (i = (_QWORD *)*((_QWORD *)this + 7); i != v3; std::__destroy_at[abi:ne180100]<ME_Model::Sample,0>(i))
    i -= 10;
  *((_QWORD *)this + 7) = v3;
  v5 = (_QWORD *)*((_QWORD *)this + 45);
  for (j = (_QWORD *)*((_QWORD *)this + 46); j != v5; std::__destroy_at[abi:ne180100]<ME_Model::Sample,0>(j))
    j -= 10;
  *((_QWORD *)this + 46) = v5;
}

BOOL ME_Model::load_from_file(uint64_t a1, uint64_t a2)
{
  const char *v3;
  FILE *v4;
  void **v5;
  size_t size;
  std::string *p_str;
  _BYTE *v8;
  std::string::size_type v9;
  int v10;
  std::string *v11;
  int v12;
  double v13;
  unint64_t v14;
  double *v15;
  double *v16;
  double *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  double *v23;
  uint64_t v24;
  int v26;
  std::string v27;
  float v28;
  std::string v29;
  std::string v30;
  std::string __str;
  char __s[1024];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (*(char *)(a2 + 23) >= 0)
    v3 = (const char *)a2;
  else
    v3 = *(const char **)a2;
  v4 = fopen(v3, "r");
  if (v4)
  {
    v5 = (void **)(a1 + 192);
    *(_QWORD *)(a1 + 200) = *(_QWORD *)(a1 + 192);
    std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::clear(a1 + 80);
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)(a1 + 120));
    std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::clear(a1 + 152);
    *(_DWORD *)(a1 + 144) = 0;
    std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::clear((_QWORD *)(a1 + 216));
    *(_QWORD *)(a1 + 264) = *(_QWORD *)(a1 + 256);
    while (fgets(__s, 1024, v4))
    {
      std::string::basic_string[abi:ne180100]<0>(&__str, __s);
      if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(__str.__r_.__value_.__r.__words[2]);
      else
        size = __str.__r_.__value_.__l.__size_;
      if (size)
      {
        if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          p_str = &__str;
        else
          p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
        v8 = memchr(p_str, 9, size);
        if (v8)
          v9 = v8 - (_BYTE *)p_str;
        else
          v9 = -1;
        while (size)
        {
          v10 = *((unsigned __int8 *)&p_str[-1].__r_.__value_.__r.__words[2] + size-- + 7);
          if (v10 == 9)
            goto LABEL_21;
        }
      }
      else
      {
        v9 = -1;
      }
      size = -1;
LABEL_21:
      std::string::basic_string(&v30, &__str, 0, v9, (std::allocator<char> *)&v29);
      std::string::basic_string(&v29, &__str, v9 + 1, size - (v9 + 1), (std::allocator<char> *)&v27);
      v28 = 0.0;
      std::string::basic_string(&v27, &__str, size + 1, 0xFFFFFFFFFFFFFFFFLL, (std::allocator<char> *)&v26);
      if ((v27.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v11 = &v27;
      else
        v11 = (std::string *)v27.__r_.__value_.__r.__words[0];
      sscanf((const char *)v11, "%f", &v28);
      v12 = ME_Model::StringBag::Put((_QWORD *)(a1 + 72), (uint64_t *)&v30);
      v26 = v12 + (ME_Model::MiniStringBag::Put((unsigned int *)(a1 + 144), (uint64_t *)&v29) << 8);
      ME_Model::ME_FeatureBag::Put((_QWORD *)(a1 + 216), &v26);
      v13 = v28;
      v15 = *(double **)(a1 + 200);
      v14 = *(_QWORD *)(a1 + 208);
      if ((unint64_t)v15 >= v14)
      {
        v17 = (double *)*v5;
        v18 = ((char *)v15 - (_BYTE *)*v5) >> 3;
        v19 = v18 + 1;
        if ((unint64_t)(v18 + 1) >> 61)
          std::vector<double>::__throw_length_error[abi:ne180100]();
        v20 = v14 - (_QWORD)v17;
        if (v20 >> 2 > v19)
          v19 = v20 >> 2;
        if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF8)
          v21 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v21 = v19;
        if (v21)
        {
          v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(a1 + 208, v21);
          v17 = *(double **)(a1 + 192);
          v15 = *(double **)(a1 + 200);
        }
        else
        {
          v22 = 0;
        }
        v23 = (double *)&v22[8 * v18];
        *v23 = v13;
        v16 = v23 + 1;
        while (v15 != v17)
        {
          v24 = *((_QWORD *)v15-- - 1);
          *((_QWORD *)v23-- - 1) = v24;
        }
        *(_QWORD *)(a1 + 192) = v23;
        *(_QWORD *)(a1 + 200) = v16;
        *(_QWORD *)(a1 + 208) = &v22[8 * v21];
        if (v17)
          operator delete(v17);
      }
      else
      {
        *v15 = v13;
        v16 = v15 + 1;
      }
      *(_QWORD *)(a1 + 200) = v16;
      if (SHIBYTE(v27.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v27.__r_.__value_.__l.__data_);
      if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v29.__r_.__value_.__l.__data_);
      if (SHIBYTE(v30.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v30.__r_.__value_.__l.__data_);
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__str.__r_.__value_.__l.__data_);
    }
    *(_DWORD *)(a1 + 280) = -1431655765 * ((*(_QWORD *)(a1 + 128) - *(_QWORD *)(a1 + 120)) >> 3);
    ME_Model::init_feature2mef((ME_Model *)a1);
    fclose(v4);
  }
  return v4 != 0;
}

void sub_1A36AE6E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24,void *a25,uint64_t a26,int a27,__int16 a28,char a29,char a30,void *a31,uint64_t a32,int a33,__int16 a34,char a35,char a36)
{
  if (a17 < 0)
    operator delete(__p);
  if (a24 < 0)
    operator delete(a19);
  if (a30 < 0)
    operator delete(a25);
  if (a36 < 0)
    operator delete(a31);
  _Unwind_Resume(exception_object);
}

uint64_t ME_Model::load_from_array(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void **v5;
  _QWORD *v6;
  unsigned int *v7;
  _QWORD *v8;
  char **v9;
  unint64_t v10;
  void **v11;
  int v12;
  int v13;
  _BOOL4 v15;
  int v16;
  int v17;
  _QWORD *v18;
  unint64_t v19;
  char *v20;
  _QWORD *v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  char *v28;
  uint64_t v29;
  uint64_t v31;
  void *__p[2];
  unsigned __int8 v33;

  v4 = 0;
  v5 = (void **)(a1 + 192);
  *(_QWORD *)(a1 + 200) = *(_QWORD *)(a1 + 192);
  v6 = (_QWORD *)(a1 + 72);
  v7 = (unsigned int *)(a1 + 144);
  v8 = (_QWORD *)(a1 + 216);
  v31 = a1 + 208;
  while (1)
  {
    v9 = (char **)(a2 + 24 * v4);
    std::string::basic_string[abi:ne180100]<0>(__p, *v9);
    v10 = v33;
    if ((v33 & 0x80u) != 0)
      v10 = (unint64_t)__p[1];
    if (v10 != 3)
    {
      v15 = 0;
      if (((char)v33 & 0x80000000) == 0)
        goto LABEL_17;
LABEL_16:
      operator delete(__p[0]);
      goto LABEL_17;
    }
    v11 = (void **)__p[0];
    if ((v33 & 0x80u) == 0)
      v11 = __p;
    v12 = *(unsigned __int16 *)v11;
    v13 = *((unsigned __int8 *)v11 + 2);
    v15 = v12 == 12079 && v13 == 47;
    if ((char)v33 < 0)
      goto LABEL_16;
LABEL_17:
    if (v15)
      break;
    std::string::basic_string[abi:ne180100]<0>(__p, *v9);
    v16 = ME_Model::StringBag::Put(v6, (uint64_t *)__p);
    if ((char)v33 < 0)
      operator delete(__p[0]);
    std::string::basic_string[abi:ne180100]<0>(__p, *(char **)(a2 + 24 * v4 + 8));
    v17 = ME_Model::MiniStringBag::Put(v7, (uint64_t *)__p);
    if ((char)v33 < 0)
      operator delete(__p[0]);
    LODWORD(__p[0]) = v16 + (v17 << 8);
    ME_Model::ME_FeatureBag::Put(v8, __p);
    v18 = (_QWORD *)(a2 + 24 * v4 + 16);
    v20 = *(char **)(a1 + 200);
    v19 = *(_QWORD *)(a1 + 208);
    if ((unint64_t)v20 >= v19)
    {
      v22 = (char *)*v5;
      v23 = (v20 - (_BYTE *)*v5) >> 3;
      v24 = v23 + 1;
      if ((unint64_t)(v23 + 1) >> 61)
        std::vector<double>::__throw_length_error[abi:ne180100]();
      v25 = v19 - (_QWORD)v22;
      if (v25 >> 2 > v24)
        v24 = v25 >> 2;
      if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF8)
        v26 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v26 = v24;
      if (v26)
      {
        v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v31, v26);
        v22 = *(char **)(a1 + 192);
        v20 = *(char **)(a1 + 200);
      }
      else
      {
        v27 = 0;
      }
      v28 = &v27[8 * v23];
      *(_QWORD *)v28 = *v18;
      v21 = v28 + 8;
      while (v20 != v22)
      {
        v29 = *((_QWORD *)v20 - 1);
        v20 -= 8;
        *((_QWORD *)v28 - 1) = v29;
        v28 -= 8;
      }
      *(_QWORD *)(a1 + 192) = v28;
      *(_QWORD *)(a1 + 200) = v21;
      *(_QWORD *)(a1 + 208) = &v27[8 * v26];
      if (v22)
        operator delete(v22);
    }
    else
    {
      *(_QWORD *)v20 = *v18;
      v21 = v20 + 8;
    }
    *(_QWORD *)(a1 + 200) = v21;
    ++v4;
  }
  *(_DWORD *)(a1 + 280) = -1431655765 * ((*(_QWORD *)(a1 + 128) - *(_QWORD *)(a1 + 120)) >> 3);
  ME_Model::init_feature2mef((ME_Model *)a1);
  return 1;
}

void sub_1A36AE9A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL ME_Model::save_to_file(_QWORD *a1, uint64_t a2, double a3)
{
  const char *v5;
  FILE *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 *v12;
  __int128 v13;
  uint64_t *v14;
  uint64_t v15;
  double v16;
  double v17;
  std::string *v19;
  std::string *v20;
  std::string v22;
  std::string v23;
  unsigned int v24;

  if (*(char *)(a2 + 23) >= 0)
    v5 = (const char *)a2;
  else
    v5 = *(const char **)a2;
  v6 = fopen(v5, "w");
  if (v6)
  {
    v7 = (uint64_t *)a1[21];
    if (v7)
    {
      v8 = a1[15];
      v9 = a1[16];
      do
      {
        if ((int)(-1431655765 * ((unint64_t)(v9 - v8) >> 3)) >= 1)
        {
          v10 = 0;
          v11 = 0;
          do
          {
            v12 = (__int128 *)(v8 + v10);
            if (*((char *)v12 + 23) < 0)
            {
              std::string::__init_copy_ctor_external(&v23, *(const std::string::value_type **)v12, *((_QWORD *)v12 + 1));
            }
            else
            {
              v13 = *v12;
              v23.__r_.__value_.__r.__words[2] = *((_QWORD *)v12 + 2);
              *(_OWORD *)&v23.__r_.__value_.__l.__data_ = v13;
            }
            if (*((char *)v7 + 39) < 0)
              std::string::__init_copy_ctor_external(&v22, (const std::string::value_type *)v7[2], v7[3]);
            else
              v22 = *(std::string *)(v7 + 2);
            v24 = v11 + (*((_DWORD *)v7 + 10) << 8);
            v14 = std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::find<unsigned int>(a1 + 27, &v24);
            if (v14)
            {
              v15 = *((unsigned int *)v14 + 5);
              if ((v15 & 0x80000000) == 0)
              {
                v16 = *(double *)(a1[24] + 8 * v15);
                v17 = fabs(v16);
                if (v16 != 0.0 && v17 >= a3)
                {
                  v19 = &v23;
                  if ((v23.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
                    v19 = (std::string *)v23.__r_.__value_.__r.__words[0];
                  if ((v22.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
                    v20 = &v22;
                  else
                    v20 = (std::string *)v22.__r_.__value_.__r.__words[0];
                  fprintf(v6, "%s\t%s\t%f\n", (const char *)v19, (const char *)v20, v16);
                }
              }
            }
            if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v22.__r_.__value_.__l.__data_);
            if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0)
              operator delete(v23.__r_.__value_.__l.__data_);
            ++v11;
            v8 = a1[15];
            v9 = a1[16];
            v10 += 24;
          }
          while (v11 < (int)(-1431655765 * ((unint64_t)(v9 - v8) >> 3)));
        }
        v7 = (uint64_t *)*v7;
      }
      while (v7);
    }
    fclose(v6);
  }
  return v6 != 0;
}

void sub_1A36AEB9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, void *__p,uint64_t a21,int a22,__int16 a23,char a24,char a25)
{
  if (a25 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

char *std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>(char *result, char *__src, uint64_t a3, unint64_t a4)
{
  _QWORD *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  void **v12;
  char *v13;
  _BYTE *v14;
  unint64_t v15;
  char *v16;
  size_t v17;
  void *v18;
  char *v19;

  v7 = result;
  v8 = *((_QWORD *)result + 2);
  v9 = *(char **)result;
  if (a4 > (v8 - *(_QWORD *)result) >> 3)
  {
    if (v9)
    {
      *((_QWORD *)result + 1) = v9;
      operator delete(v9);
      v8 = 0;
      *v7 = 0;
      v7[1] = 0;
      v7[2] = 0;
    }
    if (a4 >> 61)
      std::vector<double>::__throw_length_error[abi:ne180100]();
    v10 = v8 >> 2;
    if (v8 >> 2 <= a4)
      v10 = a4;
    if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8)
      v11 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v11 = v10;
    result = std::vector<double>::__vallocate[abi:ne180100](v7, v11);
    v13 = (char *)v7[1];
    v12 = (void **)(v7 + 1);
    v9 = v13;
LABEL_16:
    v17 = a3 - (_QWORD)__src;
    if (v17)
    {
      v18 = v9;
      v19 = __src;
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  v12 = (void **)(result + 8);
  v14 = (_BYTE *)*((_QWORD *)result + 1);
  v15 = (v14 - v9) >> 3;
  if (v15 >= a4)
    goto LABEL_16;
  v16 = &__src[8 * v15];
  if (v14 != v9)
  {
    result = (char *)memmove(*(void **)result, __src, v14 - v9);
    v9 = (char *)*v12;
  }
  v17 = a3 - (_QWORD)v16;
  if (v17)
  {
    v18 = v9;
    v19 = v16;
LABEL_18:
    result = (char *)memmove(v18, v19, v17);
  }
LABEL_19:
  *v12 = &v9[v17];
  return result;
}

char *std::vector<double>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    std::vector<double>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void std::vector<double>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E4A39AC8, MEMORY[0x1E0DE42D0]);
}

void sub_1A36AEDAC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E0DE4E98], MEMORY[0x1E0DE4390]);
}

_QWORD *std::vector<double>::vector(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<double>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_1A36AEE64(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

__n128 std::vector<double>::__move_assign(uint64_t a1, __n128 *a2)
{
  void *v4;
  __n128 result;

  v4 = *(void **)a1;
  if (v4)
  {
    *(_QWORD *)(a1 + 8) = v4;
    operator delete(v4);
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
  }
  result = *a2;
  *(__n128 *)a1 = *a2;
  *(_QWORD *)(a1 + 16) = a2[1].n128_u64[0];
  a2->n128_u64[0] = 0;
  a2->n128_u64[1] = 0;
  a2[1].n128_u64[0] = 0;
  return result;
}

_QWORD *std::vector<double>::vector(_QWORD *a1, unint64_t a2, _QWORD *a3)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<double>::__vallocate[abi:ne180100](a1, a2);
    v6 = (_QWORD *)a1[1];
    v7 = &v6[a2];
    v8 = 8 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 8;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_1A36AEF34(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t *std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::find<unsigned int>(_QWORD *a1, unsigned int *a2)
{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  unint64_t v5;
  uint64_t **v6;
  uint64_t *result;
  unint64_t v8;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return 0;
  v3 = *a2;
  v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = *a2;
    if (*(_QWORD *)&v2 <= v3)
      v5 = v3 % *(_QWORD *)&v2;
  }
  else
  {
    v5 = (v2.i32[0] - 1) & v3;
  }
  v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6)
    return 0;
  for (result = *v6; result; result = (uint64_t *)*result)
  {
    v8 = result[1];
    if (v8 == v3)
    {
      if (*((_DWORD *)result + 4) == (_DWORD)v3)
        return result;
    }
    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(_QWORD *)&v2)
          v8 %= *(_QWORD *)&v2;
      }
      else
      {
        v8 &= *(_QWORD *)&v2 - 1;
      }
      if (v8 != v5)
        return 0;
    }
  }
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ME_Model::ME_Feature>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(4 * a2);
}

void std::__destroy_at[abi:ne180100]<ME_Model::Sample,0>(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)a1[7];
  if (v2)
  {
    a1[8] = v2;
    operator delete(v2);
  }
  v3 = (void *)a1[4];
  if (v3)
  {
    a1[5] = v3;
    operator delete(v3);
  }
  v4 = (void *)a1[1];
  if (v4)
  {
    a1[2] = v4;
    operator delete(v4);
  }
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::find<std::string>(_QWORD *a1, uint64_t *a2)
{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 **v10;
  unsigned __int8 *v11;
  uint64_t v12;
  unint64_t v13;

  v4 = ME_Model::hashfun_str::operator()((uint64_t)(a1 + 3), a2);
  v5 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v5)
    return 0;
  v6 = v4;
  v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    v9 = v4;
    if (v4 >= *(_QWORD *)&v5)
      v9 = v4 % *(_QWORD *)&v5;
  }
  else
  {
    v9 = (*(_QWORD *)&v5 - 1) & v4;
  }
  v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10)
    return 0;
  v11 = *v10;
  if (*v10)
  {
    v12 = (uint64_t)(a1 + 4);
    do
    {
      v13 = *((_QWORD *)v11 + 1);
      if (v13 == v6)
      {
        if ((std::equal_to<std::string>::operator()[abi:ne180100](v12, v11 + 16, (unsigned __int8 *)a2) & 1) != 0)
          return v11;
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(_QWORD *)&v5)
            v13 %= *(_QWORD *)&v5;
        }
        else
        {
          v13 &= *(_QWORD *)&v5 - 1;
        }
        if (v13 != v9)
          return 0;
      }
      v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 **v10;
  unsigned __int8 *v11;
  uint64_t v12;
  unint64_t v13;

  v4 = ME_Model::hashfun_str::operator()((uint64_t)(a1 + 3), a2);
  v5 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v5)
    return 0;
  v6 = v4;
  v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    v9 = v4;
    if (v4 >= *(_QWORD *)&v5)
      v9 = v4 % *(_QWORD *)&v5;
  }
  else
  {
    v9 = (*(_QWORD *)&v5 - 1) & v4;
  }
  v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10)
    return 0;
  v11 = *v10;
  if (*v10)
  {
    v12 = (uint64_t)(a1 + 4);
    do
    {
      v13 = *((_QWORD *)v11 + 1);
      if (v6 == v13)
      {
        if ((std::equal_to<std::string>::operator()[abi:ne180100](v12, v11 + 16, (unsigned __int8 *)a2) & 1) != 0)
          return v11;
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(_QWORD *)&v5)
            v13 %= *(_QWORD *)&v5;
        }
        else
        {
          v13 &= *(_QWORD *)&v5 - 1;
        }
        if (v13 != v9)
          return 0;
      }
      v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

uint64_t ME_Model::hashfun_str::operator()(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t result;
  uint64_t *v6;
  int v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t *v11;
  char *v12;
  int v13;

  LODWORD(v2) = *((unsigned __int8 *)a2 + 23);
  v3 = (char)v2;
  if ((v2 & 0x80u) != 0)
    v2 = a2[1];
  if ((int)v2 < 4)
  {
    result = 0;
  }
  else
  {
    v4 = 0;
    result = 0;
    if (v3 >= 0)
      v6 = a2;
    else
      v6 = (uint64_t *)*a2;
    v7 = (int)v2 / 4;
    do
    {
      result ^= (int)(*(_DWORD *)((char *)v6 + v4) << (v4 & 4));
      v4 += 4;
      --v7;
    }
    while (v7);
  }
  if ((v2 & 3) != 0)
  {
    v8 = 0;
    v9 = 4 * ((int)v2 / 4);
    v10 = v2 & 3;
    if (v3 >= 0)
      v11 = a2;
    else
      v11 = (uint64_t *)*a2;
    v12 = (char *)v11 + v9;
    do
    {
      v13 = *v12++;
      result ^= v13 << v8;
      v8 += 8;
    }
    while (8 * v10 != v8);
  }
  return result;
}

uint64_t std::equal_to<std::string>::operator()[abi:ne180100](uint64_t a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  unsigned __int8 *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  int v12;
  BOOL v14;
  uint64_t result;

  v3 = a3;
  v4 = a2[23];
  if ((v4 & 0x80u) == 0)
    v5 = a2[23];
  else
    v5 = *((_QWORD *)a2 + 1);
  v6 = a3[23];
  v7 = (char)v6;
  if ((v6 & 0x80u) != 0)
    v6 = *((_QWORD *)a3 + 1);
  if (v5 != v6)
    return 0;
  if (v7 < 0)
    v3 = *(unsigned __int8 **)a3;
  if ((v4 & 0x80) != 0)
    return memcmp(*(const void **)a2, v3, *((_QWORD *)a2 + 1)) == 0;
  if (!a2[23])
    return 1;
  v8 = v4 - 1;
  do
  {
    v10 = *a2++;
    v9 = v10;
    v12 = *v3++;
    v11 = v12;
    v14 = v8-- != 0;
    result = v9 == v11;
  }
  while (v9 == v11 && v14);
  return result;
}

void std::vector<std::string>::__construct_one_at_end[abi:ne180100]<std::string const&>(uint64_t a1, __int128 *a2)
{
  uint64_t v3;
  __int128 v4;

  v3 = *(_QWORD *)(a1 + 8);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(*(std::string **)(a1 + 8), *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    *(_QWORD *)(v3 + 16) = *((_QWORD *)a2 + 2);
    *(_OWORD *)v3 = v4;
  }
  *(_QWORD *)(a1 + 8) = v3 + 24;
}

void sub_1A36AF330(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::string>::__push_back_slow_path<std::string const&>(uint64_t *a1, __int128 *a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  std::string *v10;
  std::__split_buffer<std::string>::pointer end;
  __int128 v12;
  uint64_t v13;
  std::__split_buffer<std::string> __v;

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<double>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x555555555555555)
    v9 = 0xAAAAAAAAAAAAAAALL;
  else
    v9 = v5;
  __v.__end_cap_.__value_ = (std::allocator<std::string> *)(a1 + 2);
  if (v9)
    v10 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v7, v9);
  else
    v10 = 0;
  end = v10 + v4;
  __v.__first_ = v10;
  __v.__begin_ = end;
  __v.__end_ = end;
  __v.__end_cap_.__value_ = &v10[v9];
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(end, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
    end = __v.__end_;
  }
  else
  {
    v12 = *a2;
    end->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&end->__r_.__value_.__l.__data_ = v12;
  }
  __v.__end_ = end + 1;
  std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)a1, &__v);
  v13 = a1[1];
  std::__split_buffer<std::string>::~__split_buffer(&__v);
  return v13;
}

void sub_1A36AF444(_Unwind_Exception *a1, std::__split_buffer<std::string> *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::string> *)&a10);
  _Unwind_Resume(a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(24 * a2);
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::string>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>,std::reverse_iterator<std::string*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v9;
  __int128 v10;
  _QWORD v12[3];
  char v13;
  __int128 v14;
  __int128 v15;

  v7 = a7;
  *(_QWORD *)&v15 = a6;
  *((_QWORD *)&v15 + 1) = a7;
  v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 != a5)
  {
    v9 = a7;
    do
    {
      v10 = *(_OWORD *)(a3 - 24);
      *(_QWORD *)(v9 - 8) = *(_QWORD *)(a3 - 8);
      *(_OWORD *)(v9 - 24) = v10;
      v9 -= 24;
      *(_QWORD *)(a3 - 16) = 0;
      *(_QWORD *)(a3 - 8) = 0;
      *(_QWORD *)(a3 - 24) = 0;
      v7 -= 24;
      a3 -= 24;
    }
    while (a3 != a5);
    *((_QWORD *)&v15 + 1) = v9;
  }
  v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return a6;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::reverse_iterator<std::string*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0)
      operator delete(*(void **)v1);
    v1 += 24;
  }
}

void std::__split_buffer<std::string>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  void **v2;
  void **v5;

  v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      v5 = v2 - 3;
      *(_QWORD *)(a1 + 16) = v2 - 3;
      if (*((char *)v2 - 1) < 0)
      {
        operator delete(*v5);
        v5 = *(void ***)(a1 + 16);
      }
      v2 = v5;
    }
    while (v5 != a2);
  }
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1, uint64_t *a2, uint64_t a3, __int128 **a4)
{
  unint64_t v4;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint8x8_t v12;
  unint64_t v13;
  unsigned __int8 **v14;
  unsigned __int8 *i;
  unint64_t v16;
  float v17;
  float v18;
  _BOOL8 v19;
  unint64_t v20;
  unint64_t v21;
  size_t v22;
  _QWORD *v23;
  unint64_t v24;
  _QWORD v26[3];

  v8 = (_QWORD *)(a1 + 24);
  v9 = ME_Model::hashfun_str::operator()(a1 + 24, a2);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 8);
  if (v11)
  {
    v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      v4 = v9;
      if (v9 >= v11)
        v4 = v9 % v11;
    }
    else
    {
      v4 = (v11 - 1) & v9;
    }
    v14 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v4);
    if (v14)
    {
      for (i = *v14; i; i = *(unsigned __int8 **)i)
      {
        v16 = *((_QWORD *)i + 1);
        if (v16 == v10)
        {
          if ((std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, (unsigned __int8 *)a2) & 1) != 0)
            return i;
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11)
              v16 %= v11;
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, v10, a4, (uint64_t)v26);
  v17 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v18 = *(float *)(a1 + 32);
  if (!v11 || (float)(v18 * (float)v11) < v17)
  {
    v19 = 1;
    if (v11 >= 3)
      v19 = (v11 & (v11 - 1)) != 0;
    v20 = v19 | (2 * v11);
    v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21)
      v22 = v21;
    else
      v22 = v20;
    std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__rehash<true>(a1, v22);
    v11 = *(_QWORD *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
        v4 = v10 % v11;
      else
        v4 = v10;
    }
    else
    {
      v4 = (v11 - 1) & v10;
    }
  }
  v23 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v23)
  {
    *(_QWORD *)v26[0] = *v23;
    *v23 = v26[0];
  }
  else
  {
    *(_QWORD *)v26[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v26[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v26[0])
    {
      v24 = *(_QWORD *)(*(_QWORD *)v26[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v24 >= v11)
          v24 %= v11;
      }
      else
      {
        v24 &= v11 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v24) = v26[0];
    }
  }
  i = (unsigned __int8 *)v26[0];
  ++*v8;
  return i;
}

void sub_1A36AF874(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void **__p, uint64_t a13)
{
  if (__p)
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,int>,void *>>>::operator()[abi:ne180100]((uint64_t)&a13, __p);
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7;
  char *v8;
  std::string *v9;
  __int128 *v10;
  __int128 v11;

  v7 = a1 + 16;
  v8 = (char *)operator new(0x30uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = a2;
  v9 = (std::string *)(v8 + 16);
  v10 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)v10, *((_QWORD *)v10 + 1));
  }
  else
  {
    v11 = *v10;
    *((_QWORD *)v8 + 4) = *((_QWORD *)v10 + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v11;
  }
  *((_DWORD *)v8 + 10) = 0;
  *(_BYTE *)(a4 + 16) = 1;
}

void sub_1A36AF924(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void **v2;
  uint64_t v3;

  *v1 = 0;
  std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,int>,void *>>>::operator()[abi:ne180100](v3, v2);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__rehash<true>(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  unint64_t v5;
  uint8x8_t v6;
  uint64_t v7;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(_QWORD *)&v4)
    goto LABEL_16;
  if (prime < *(_QWORD *)&v4)
  {
    v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      v5 = std::__next_prime(v5);
    }
    else
    {
      v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2)
        v5 = v7;
    }
    if (prime <= v5)
      prime = v5;
    if (prime < *(_QWORD *)&v4)
LABEL_16:
      std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__do_rehash<true>(a1, prime);
  }
}

void std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint8x8_t v9;
  void *v10;
  _QWORD *v11;
  unint64_t v12;

  if (a2)
  {
    if (a2 >> 61)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v4 = operator new(8 * a2);
    v5 = *(void **)a1;
    *(_QWORD *)a1 = v4;
    if (v5)
      operator delete(v5);
    v6 = 0;
    *(_QWORD *)(a1 + 8) = a2;
    do
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    v7 = *(_QWORD **)(a1 + 16);
    if (v7)
    {
      v8 = v7[1];
      v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2)
          v8 %= a2;
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = a1 + 16;
      v11 = (_QWORD *)*v7;
      if (*v7)
      {
        do
        {
          v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2)
              v12 %= a2;
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v12))
            {
              *(_QWORD *)(*(_QWORD *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *v7 = *v11;
            *v11 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v12);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v12) = v11;
            v11 = v7;
          }
          v12 = v8;
LABEL_24:
          v7 = v11;
          v11 = (_QWORD *)*v11;
          v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    v10 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v10)
      operator delete(v10);
    *(_QWORD *)(a1 + 8) = 0;
  }
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,int>,void *>>>::operator()[abi:ne180100](uint64_t a1, void **__p)
{
  if (*(_BYTE *)(a1 + 8))
  {
    if (*((char *)__p + 39) < 0)
      operator delete(__p[2]);
  }
  else if (!__p)
  {
    return;
  }
  operator delete(__p);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<int,double>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(16 * a2);
}

std::string *std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(std::string *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  std::string *v6;

  if (a4)
  {
    v6 = result;
    std::vector<std::string>::__vallocate[abi:ne180100](result, a4);
    result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>((uint64_t)&v6->__r_.__value_.__r.__words[2], a2, a3, (std::string *)v6->__r_.__value_.__l.__size_);
    v6->__r_.__value_.__l.__size_ = (std::string::size_type)result;
  }
  return result;
}

void sub_1A36AFC58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<std::string>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >= 0xAAAAAAAAAAAAAABLL)
    std::vector<double>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[24 * v4];
  return result;
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string*,std::string*,std::string*>(uint64_t a1, __int128 *a2, __int128 *a3, std::string *this)
{
  std::string *v4;
  __int128 *v6;
  __int128 v7;
  _QWORD v9[3];
  char v10;
  std::string *v11;
  std::string *v12;

  v4 = this;
  v11 = this;
  v12 = this;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  v10 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)v6, *((_QWORD *)v6 + 1));
        v4 = v12;
      }
      else
      {
        v7 = *v6;
        v4->__r_.__value_.__r.__words[2] = *((_QWORD *)v6 + 2);
        *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v7;
      }
      v6 = (__int128 *)((char *)v6 + 24);
      v12 = ++v4;
    }
    while (v6 != a3);
  }
  v10 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v9);
  return v4;
}

void sub_1A36AFD70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = **(_QWORD **)(a1 + 16);
  v2 = **(_QWORD **)(a1 + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 - 1) < 0)
      operator delete(*(void **)(v1 - 24));
    v1 -= 24;
  }
}

void std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::string>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<std::string>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 24)
  {
    if (*(char *)(i - 1) < 0)
      operator delete(*(void **)(i - 24));
  }
  a1[1] = v2;
}

std::string *std::vector<std::pair<std::string,double>>::__init_with_size[abi:ne180100]<std::pair<std::string,double>*,std::pair<std::string,double>*>(std::string *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  std::string *v6;

  if (a4)
  {
    v6 = result;
    std::vector<std::pair<std::string,double>>::__vallocate[abi:ne180100](result, a4);
    result = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::pair<std::string,double>>,std::pair<std::string,double>*,std::pair<std::string,double>*,std::pair<std::string,double>*>((uint64_t)&v6->__r_.__value_.__r.__words[2], a2, a3, (std::string *)v6->__r_.__value_.__l.__size_);
    v6->__r_.__value_.__l.__size_ = (std::string::size_type)result;
  }
  return result;
}

void sub_1A36AFEEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void **a9)
{
  uint64_t v9;
  uint64_t v10;

  *(_QWORD *)(v9 + 8) = v10;
  std::vector<std::pair<std::string,double>>::__destroy_vector::operator()[abi:ne180100](&a9);
  _Unwind_Resume(a1);
}

char *std::vector<std::pair<std::string,double>>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 59)
    std::vector<double>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,double>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[32 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,double>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(32 * a2);
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::pair<std::string,double>>,std::pair<std::string,double>*,std::pair<std::string,double>*,std::pair<std::string,double>*>(uint64_t a1, __int128 *a2, __int128 *a3, std::string *this)
{
  std::string *v4;
  __int128 *v6;
  __int128 v7;
  std::string *v8;
  _QWORD v10[3];
  char v11;
  std::string *v12;
  std::string *v13;

  v4 = this;
  v12 = this;
  v13 = this;
  v10[0] = a1;
  v10[1] = &v12;
  v10[2] = &v13;
  v11 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)v6, *((_QWORD *)v6 + 1));
        v8 = v13;
      }
      else
      {
        v7 = *v6;
        v4->__r_.__value_.__r.__words[2] = *((_QWORD *)v6 + 2);
        *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v7;
        v8 = v4;
      }
      v4[1].__r_.__value_.__r.__words[0] = *((_QWORD *)v6 + 3);
      v6 += 2;
      v4 = (std::string *)((char *)v8 + 32);
      v13 = (std::string *)((char *)v8 + 32);
    }
    while (v6 != a3);
  }
  v11 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,double>>,std::pair<std::string,double>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v10);
  return v4;
}

void sub_1A36B0034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,double>>,std::pair<std::string,double>*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,double>>,std::pair<std::string,double>*>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,double>>,std::pair<std::string,double>*>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,double>>,std::pair<std::string,double>*>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = **(_QWORD **)(a1 + 16);
  v2 = **(_QWORD **)(a1 + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 - 9) < 0)
      operator delete(*(void **)(v1 - 32));
    v1 -= 32;
  }
}

void std::vector<std::pair<std::string,double>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::pair<std::string,double>>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

void std::vector<std::pair<std::string,double>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t i;

  v2 = *a1;
  for (i = a1[1]; i != v2; i -= 32)
  {
    if (*(char *)(i - 9) < 0)
      operator delete(*(void **)(i - 32));
  }
  a1[1] = v2;
}

uint64_t std::vector<ME_Model::Sample>::__push_back_slow_path<ME_Model::Sample const&>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  uint64_t v11;
  char *v13;
  char *v14;
  char *v15;
  char *v16;
  uint64_t *v17;

  v3 = *a1;
  v4 = 0xCCCCCCCCCCCCCCCDLL * ((a1[1] - *a1) >> 4);
  v5 = v4 + 1;
  if (v4 + 1 > 0x333333333333333)
    std::vector<double>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xCCCCCCCCCCCCCCCDLL * ((a1[2] - v3) >> 4);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x199999999999999)
    v9 = 0x333333333333333;
  else
    v9 = v5;
  v17 = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ME_Model::Sample>>(v7, v9);
  else
    v10 = 0;
  v13 = v10;
  v14 = &v10[80 * v4];
  v16 = &v10[80 * v9];
  std::construct_at[abi:ne180100]<ME_Model::Sample,ME_Model::Sample const&,ME_Model::Sample*>((uint64_t)v14, a2);
  v15 = v14 + 80;
  std::vector<ME_Model::Sample>::__swap_out_circular_buffer(a1, &v13);
  v11 = a1[1];
  std::__split_buffer<ME_Model::Sample>::~__split_buffer((uint64_t)&v13);
  return v11;
}

void sub_1A36B023C(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<ME_Model::Sample>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::construct_at[abi:ne180100]<ME_Model::Sample,ME_Model::Sample const&,ME_Model::Sample*>(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>((_QWORD *)(a1 + 8), *(const void **)(a2 + 8), *(_QWORD *)(a2 + 16), (uint64_t)(*(_QWORD *)(a2 + 16) - *(_QWORD *)(a2 + 8)) >> 2);
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  std::vector<std::pair<int,double>>::__init_with_size[abi:ne180100]<std::pair<int,double>*,std::pair<int,double>*>((char *)(a1 + 32), *(__int128 **)(a2 + 32), *(__int128 **)(a2 + 40), (uint64_t)(*(_QWORD *)(a2 + 40) - *(_QWORD *)(a2 + 32)) >> 4);
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>((_QWORD *)(a1 + 56), *(const void **)(a2 + 56), *(_QWORD *)(a2 + 64), (uint64_t)(*(_QWORD *)(a2 + 64) - *(_QWORD *)(a2 + 56)) >> 3);
  return a1;
}

void sub_1A36B02E4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void **v3;
  void *v5;
  void *v6;

  v5 = *v3;
  if (*v3)
  {
    *(_QWORD *)(v1 + 40) = v5;
    operator delete(v5);
  }
  v6 = *v2;
  if (*v2)
  {
    *(_QWORD *)(v1 + 16) = v6;
    operator delete(v6);
  }
  _Unwind_Resume(exception_object);
}

_QWORD *std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<int>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1A36B0374(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<int>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 62)
    std::vector<double>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ME_Model::ME_Feature>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

char *std::vector<std::pair<int,double>>::__init_with_size[abi:ne180100]<std::pair<int,double>*,std::pair<int,double>*>(char *result, __int128 *a2, __int128 *a3, unint64_t a4)
{
  char *v6;
  _OWORD *v7;
  __int128 v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<std::pair<int,double>>::__vallocate[abi:ne180100](result, a4);
    v7 = (_OWORD *)*((_QWORD *)v6 + 1);
    while (a2 != a3)
    {
      v8 = *a2++;
      *v7++ = v8;
    }
    *((_QWORD *)v6 + 1) = v7;
  }
  return result;
}

void sub_1A36B0424(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<std::pair<int,double>>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 60)
    std::vector<double>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<int,double>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

void std::vector<ME_Model::Sample>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = *a1;
  v4 = a1[1];
  v6 = a2[1];
  while (v4 != v5)
  {
    v6 -= 80;
    v4 -= 80;
    std::construct_at[abi:ne180100]<ME_Model::Sample,ME_Model::Sample,ME_Model::Sample*>(v6, v4);
  }
  a2[1] = v6;
  v7 = *a1;
  *a1 = v6;
  a2[1] = v7;
  v8 = a1[1];
  a1[1] = a2[2];
  a2[2] = v8;
  v9 = a1[2];
  a1[2] = a2[3];
  a2[3] = v9;
  *a2 = a2[1];
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ME_Model::Sample>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x333333333333334)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(80 * a2);
}

__n128 std::construct_at[abi:ne180100]<ME_Model::Sample,ME_Model::Sample,ME_Model::Sample*>(uint64_t a1, uint64_t a2)
{
  __n128 result;

  *(_DWORD *)a1 = *(_DWORD *)a2;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a2 + 32) = 0;
  *(_QWORD *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = 0;
  *(_QWORD *)(a1 + 72) = 0;
  result = *(__n128 *)(a2 + 56);
  *(__n128 *)(a1 + 56) = result;
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a2 + 56) = 0;
  *(_QWORD *)(a2 + 64) = 0;
  *(_QWORD *)(a2 + 72) = 0;
  return result;
}

uint64_t std::__split_buffer<ME_Model::Sample>::~__split_buffer(uint64_t a1)
{
  uint64_t i;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  for (i = *(_QWORD *)(a1 + 16); i != v3; i = *(_QWORD *)(a1 + 16))
  {
    *(_QWORD *)(a1 + 16) = i - 80;
    std::__destroy_at[abi:ne180100]<ME_Model::Sample,0>((_QWORD *)(i - 80));
  }
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *,false>(std::vector<int> *a1, int *a2, uint64_t a3, uint64_t a4, char a5)
{
  std::vector<int> *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  std::vector<int> *v15;
  uint64_t v16;
  std::vector<int> *v17;
  std::vector<int> *v18;
  std::vector<int> *v19;
  std::__compressed_pair<int *> *v20;
  char v21;
  BOOL v22;

LABEL_1:
  v9 = a1;
LABEL_2:
  v10 = 1 - a4;
  while (2)
  {
    a1 = v9;
    v11 = v10;
    v12 = (char *)a2 - (char *)v9;
    v13 = 0xCCCCCCCCCCCCCCCDLL * (((char *)a2 - (char *)v9) >> 4);
    switch(v13)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        if (ME_Model::Sample::operator<((uint64_t)(a2 - 20), (uint64_t)v9))
          std::swap[abi:ne180100]<ME_Model::Sample>(v9, (uint64_t)(a2 - 20));
        return;
      case 3uLL:
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(v9, (std::vector<int> *)((char *)v9 + 80), (uint64_t)(a2 - 20));
        return;
      case 4uLL:
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(v9, (std::vector<int> *)((char *)v9 + 80), (std::vector<int> *)((char *)v9 + 160), (uint64_t)(a2 - 20));
        return;
      case 5uLL:
        std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(v9, (std::vector<int> *)((char *)v9 + 80), (std::vector<int> *)((char *)v9 + 160), v9 + 10, (uint64_t)(a2 - 20));
        return;
      default:
        if (v12 <= 1919)
        {
          if ((a5 & 1) != 0)
            std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>((uint64_t)v9, a2);
          else
            std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>((uint64_t)v9, (unsigned __int32 *)a2);
          return;
        }
        if (v11 != 1)
        {
          v14 = v13 >> 1;
          v15 = (std::vector<int> *)((char *)v9 + 80 * (v13 >> 1));
          if ((unint64_t)v12 < 0x2801)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(v15, v9, (uint64_t)(a2 - 20));
            if ((a5 & 1) != 0)
              goto LABEL_11;
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(v9, v15, (uint64_t)(a2 - 20));
            v16 = 5 * v14;
            v17 = (std::vector<int> *)((char *)v9 + 80 * v14 - 80);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>((std::vector<int> *)((char *)v9 + 80), v17, (uint64_t)(a2 - 40));
            v18 = (std::vector<int> *)((char *)v9 + 160);
            v19 = (std::vector<int> *)((char *)v9 + 16 * v16 + 80);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(v18, v19, (uint64_t)(a2 - 60));
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(v17, v15, (uint64_t)v19);
            std::swap[abi:ne180100]<ME_Model::Sample>(a1, (uint64_t)v15);
            if ((a5 & 1) != 0)
              goto LABEL_11;
          }
          if ((ME_Model::Sample::operator<((uint64_t)&a1[-4].__end_cap_, (uint64_t)a1) & 1) == 0)
          {
            v9 = std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,ME_Model::Sample *,std::__less<void,void> &>((std::__compressed_pair<int *> *)a1, (unint64_t)a2);
            goto LABEL_16;
          }
LABEL_11:
          v20 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,ME_Model::Sample *,std::__less<void,void> &>((std::__compressed_pair<int *> *)a1, (unint64_t)a2);
          if ((v21 & 1) == 0)
            goto LABEL_14;
          v22 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>((uint64_t)a1, (uint64_t)v20);
          v9 = (std::vector<int> *)&v20[10];
          if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>((uint64_t)&v20[10], (uint64_t)a2))
          {
            v10 = v11 + 1;
            if (v22)
              continue;
LABEL_14:
            std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *,false>(a1, v20, a3, -v11, a5 & 1);
            v9 = (std::vector<int> *)&v20[10];
LABEL_16:
            a5 = 0;
            a4 = -v11;
            goto LABEL_2;
          }
          a4 = -v11;
          a2 = (int *)v20;
          if (v22)
            return;
          goto LABEL_1;
        }
        if (v9 != (std::vector<int> *)a2)
          std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *,ME_Model::Sample *>((uint64_t)v9, (uint64_t)a2, (std::vector<int> *)a2, a3);
        return;
    }
  }
}

void std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(uint64_t a1, int *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  _QWORD *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  void *v28[2];
  uint64_t v29;
  void *__p[2];
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  if ((int *)a1 != a2)
  {
    v34 = v2;
    v35 = v3;
    v6 = a1 + 80;
    if ((int *)(a1 + 80) != a2)
    {
      v7 = 0;
      v8 = a1;
      do
      {
        v9 = (int *)v6;
        if (ME_Model::Sample::operator<(v6, v8))
        {
          v27 = *v9;
          *(_OWORD *)v28 = *(_OWORD *)(v8 + 88);
          v29 = *(_QWORD *)(v8 + 104);
          *(_QWORD *)(v8 + 88) = 0;
          *(_QWORD *)(v8 + 96) = 0;
          *(_OWORD *)__p = *(_OWORD *)(v8 + 112);
          v31 = *(_QWORD *)(v8 + 128);
          *(_QWORD *)(v8 + 104) = 0;
          *(_QWORD *)(v8 + 112) = 0;
          *(_QWORD *)(v8 + 120) = 0;
          *(_QWORD *)(v8 + 128) = 0;
          v32 = *(_OWORD *)(v8 + 136);
          v33 = *(_QWORD *)(v8 + 152);
          *(_QWORD *)(v8 + 136) = 0;
          *(_QWORD *)(v8 + 144) = 0;
          v10 = v7;
          *(_QWORD *)(v8 + 152) = 0;
          while (1)
          {
            v11 = a1 + v10;
            *(_DWORD *)(a1 + v10 + 80) = *(_DWORD *)(a1 + v10);
            std::vector<double>::__move_assign(a1 + v10 + 88, (__n128 *)(a1 + v10 + 8));
            std::vector<double>::__move_assign(v11 + 112, (__n128 *)(v11 + 32));
            std::vector<double>::__move_assign(v11 + 136, (__n128 *)(v11 + 56));
            if (!v10)
              break;
            v10 -= 80;
            if ((ME_Model::Sample::operator<((uint64_t)&v27, v10 + a1) & 1) == 0)
            {
              v12 = a1 + v10 + 80;
              goto LABEL_10;
            }
          }
          v12 = a1;
LABEL_10:
          *(_DWORD *)v12 = v27;
          v15 = *(void **)(v11 + 8);
          v14 = (_QWORD *)(v11 + 8);
          v13 = v15;
          if (v15)
          {
            *(_QWORD *)(v12 + 16) = v13;
            operator delete(v13);
            *v14 = 0;
            v14[1] = 0;
            v14[2] = 0;
          }
          v16 = v14 + 3;
          v17 = v28[1];
          *v14 = v28[0];
          v18 = v29;
          *(_QWORD *)(v12 + 16) = v17;
          *(_QWORD *)(v12 + 24) = v18;
          v28[1] = 0;
          v29 = 0;
          v28[0] = 0;
          v19 = (void *)v14[3];
          if (v19)
          {
            *(_QWORD *)(v12 + 40) = v19;
            operator delete(v19);
            *v16 = 0;
            v14[4] = 0;
            v14[5] = 0;
          }
          v20 = __p[1];
          *v16 = __p[0];
          v21 = v31;
          *(_QWORD *)(v12 + 40) = v20;
          *(_QWORD *)(v12 + 48) = v21;
          __p[1] = 0;
          v31 = 0;
          __p[0] = 0;
          v24 = (void *)v14[6];
          v23 = v14 + 6;
          v22 = v24;
          if (v24)
          {
            *(_QWORD *)(v12 + 64) = v22;
            operator delete(v22);
            *v23 = 0;
            v23[1] = 0;
            v23[2] = 0;
            v22 = __p[0];
          }
          v25 = *((_QWORD *)&v32 + 1);
          *v23 = v32;
          v26 = v33;
          *(_QWORD *)(v12 + 64) = v25;
          *(_QWORD *)(v12 + 72) = v26;
          v33 = 0;
          v32 = 0uLL;
          if (v22)
          {
            __p[1] = v22;
            operator delete(v22);
          }
          if (v28[0])
          {
            v28[1] = v28[0];
            operator delete(v28[0]);
          }
        }
        v6 = (uint64_t)(v9 + 20);
        v7 += 80;
        v8 = (uint64_t)v9;
      }
      while (v9 + 20 != a2);
    }
  }
}

void std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(uint64_t a1, unsigned __int32 *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  __n128 *v7;
  unsigned __int32 *v8;
  __n128 *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int32 v14;
  void *v15[2];
  unint64_t v16;
  void *__p[2];
  unint64_t v18;
  __n128 v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if ((unsigned __int32 *)a1 != a2)
  {
    v21 = v2;
    v22 = v3;
    v5 = a1;
    v6 = a1 + 80;
    if ((unsigned __int32 *)(a1 + 80) != a2)
    {
      v7 = (__n128 *)(a1 + 152);
      do
      {
        v8 = (unsigned __int32 *)v6;
        if (ME_Model::Sample::operator<(v6, v5))
        {
          v14 = *v8;
          *(_OWORD *)v15 = *(_OWORD *)(v5 + 88);
          v16 = *(_QWORD *)(v5 + 104);
          *(_QWORD *)(v5 + 88) = 0;
          *(_QWORD *)(v5 + 96) = 0;
          *(_OWORD *)__p = *(_OWORD *)(v5 + 112);
          v18 = *(_QWORD *)(v5 + 128);
          *(_QWORD *)(v5 + 104) = 0;
          *(_QWORD *)(v5 + 112) = 0;
          *(_QWORD *)(v5 + 120) = 0;
          *(_QWORD *)(v5 + 128) = 0;
          v19 = *(__n128 *)(v5 + 136);
          v20 = *(_QWORD *)(v5 + 152);
          *(_QWORD *)(v5 + 136) = 0;
          *(_QWORD *)(v5 + 144) = 0;
          v9 = v7;
          *(_QWORD *)(v5 + 152) = 0;
          do
          {
            v9[-5].n128_u32[2] = v9[-10].n128_u32[2];
            std::vector<double>::__move_assign((uint64_t)&v9[-4], v9 - 9);
            std::vector<double>::__move_assign((uint64_t)&v9[-3].n128_i64[1], (__n128 *)((char *)v9 - 120));
            std::vector<double>::__move_assign((uint64_t)&v9[-1], v9 - 6);
            v10 = ME_Model::Sample::operator<((uint64_t)&v14, (uint64_t)&v9[-15].n128_i64[1]);
            v9 -= 5;
          }
          while ((v10 & 1) != 0);
          v11 = (void *)v9[-4].n128_u64[0];
          v9[-5].n128_u32[2] = v14;
          if (v11)
          {
            v9[-4].n128_u64[1] = (unint64_t)v11;
            operator delete(v11);
            v9[-4].n128_u64[0] = 0;
            v9[-4].n128_u64[1] = 0;
            v9[-3].n128_u64[0] = 0;
          }
          v9[-4] = *(__n128 *)v15;
          v9[-3].n128_u64[0] = v16;
          v15[1] = 0;
          v16 = 0;
          v15[0] = 0;
          v12 = (void *)v9[-3].n128_u64[1];
          if (v12)
          {
            v9[-2].n128_u64[0] = (unint64_t)v12;
            operator delete(v12);
            v9[-3].n128_u64[1] = 0;
            v9[-2].n128_u64[0] = 0;
            v9[-2].n128_u64[1] = 0;
          }
          *(__n128 *)((char *)v9 - 40) = *(__n128 *)__p;
          v9[-2].n128_u64[1] = v18;
          __p[1] = 0;
          v18 = 0;
          __p[0] = 0;
          v13 = (void *)v9[-1].n128_u64[0];
          if (v13)
          {
            v9[-1].n128_u64[1] = (unint64_t)v13;
            operator delete(v13);
            v9[-1].n128_u64[0] = 0;
            v9[-1].n128_u64[1] = 0;
            v9->n128_u64[0] = 0;
            v13 = __p[0];
          }
          v9[-1] = v19;
          v9->n128_u64[0] = v20;
          v20 = 0;
          v19 = 0uLL;
          if (v13)
          {
            __p[1] = v13;
            operator delete(v13);
          }
          if (v15[0])
          {
            v15[1] = v15[0];
            operator delete(v15[0]);
          }
        }
        v6 = (uint64_t)(v8 + 20);
        v7 += 5;
        v5 = (uint64_t)v8;
      }
      while (v8 + 20 != a2);
    }
  }
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(std::vector<int> *a1, std::vector<int> *a2, uint64_t a3)
{
  char v6;
  uint64_t result;
  std::vector<int> *v8;
  uint64_t v9;

  v6 = ME_Model::Sample::operator<((uint64_t)a2, (uint64_t)a1);
  result = ME_Model::Sample::operator<(a3, (uint64_t)a2);
  if ((v6 & 1) == 0)
  {
    if (!(_DWORD)result)
      return result;
    std::swap[abi:ne180100]<ME_Model::Sample>(a2, a3);
    if (!ME_Model::Sample::operator<((uint64_t)a2, (uint64_t)a1))
      return 1;
    v8 = a1;
    v9 = (uint64_t)a2;
    goto LABEL_9;
  }
  if (!(_DWORD)result)
  {
    std::swap[abi:ne180100]<ME_Model::Sample>(a1, (uint64_t)a2);
    if (!ME_Model::Sample::operator<(a3, (uint64_t)a2))
      return 1;
    v8 = a2;
    v9 = a3;
LABEL_9:
    std::swap[abi:ne180100]<ME_Model::Sample>(v8, v9);
    return 2;
  }
  std::swap[abi:ne180100]<ME_Model::Sample>(a1, a3);
  return 1;
}

std::vector<int> *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,ME_Model::Sample *,std::__less<void,void> &>(std::__compressed_pair<int *> *a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  std::vector<int> *v7;
  unint64_t p_end;
  int v9;
  int *begin;
  int *v11;
  int *v12;
  int value;
  void *v15[2];
  int *v16;
  void *__p[2];
  int *v18;
  __int128 v19;
  int *v20;

  v2 = a2;
  value = (int)a1->__value_;
  v4 = (uint64_t)&a1[1];
  *(_OWORD *)v15 = *(_OWORD *)&a1[1].__value_;
  v16 = a1[3].__value_;
  a1[1].__value_ = 0;
  a1[2].__value_ = 0;
  a1[3].__value_ = 0;
  v5 = (uint64_t)&a1[4];
  *(_OWORD *)__p = *(_OWORD *)&a1[4].__value_;
  v18 = a1[6].__value_;
  a1[4].__value_ = 0;
  a1[5].__value_ = 0;
  a1[6].__value_ = 0;
  v6 = (uint64_t)&a1[7];
  v19 = *(_OWORD *)&a1[7].__value_;
  v20 = a1[9].__value_;
  a1[8].__value_ = 0;
  a1[9].__value_ = 0;
  a1[7].__value_ = 0;
  if ((ME_Model::Sample::operator<((uint64_t)&value, a2 - 80) & 1) != 0)
  {
    v7 = (std::vector<int> *)a1;
    do
      v7 = (std::vector<int> *)((char *)v7 + 80);
    while ((ME_Model::Sample::operator<((uint64_t)&value, (uint64_t)v7) & 1) == 0);
  }
  else
  {
    p_end = (unint64_t)&a1[10];
    do
    {
      v7 = (std::vector<int> *)p_end;
      if (p_end >= v2)
        break;
      v9 = ME_Model::Sample::operator<((uint64_t)&value, p_end);
      p_end = (unint64_t)&v7[3].__end_;
    }
    while (!v9);
  }
  if ((unint64_t)v7 < v2)
  {
    do
      v2 -= 80;
    while ((ME_Model::Sample::operator<((uint64_t)&value, v2) & 1) != 0);
  }
  while ((unint64_t)v7 < v2)
  {
    std::swap[abi:ne180100]<ME_Model::Sample>(v7, v2);
    do
      v7 = (std::vector<int> *)((char *)v7 + 80);
    while (!ME_Model::Sample::operator<((uint64_t)&value, (uint64_t)v7));
    do
      v2 -= 80;
    while ((ME_Model::Sample::operator<((uint64_t)&value, v2) & 1) != 0);
  }
  if (&v7[-4].__end_cap_ != a1)
  {
    LODWORD(a1->__value_) = v7[-4].__end_cap_.__value_;
    std::vector<double>::__move_assign(v4, (__n128 *)&v7[-3]);
    std::vector<double>::__move_assign(v5, (__n128 *)&v7[-2]);
    std::vector<double>::__move_assign(v6, (__n128 *)&v7[-1]);
  }
  begin = v7[-3].__begin_;
  LODWORD(v7[-4].__end_cap_.__value_) = value;
  if (begin)
  {
    v7[-3].__end_ = begin;
    operator delete(begin);
    v7[-3].__begin_ = 0;
    v7[-3].__end_ = 0;
    v7[-3].__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&v7[-3].__begin_ = *(_OWORD *)v15;
  v7[-3].__end_cap_.__value_ = v16;
  v15[0] = 0;
  v15[1] = 0;
  v16 = 0;
  v11 = v7[-2].__begin_;
  if (v11)
  {
    v7[-2].__end_ = v11;
    operator delete(v11);
    v7[-2].__begin_ = 0;
    v7[-2].__end_ = 0;
    v7[-2].__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&v7[-2].__begin_ = *(_OWORD *)__p;
  v7[-2].__end_cap_.__value_ = v18;
  __p[0] = 0;
  __p[1] = 0;
  v18 = 0;
  v12 = v7[-1].__begin_;
  if (v12)
  {
    v7[-1].__end_ = v12;
    operator delete(v12);
    v7[-1].__begin_ = 0;
    v7[-1].__end_ = 0;
    v7[-1].__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&v7[-1].__begin_ = v19;
  v7[-1].__end_cap_.__value_ = v20;
  v19 = 0uLL;
  v20 = 0;
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v15[0])
  {
    v15[1] = v15[0];
    operator delete(v15[0]);
  }
  return v7;
}

std::__compressed_pair<int *> *std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,ME_Model::Sample *,std::__less<void,void> &>(std::__compressed_pair<int *> *a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  std::vector<int> *v9;
  unint64_t v10;
  int *begin;
  int *v12;
  int *v13;
  int value;
  void *v16[2];
  int *v17;
  void *__p[2];
  int *v19;
  __int128 v20;
  int *v21;

  v4 = 0;
  value = (int)a1->__value_;
  v5 = (uint64_t)&a1[1];
  *(_OWORD *)v16 = *(_OWORD *)&a1[1].__value_;
  v17 = a1[3].__value_;
  a1[1].__value_ = 0;
  a1[2].__value_ = 0;
  a1[3].__value_ = 0;
  v6 = (uint64_t)&a1[4];
  *(_OWORD *)__p = *(_OWORD *)&a1[4].__value_;
  v19 = a1[6].__value_;
  a1[4].__value_ = 0;
  a1[5].__value_ = 0;
  a1[6].__value_ = 0;
  v21 = a1[9].__value_;
  v7 = (uint64_t)&a1[7];
  v20 = *(_OWORD *)&a1[7].__value_;
  a1[8].__value_ = 0;
  a1[9].__value_ = 0;
  a1[7].__value_ = 0;
  do
    v4 += 10;
  while ((ME_Model::Sample::operator<((uint64_t)&a1[v4], (uint64_t)&value) & 1) != 0);
  v8 = (unint64_t)&a1[v4];
  if (v4 == 10)
  {
    do
    {
      if (v8 >= a2)
        break;
      a2 -= 80;
    }
    while ((ME_Model::Sample::operator<(a2, (uint64_t)&value) & 1) == 0);
  }
  else
  {
    do
      a2 -= 80;
    while (!ME_Model::Sample::operator<(a2, (uint64_t)&value));
  }
  v9 = (std::vector<int> *)&a1[v4];
  if (v8 < a2)
  {
    v10 = a2;
    do
    {
      std::swap[abi:ne180100]<ME_Model::Sample>(v9, v10);
      do
        v9 = (std::vector<int> *)((char *)v9 + 80);
      while ((ME_Model::Sample::operator<((uint64_t)v9, (uint64_t)&value) & 1) != 0);
      do
        v10 -= 80;
      while (!ME_Model::Sample::operator<(v10, (uint64_t)&value));
    }
    while ((unint64_t)v9 < v10);
  }
  if (&v9[-4].__end_cap_ != a1)
  {
    LODWORD(a1->__value_) = v9[-4].__end_cap_.__value_;
    std::vector<double>::__move_assign(v5, (__n128 *)&v9[-3]);
    std::vector<double>::__move_assign(v6, (__n128 *)&v9[-2]);
    std::vector<double>::__move_assign(v7, (__n128 *)&v9[-1]);
  }
  begin = v9[-3].__begin_;
  LODWORD(v9[-4].__end_cap_.__value_) = value;
  if (begin)
  {
    v9[-3].__end_ = begin;
    operator delete(begin);
    v9[-3].__begin_ = 0;
    v9[-3].__end_ = 0;
    v9[-3].__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&v9[-3].__begin_ = *(_OWORD *)v16;
  v9[-3].__end_cap_.__value_ = v17;
  v16[0] = 0;
  v16[1] = 0;
  v17 = 0;
  v12 = v9[-2].__begin_;
  if (v12)
  {
    v9[-2].__end_ = v12;
    operator delete(v12);
    v9[-2].__begin_ = 0;
    v9[-2].__end_ = 0;
    v9[-2].__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&v9[-2].__begin_ = *(_OWORD *)__p;
  v9[-2].__end_cap_.__value_ = v19;
  __p[0] = 0;
  __p[1] = 0;
  v19 = 0;
  v13 = v9[-1].__begin_;
  if (v13)
  {
    v9[-1].__end_ = v13;
    operator delete(v13);
    v9[-1].__begin_ = 0;
    v9[-1].__end_ = 0;
    v9[-1].__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&v9[-1].__begin_ = v20;
  v9[-1].__end_cap_.__value_ = v21;
  v20 = 0uLL;
  v21 = 0;
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v16[0])
  {
    v16[1] = v16[0];
    operator delete(v16[0]);
  }
  return &v9[-4].__end_cap_;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  _BOOL8 result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  _QWORD *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  void *v29[2];
  uint64_t v30;
  void *__p[2];
  uint64_t v32;
  __int128 v33;
  uint64_t v34;

  v4 = 0xCCCCCCCCCCCCCCCDLL * ((a2 - a1) >> 4);
  result = 1;
  switch(v4)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      v6 = a2 - 80;
      if (ME_Model::Sample::operator<(a2 - 80, a1))
        std::swap[abi:ne180100]<ME_Model::Sample>((std::vector<int> *)a1, v6);
      return 1;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>((std::vector<int> *)a1, (std::vector<int> *)(a1 + 80), a2 - 80);
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>((std::vector<int> *)a1, (std::vector<int> *)(a1 + 80), (std::vector<int> *)(a1 + 160), a2 - 80);
      return 1;
    case 5uLL:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>((std::vector<int> *)a1, (std::vector<int> *)(a1 + 80), (std::vector<int> *)(a1 + 160), (std::vector<int> *)(a1 + 240), a2 - 80);
      return 1;
    default:
      v7 = a1 + 160;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>((std::vector<int> *)a1, (std::vector<int> *)(a1 + 80), a1 + 160);
      v8 = a1 + 240;
      if (a1 + 240 == a2)
        return 1;
      v9 = 0;
      v10 = 0;
      break;
  }
  while (1)
  {
    if (ME_Model::Sample::operator<(v8, v7))
    {
      v28 = *(_DWORD *)v8;
      *(_OWORD *)v29 = *(_OWORD *)(v8 + 8);
      v30 = *(_QWORD *)(v8 + 24);
      *(_QWORD *)(v8 + 8) = 0;
      *(_QWORD *)(v8 + 16) = 0;
      *(_OWORD *)__p = *(_OWORD *)(v8 + 32);
      v32 = *(_QWORD *)(v8 + 48);
      *(_QWORD *)(v8 + 24) = 0;
      *(_QWORD *)(v8 + 32) = 0;
      *(_QWORD *)(v8 + 40) = 0;
      *(_QWORD *)(v8 + 48) = 0;
      v33 = *(_OWORD *)(v8 + 56);
      v34 = *(_QWORD *)(v8 + 72);
      *(_QWORD *)(v8 + 64) = 0;
      *(_QWORD *)(v8 + 72) = 0;
      v11 = v9;
      *(_QWORD *)(v8 + 56) = 0;
      while (1)
      {
        v12 = a1 + v11;
        *(_DWORD *)(a1 + v11 + 240) = *(_DWORD *)(a1 + v11 + 160);
        std::vector<double>::__move_assign(a1 + v11 + 248, (__n128 *)(a1 + v11 + 168));
        std::vector<double>::__move_assign(v12 + 272, (__n128 *)(v12 + 192));
        std::vector<double>::__move_assign(v12 + 296, (__n128 *)(v12 + 216));
        if (v11 == -160)
          break;
        v11 -= 80;
        if ((ME_Model::Sample::operator<((uint64_t)&v28, v12 + 80) & 1) == 0)
        {
          v13 = a1 + v11 + 240;
          goto LABEL_12;
        }
      }
      v13 = a1;
LABEL_12:
      *(_DWORD *)v13 = v28;
      v16 = *(void **)(v12 + 168);
      v15 = (_QWORD *)(v12 + 168);
      v14 = v16;
      if (v16)
      {
        *(_QWORD *)(v13 + 16) = v14;
        operator delete(v14);
        *v15 = 0;
        v15[1] = 0;
        v15[2] = 0;
      }
      v17 = v15 + 3;
      v18 = v29[1];
      *v15 = v29[0];
      v19 = v30;
      *(_QWORD *)(v13 + 16) = v18;
      *(_QWORD *)(v13 + 24) = v19;
      v29[1] = 0;
      v30 = 0;
      v29[0] = 0;
      v20 = (void *)v15[3];
      if (v20)
      {
        *(_QWORD *)(v13 + 40) = v20;
        operator delete(v20);
        *v17 = 0;
        v15[4] = 0;
        v15[5] = 0;
      }
      v21 = __p[1];
      *v17 = __p[0];
      v22 = v32;
      *(_QWORD *)(v13 + 40) = v21;
      *(_QWORD *)(v13 + 48) = v22;
      __p[1] = 0;
      v32 = 0;
      __p[0] = 0;
      v25 = (void *)v15[6];
      v24 = v15 + 6;
      v23 = v25;
      if (v25)
      {
        *(_QWORD *)(v13 + 64) = v23;
        operator delete(v23);
        *v24 = 0;
        v24[1] = 0;
        v24[2] = 0;
        v23 = __p[0];
      }
      v26 = *((_QWORD *)&v33 + 1);
      *v24 = v33;
      v27 = v34;
      *(_QWORD *)(v13 + 64) = v26;
      *(_QWORD *)(v13 + 72) = v27;
      v34 = 0;
      v33 = 0uLL;
      if (v23)
      {
        __p[1] = v23;
        operator delete(v23);
      }
      if (v29[0])
      {
        v29[1] = v29[0];
        operator delete(v29[0]);
      }
      if (++v10 == 8)
        return v8 + 80 == a2;
    }
    v7 = v8;
    v9 += 80;
    v8 += 80;
    if (v8 == a2)
      return 1;
  }
}

uint64_t ME_Model::Sample::operator<(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unsigned int v7;
  int v8;
  int v9;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16) - v2;
  if (v3)
  {
    v4 = 0;
    v5 = v3 >> 2;
    v6 = *(_QWORD *)(a2 + 8);
    v7 = 1;
    while ((*(_QWORD *)(a2 + 16) - v6) >> 2 > v4)
    {
      v8 = *(_DWORD *)(v2 + 4 * v4);
      v9 = *(_DWORD *)(v6 + 4 * v4);
      if (v8 < v9)
        return 1;
      v4 = v7++;
      if (v8 > v9 || v5 <= v4)
        return 0;
    }
  }
  return 0;
}

__n128 std::swap[abi:ne180100]<ME_Model::Sample>(std::vector<int> *this, uint64_t a2)
{
  int begin;
  __int128 v4;
  std::vector<int>::pointer v5;
  std::vector<int>::pointer *p_end;
  std::vector<int>::pointer v7;
  std::vector<int>::pointer *v8;
  std::vector<int>::pointer v9;
  void *v10;
  void *v11;
  void *v12;
  __n128 result;
  __int128 v14;
  __int128 v15;
  __n128 v16;

  begin = (int)this->__begin_;
  v4 = *(_OWORD *)&this->__end_;
  v5 = this[1].__begin_;
  this->__end_ = 0;
  p_end = &this[1].__end_;
  v14 = v4;
  v15 = *(_OWORD *)&this[1].__end_;
  this[1].__end_ = 0;
  this->__end_cap_.__value_ = 0;
  this[1].__begin_ = 0;
  v7 = this[2].__begin_;
  this[1].__end_cap_.__value_ = 0;
  this[2].__begin_ = 0;
  v8 = &this[2].__end_;
  v16 = *(__n128 *)&this[2].__end_;
  v9 = this[3].__begin_;
  this[2].__end_ = 0;
  this[2].__end_cap_.__value_ = 0;
  this[3].__begin_ = 0;
  LODWORD(this->__begin_) = *(_DWORD *)a2;
  std::vector<double>::__move_assign((uint64_t)&this->__end_, (__n128 *)(a2 + 8));
  std::vector<double>::__move_assign((uint64_t)p_end, (__n128 *)(a2 + 32));
  std::vector<double>::__move_assign((uint64_t)v8, (__n128 *)(a2 + 56));
  *(_DWORD *)a2 = begin;
  v10 = *(void **)(a2 + 8);
  if (v10)
  {
    *(_QWORD *)(a2 + 16) = v10;
    operator delete(v10);
  }
  *(_OWORD *)(a2 + 8) = v14;
  *(_QWORD *)(a2 + 24) = v5;
  v11 = *(void **)(a2 + 32);
  if (v11)
  {
    *(_QWORD *)(a2 + 40) = v11;
    operator delete(v11);
  }
  *(_OWORD *)(a2 + 32) = v15;
  *(_QWORD *)(a2 + 48) = v7;
  v12 = *(void **)(a2 + 56);
  if (v12)
  {
    *(_QWORD *)(a2 + 64) = v12;
    operator delete(v12);
  }
  result = v16;
  *(__n128 *)(a2 + 56) = v16;
  *(_QWORD *)(a2 + 72) = v9;
  return result;
}

double std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(std::vector<int> *a1, std::vector<int> *a2, std::vector<int> *a3, uint64_t a4)
{
  double result;

  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(a1, a2, (uint64_t)a3);
  if (ME_Model::Sample::operator<(a4, (uint64_t)a3))
  {
    std::swap[abi:ne180100]<ME_Model::Sample>(a3, a4);
    if (ME_Model::Sample::operator<((uint64_t)a3, (uint64_t)a2))
    {
      std::swap[abi:ne180100]<ME_Model::Sample>(a2, (uint64_t)a3);
      if (ME_Model::Sample::operator<((uint64_t)a2, (uint64_t)a1))
        *(_QWORD *)&result = std::swap[abi:ne180100]<ME_Model::Sample>(a1, (uint64_t)a2).n128_u64[0];
    }
  }
  return result;
}

double std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(std::vector<int> *a1, std::vector<int> *a2, std::vector<int> *a3, std::vector<int> *a4, uint64_t a5)
{
  double result;

  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(a1, a2, a3, (uint64_t)a4);
  if (ME_Model::Sample::operator<(a5, (uint64_t)a4))
  {
    std::swap[abi:ne180100]<ME_Model::Sample>(a4, a5);
    if (ME_Model::Sample::operator<((uint64_t)a4, (uint64_t)a3))
    {
      std::swap[abi:ne180100]<ME_Model::Sample>(a3, (uint64_t)a4);
      if (ME_Model::Sample::operator<((uint64_t)a3, (uint64_t)a2))
      {
        std::swap[abi:ne180100]<ME_Model::Sample>(a2, (uint64_t)a3);
        if (ME_Model::Sample::operator<((uint64_t)a2, (uint64_t)a1))
          *(_QWORD *)&result = std::swap[abi:ne180100]<ME_Model::Sample>(a1, (uint64_t)a2).n128_u64[0];
      }
    }
  }
  return result;
}

std::vector<int> *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *,ME_Model::Sample *>(uint64_t a1, uint64_t a2, std::vector<int> *a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  std::vector<int> *v14;
  unint64_t v15;

  if (a1 != a2)
  {
    v6 = a2;
    v8 = a2 - a1;
    v9 = (a2 - a1) / 80;
    if (a2 - a1 >= 81)
    {
      v10 = (unint64_t)(v9 - 2) >> 1;
      v11 = v10 + 1;
      v12 = a1 + 80 * v10;
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(a1, a4, v9, v12);
        v12 -= 80;
        --v11;
      }
      while (v11);
    }
    v13 = v6;
    if ((std::vector<int> *)v6 != a3)
    {
      v14 = (std::vector<int> *)v6;
      do
      {
        if (ME_Model::Sample::operator<((uint64_t)v14, a1))
        {
          std::swap[abi:ne180100]<ME_Model::Sample>(v14, a1);
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(a1, a4, v9, a1);
        }
        v14 = (std::vector<int> *)((char *)v14 + 80);
      }
      while (v14 != a3);
      v13 = (uint64_t)a3;
    }
    if (v8 >= 81)
    {
      v15 = v8 / 0x50uLL;
      do
      {
        std::__pop_heap[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void>,ME_Model::Sample *>(a1, v6, a4, v15);
        v6 -= 80;
      }
      while (v15-- > 2);
    }
    return (std::vector<int> *)v13;
  }
  return a3;
}

void std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  int64_t v10;
  uint64_t v11;
  int64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int64_t v20;
  int v21;
  void *v22[2];
  uint64_t v23;
  void *__p[2];
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v6 = a3 - 2;
  if (a3 >= 2)
  {
    v28 = v4;
    v29 = v5;
    v7 = a4;
    v20 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) >= (uint64_t)(0xCCCCCCCCCCCCCCCDLL * ((a4 - a1) >> 4)))
    {
      v10 = (0x999999999999999ALL * ((a4 - a1) >> 4)) | 1;
      v11 = a1 + 80 * v10;
      v12 = 0x999999999999999ALL * ((a4 - a1) >> 4) + 2;
      if (v12 < a3 && ME_Model::Sample::operator<(a1 + 80 * v10, v11 + 80))
      {
        v11 += 80;
        v10 = v12;
      }
      if ((ME_Model::Sample::operator<(v11, v7) & 1) == 0)
      {
        v21 = *(_DWORD *)v7;
        *(_OWORD *)v22 = *(_OWORD *)(v7 + 8);
        v23 = *(_QWORD *)(v7 + 24);
        *(_QWORD *)(v7 + 8) = 0;
        *(_QWORD *)(v7 + 16) = 0;
        *(_OWORD *)__p = *(_OWORD *)(v7 + 32);
        v25 = *(_QWORD *)(v7 + 48);
        *(_QWORD *)(v7 + 24) = 0;
        *(_QWORD *)(v7 + 32) = 0;
        *(_QWORD *)(v7 + 40) = 0;
        *(_QWORD *)(v7 + 48) = 0;
        v26 = *(_OWORD *)(v7 + 56);
        v27 = *(_QWORD *)(v7 + 72);
        *(_QWORD *)(v7 + 64) = 0;
        *(_QWORD *)(v7 + 72) = 0;
        *(_QWORD *)(v7 + 56) = 0;
        do
        {
          v13 = v11;
          v14 = (_QWORD *)(v11 + 56);
          *(_DWORD *)v7 = *(_DWORD *)v11;
          std::vector<double>::__move_assign(v7 + 8, (__n128 *)(v11 + 8));
          std::vector<double>::__move_assign(v7 + 32, (__n128 *)(v11 + 32));
          std::vector<double>::__move_assign(v7 + 56, (__n128 *)(v11 + 56));
          if (v20 < v10)
            break;
          v15 = (2 * v10) | 1;
          v11 = a1 + 80 * v15;
          v16 = 2 * v10 + 2;
          if (v16 < a3 && ME_Model::Sample::operator<(a1 + 80 * v15, v11 + 80))
          {
            v11 += 80;
            v15 = v16;
          }
          v7 = v13;
          v10 = v15;
        }
        while (!ME_Model::Sample::operator<(v11, (uint64_t)&v21));
        *(_DWORD *)v13 = v21;
        v17 = *(void **)(v13 + 8);
        if (v17)
        {
          *(_QWORD *)(v13 + 16) = v17;
          operator delete(v17);
          *(_QWORD *)(v13 + 8) = 0;
          *(_QWORD *)(v13 + 16) = 0;
          *(_QWORD *)(v13 + 24) = 0;
        }
        *(_OWORD *)(v13 + 8) = *(_OWORD *)v22;
        *(_QWORD *)(v13 + 24) = v23;
        v22[0] = 0;
        v22[1] = 0;
        v23 = 0;
        v18 = *(void **)(v13 + 32);
        if (v18)
        {
          *(_QWORD *)(v13 + 40) = v18;
          operator delete(v18);
          *(_QWORD *)(v13 + 32) = 0;
          *(_QWORD *)(v13 + 40) = 0;
          *(_QWORD *)(v13 + 48) = 0;
        }
        *(_OWORD *)(v13 + 32) = *(_OWORD *)__p;
        *(_QWORD *)(v13 + 48) = v25;
        __p[0] = 0;
        __p[1] = 0;
        v25 = 0;
        v19 = *(void **)(v13 + 56);
        if (v19)
        {
          *(_QWORD *)(v13 + 64) = v19;
          operator delete(v19);
          *v14 = 0;
          v14[1] = 0;
          v14[2] = 0;
          v19 = __p[0];
        }
        *(_OWORD *)(v13 + 56) = v26;
        *(_QWORD *)(v13 + 72) = v27;
        v26 = 0uLL;
        v27 = 0;
        if (v19)
        {
          __p[1] = v19;
          operator delete(v19);
        }
        if (v22[0])
        {
          v22[1] = v22[0];
          operator delete(v22[0]);
        }
      }
    }
  }
}

void std::__pop_heap[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void>,ME_Model::Sample *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  if (a4 >= 2)
  {
    v7 = *(_DWORD *)a1;
    v8 = *(_QWORD *)(a1 + 16);
    v25 = *(_QWORD *)(a1 + 8);
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
    v10 = *(_QWORD *)(a1 + 24);
    v9 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)(a1 + 24) = 0;
    *(_QWORD *)(a1 + 32) = 0;
    v28 = v9;
    v26 = *(_QWORD *)(a1 + 48);
    v27 = *(_QWORD *)(a1 + 40);
    *(_QWORD *)(a1 + 40) = 0;
    *(_QWORD *)(a1 + 48) = 0;
    v11 = *(_QWORD *)(a1 + 56);
    v12 = *(_QWORD *)(a1 + 64);
    v13 = *(_QWORD *)(a1 + 72);
    *(_QWORD *)(a1 + 56) = 0;
    *(_QWORD *)(a1 + 64) = 0;
    *(_QWORD *)(a1 + 72) = 0;
    v14 = std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>((_DWORD *)a1, a3, a4);
    v15 = (_QWORD *)v14;
    if (v14 == a2 - 80)
    {
      *(_DWORD *)v14 = v7;
      v21 = (_QWORD *)(v14 + 8);
      v20 = *(void **)(v14 + 8);
      if (v20)
      {
        v15[2] = v20;
        operator delete(v20);
        *v21 = 0;
        v15[2] = 0;
        v15[3] = 0;
      }
      v22 = (void *)v15[4];
      v15[1] = v25;
      v15[2] = v8;
      v15[3] = v10;
      if (v22)
      {
        v15[5] = v22;
        operator delete(v22);
        v15[4] = 0;
        v15[5] = 0;
        v15[6] = 0;
      }
      v23 = (void *)v15[7];
      v15[4] = v28;
      v15[5] = v27;
      v15[6] = v26;
      if (v23)
      {
        v15[8] = v23;
        operator delete(v23);
        v15[7] = 0;
        v15[8] = 0;
        v15[9] = 0;
      }
      v15[7] = v11;
      v15[8] = v12;
      v15[9] = v13;
    }
    else
    {
      v24 = v11;
      *(_DWORD *)v14 = *(_DWORD *)(a2 - 80);
      v16 = v14 + 80;
      std::vector<double>::__move_assign(v14 + 8, (__n128 *)(a2 - 72));
      std::vector<double>::__move_assign((uint64_t)(v15 + 4), (__n128 *)(a2 - 48));
      std::vector<double>::__move_assign((uint64_t)(v15 + 7), (__n128 *)(a2 - 24));
      *(_DWORD *)(a2 - 80) = v7;
      v17 = *(void **)(a2 - 72);
      if (v17)
      {
        *(_QWORD *)(a2 - 64) = v17;
        operator delete(v17);
        *(_QWORD *)(a2 - 72) = 0;
        *(_QWORD *)(a2 - 64) = 0;
        *(_QWORD *)(a2 - 56) = 0;
      }
      *(_QWORD *)(a2 - 72) = v25;
      *(_QWORD *)(a2 - 64) = v8;
      *(_QWORD *)(a2 - 56) = v10;
      v18 = *(void **)(a2 - 48);
      if (v18)
      {
        *(_QWORD *)(a2 - 40) = v18;
        operator delete(v18);
        *(_QWORD *)(a2 - 48) = 0;
        *(_QWORD *)(a2 - 40) = 0;
        *(_QWORD *)(a2 - 32) = 0;
      }
      *(_QWORD *)(a2 - 48) = v28;
      *(_QWORD *)(a2 - 40) = v27;
      *(_QWORD *)(a2 - 32) = v26;
      v19 = *(void **)(a2 - 24);
      if (v19)
      {
        *(_QWORD *)(a2 - 16) = v19;
        operator delete(v19);
        *(_QWORD *)(a2 - 24) = 0;
        *(_QWORD *)(a2 - 16) = 0;
        *(_QWORD *)(a2 - 8) = 0;
      }
      *(_QWORD *)(a2 - 24) = v24;
      *(_QWORD *)(a2 - 16) = v12;
      *(_QWORD *)(a2 - 8) = v13;
      std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(a1, v16, a3, 0xCCCCCCCCCCCCCCCDLL * ((v16 - a1) >> 4));
    }
  }
}

void sub_1A36B1EB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  ME_Model::Sample::~Sample((ME_Model::Sample *)va);
  _Unwind_Resume(a1);
}

uint64_t std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(_DWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = 0;
  v6 = a3 - 2;
  if (a3 < 2)
    v6 = a3 - 1;
  v7 = v6 >> 1;
  do
  {
    v8 = (uint64_t)&a1[20 * v5 + 20];
    v9 = (2 * v5) | 1;
    v10 = 2 * v5 + 2;
    if (v10 < a3 && ME_Model::Sample::operator<((uint64_t)&a1[20 * v5 + 20], (uint64_t)&a1[20 * v5 + 40]))
    {
      v8 += 80;
      v9 = v10;
    }
    *a1 = *(_DWORD *)v8;
    std::vector<double>::__move_assign((uint64_t)(a1 + 2), (__n128 *)(v8 + 8));
    std::vector<double>::__move_assign((uint64_t)(a1 + 8), (__n128 *)(v8 + 32));
    std::vector<double>::__move_assign((uint64_t)(a1 + 14), (__n128 *)(v8 + 56));
    a1 = (_DWORD *)v8;
    v5 = v9;
  }
  while (v9 <= v7);
  return v8;
}

void std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,std::__less<void,void> &,ME_Model::Sample *>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v8;
  uint64_t v9;
  _DWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18[2];
  uint64_t v19;
  void *__p[2];
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  if (a4 >= 2)
  {
    v24 = v4;
    v25 = v5;
    v8 = (unint64_t)(a4 - 2) >> 1;
    v9 = a1 + 80 * v8;
    v10 = (_DWORD *)(a2 - 80);
    if (ME_Model::Sample::operator<(v9, a2 - 80))
    {
      v17 = *(_DWORD *)(a2 - 80);
      *(_OWORD *)v18 = *(_OWORD *)(a2 - 72);
      v19 = *(_QWORD *)(a2 - 56);
      *(_QWORD *)(a2 - 72) = 0;
      *(_QWORD *)(a2 - 64) = 0;
      *(_OWORD *)__p = *(_OWORD *)(a2 - 48);
      v21 = *(_QWORD *)(a2 - 32);
      *(_QWORD *)(a2 - 56) = 0;
      *(_QWORD *)(a2 - 48) = 0;
      *(_QWORD *)(a2 - 40) = 0;
      *(_QWORD *)(a2 - 32) = 0;
      v22 = *(_OWORD *)(a2 - 24);
      v23 = *(_QWORD *)(a2 - 8);
      *(_QWORD *)(a2 - 16) = 0;
      *(_QWORD *)(a2 - 8) = 0;
      *(_QWORD *)(a2 - 24) = 0;
      do
      {
        v11 = v9;
        v12 = (_QWORD *)(v9 + 56);
        *v10 = *(_DWORD *)v9;
        v13 = (_QWORD *)(v9 + 8);
        std::vector<double>::__move_assign((uint64_t)(v10 + 2), (__n128 *)(v9 + 8));
        std::vector<double>::__move_assign((uint64_t)(v10 + 8), (__n128 *)(v9 + 32));
        std::vector<double>::__move_assign((uint64_t)(v10 + 14), (__n128 *)(v9 + 56));
        if (!v8)
          break;
        v8 = (v8 - 1) >> 1;
        v9 = a1 + 80 * v8;
        v10 = (_DWORD *)v11;
      }
      while ((ME_Model::Sample::operator<(v9, (uint64_t)&v17) & 1) != 0);
      *(_DWORD *)v11 = v17;
      v14 = *(void **)(v11 + 8);
      if (v14)
      {
        *(_QWORD *)(v11 + 16) = v14;
        operator delete(v14);
        *v13 = 0;
        *(_QWORD *)(v11 + 16) = 0;
        *(_QWORD *)(v11 + 24) = 0;
      }
      *(_OWORD *)(v11 + 8) = *(_OWORD *)v18;
      *(_QWORD *)(v11 + 24) = v19;
      v18[1] = 0;
      v19 = 0;
      v18[0] = 0;
      v15 = *(void **)(v11 + 32);
      if (v15)
      {
        *(_QWORD *)(v11 + 40) = v15;
        operator delete(v15);
        *(_QWORD *)(v11 + 32) = 0;
        *(_QWORD *)(v11 + 40) = 0;
        *(_QWORD *)(v11 + 48) = 0;
      }
      *(_OWORD *)(v11 + 32) = *(_OWORD *)__p;
      *(_QWORD *)(v11 + 48) = v21;
      __p[1] = 0;
      v21 = 0;
      __p[0] = 0;
      v16 = *(void **)(v11 + 56);
      if (v16)
      {
        *(_QWORD *)(v11 + 64) = v16;
        operator delete(v16);
        *v12 = 0;
        v12[1] = 0;
        v12[2] = 0;
        v16 = __p[0];
      }
      *(_OWORD *)(v11 + 56) = v22;
      *(_QWORD *)(v11 + 72) = v23;
      v23 = 0;
      v22 = 0uLL;
      if (v16)
      {
        __p[1] = v16;
        operator delete(v16);
      }
      if (v18[0])
      {
        v18[1] = v18[0];
        operator delete(v18[0]);
      }
    }
  }
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

std::string *std::pair<std::string,std::string>::pair[abi:ne180100]<std::string&,std::string&,0>(std::string *this, __int128 *a2, __int128 *a3)
{
  __int128 v5;
  std::string *v6;
  __int128 v7;

  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v5 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v5;
  }
  v6 = this + 1;
  if (*((char *)a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v6, *(const std::string::value_type **)a3, *((_QWORD *)a3 + 1));
  }
  else
  {
    v7 = *a3;
    this[1].__r_.__value_.__r.__words[2] = *((_QWORD *)a3 + 2);
    *(_OWORD *)&v6->__r_.__value_.__l.__data_ = v7;
  }
  return this;
}

void sub_1A36B221C(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

void std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::clear(uint64_t a1)
{
  uint64_t v2;
  uint64_t i;

  if (*(_QWORD *)(a1 + 24))
  {
    std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
    *(_QWORD *)(a1 + 16) = 0;
    v2 = *(_QWORD *)(a1 + 8);
    if (v2)
    {
      for (i = 0; i != v2; ++i)
        *(_QWORD *)(*(_QWORD *)a1 + 8 * i) = 0;
    }
    *(_QWORD *)(a1 + 24) = 0;
  }
}

void std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__deallocate_node(int a1, void **__p)
{
  void **v2;
  void **v3;

  if (__p)
  {
    v2 = __p;
    do
    {
      v3 = (void **)*v2;
      if (*((char *)v2 + 39) < 0)
        operator delete(v2[2]);
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

void std::vector<std::vector<int>>::__clear[abi:ne180100](uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = *a1;
  v2 = a1[1];
  if (v2 != *a1)
  {
    v4 = a1[1];
    do
    {
      v6 = *(void **)(v4 - 24);
      v4 -= 24;
      v5 = v6;
      if (v6)
      {
        *(_QWORD *)(v2 - 16) = v5;
        operator delete(v5);
      }
      v2 = v4;
    }
    while (v4 != v3);
  }
  a1[1] = v3;
}

_QWORD *std::string::basic_string[abi:ne180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

_QWORD *std::vector<std::vector<int>>::__construct_one_at_end[abi:ne180100]<std::vector<int> const&>(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  _QWORD *result;

  v3 = *(_QWORD **)(a1 + 8);
  *v3 = 0;
  v3[1] = 0;
  v3[2] = 0;
  result = std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(v3, *(const void **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 2);
  *(_QWORD *)(a1 + 8) = v3 + 3;
  return result;
}

void sub_1A36B241C(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v1 + 8) = v2;
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::vector<int>>::__push_back_slow_path<std::vector<int> const&>(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;
  _QWORD v14[2];
  char *v15;
  char *v16;
  uint64_t *v17;

  v3 = *a1;
  v4 = 0xAAAAAAAAAAAAAAABLL * ((a1[1] - *a1) >> 3);
  v5 = v4 + 1;
  if (v4 + 1 > 0xAAAAAAAAAAAAAAALL)
    std::vector<double>::__throw_length_error[abi:ne180100]();
  v7 = (uint64_t)(a1 + 2);
  v8 = 0xAAAAAAAAAAAAAAABLL * ((a1[2] - v3) >> 3);
  if (2 * v8 > v5)
    v5 = 2 * v8;
  if (v8 >= 0x555555555555555)
    v9 = 0xAAAAAAAAAAAAAAALL;
  else
    v9 = v5;
  v17 = a1 + 2;
  if (v9)
    v10 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>(v7, v9);
  else
    v10 = 0;
  v11 = &v10[24 * v4];
  v14[0] = v10;
  v14[1] = v11;
  v15 = v11;
  v16 = &v10[24 * v9];
  *(_QWORD *)v11 = 0;
  *((_QWORD *)v11 + 1) = 0;
  *((_QWORD *)v11 + 2) = 0;
  std::vector<int>::__init_with_size[abi:ne180100]<int *,int *>(v11, *(const void **)a2, *(_QWORD *)(a2 + 8), (uint64_t)(*(_QWORD *)(a2 + 8) - *(_QWORD *)a2) >> 2);
  v15 += 24;
  std::vector<std::vector<int>>::__swap_out_circular_buffer(a1, v14);
  v12 = a1[1];
  std::__split_buffer<std::vector<int>>::~__split_buffer((uint64_t)v14);
  return v12;
}

void sub_1A36B2524(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::__split_buffer<std::vector<int>>::~__split_buffer((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::vector<int>>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<int>>,std::reverse_iterator<std::vector<int>*>,std::reverse_iterator<std::vector<int>*>,std::reverse_iterator<std::vector<int>*>>((uint64_t)(a1 + 2), a1[1], (_QWORD *)a1[1], *a1, (_QWORD *)*a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::vector<int>>,std::reverse_iterator<std::vector<int>*>,std::reverse_iterator<std::vector<int>*>,std::reverse_iterator<std::vector<int>*>>(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  _QWORD v11[3];
  char v12;
  __int128 v13;
  __int128 v14;

  v7 = a7;
  *(_QWORD *)&v14 = a6;
  *((_QWORD *)&v14 + 1) = a7;
  v13 = v14;
  v11[0] = a1;
  v11[1] = &v13;
  v11[2] = &v14;
  if (a3 == a5)
  {
    v9 = a6;
  }
  else
  {
    do
    {
      *(_QWORD *)(v7 - 24) = 0;
      *(_QWORD *)(v7 - 16) = 0;
      *(_QWORD *)(v7 - 8) = 0;
      v8 = *(_OWORD *)(a3 - 3);
      a3 -= 3;
      *(_OWORD *)(v7 - 24) = v8;
      *(_QWORD *)(v7 - 8) = a3[2];
      *a3 = 0;
      a3[1] = 0;
      a3[2] = 0;
      v7 = *((_QWORD *)&v14 + 1) - 24;
      *((_QWORD *)&v14 + 1) -= 24;
    }
    while (a3 != a5);
    v9 = v14;
  }
  v12 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<int>>,std::reverse_iterator<std::vector<int>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v11);
  return v9;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<int>>,std::reverse_iterator<std::vector<int>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<int>>,std::reverse_iterator<std::vector<int>*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::vector<int>>,std::reverse_iterator<std::vector<int>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    v3 = *(void **)v1;
    if (*(_QWORD *)v1)
    {
      *(_QWORD *)(v1 + 8) = v3;
      operator delete(v3);
    }
    v1 += 24;
  }
}

uint64_t std::__split_buffer<std::vector<int>>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<std::vector<int>>::__destruct_at_end[abi:ne180100](a1, *(_QWORD *)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__split_buffer<std::vector<int>>::__destruct_at_end[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v5;

  v2 = *(_QWORD *)(a1 + 16);
  while (v2 != a2)
  {
    v5 = *(void **)(v2 - 24);
    *(_QWORD *)(a1 + 16) = v2 - 24;
    if (v5)
    {
      *(_QWORD *)(v2 - 16) = v5;
      operator delete(v5);
      v2 = *(_QWORD *)(a1 + 16);
    }
    else
    {
      v2 -= 24;
    }
  }
}

_QWORD *std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = std::vector<double>::__vallocate[abi:ne180100](result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1A36B27AC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::~__hash_table(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  v2 = *(_QWORD **)(a1 + 16);
  if (v2)
  {
    do
    {
      v3 = (_QWORD *)*v2;
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
  v4 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v4)
    operator delete(v4);
  return a1;
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::__emplace_unique_key_args<unsigned int,std::piecewise_construct_t const&,std::tuple<unsigned int &&>,std::tuple<>>(uint64_t a1, unsigned int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  void **v10;
  _QWORD *v11;
  unint64_t v12;
  float v13;
  float v14;
  _BOOL8 v15;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;

  v7 = *a2;
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v8 <= v7)
        v4 = v7 % v8;
    }
    else
    {
      v4 = ((_DWORD)v8 - 1) & v7;
    }
    v10 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v10)
    {
      v11 = *v10;
      if (*v10)
      {
        do
        {
          v12 = v11[1];
          if (v12 == v7)
          {
            if (*((_DWORD *)v11 + 4) == (_DWORD)v7)
              return v11;
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8)
                v12 %= v8;
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4)
              break;
          }
          v11 = (_QWORD *)*v11;
        }
        while (v11);
      }
    }
  }
  v11 = operator new(0x18uLL);
  *v11 = 0;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  *((_DWORD *)v11 + 5) = 0;
  v13 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    v15 = 1;
    if (v8 >= 3)
      v15 = (v8 & (v8 - 1)) != 0;
    v16 = v15 | (2 * v8);
    v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17)
      v18 = v17;
    else
      v18 = v16;
    std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__rehash<true>(a1, v18);
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7)
        v4 = v7 % v8;
      else
        v4 = v7;
    }
    else
    {
      v4 = ((_DWORD)v8 - 1) & v7;
    }
  }
  v19 = *(_QWORD *)a1;
  v20 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v20)
  {
    *v11 = *v20;
LABEL_38:
    *v20 = v11;
    goto LABEL_39;
  }
  *v11 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v11;
  *(_QWORD *)(v19 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    v21 = *(_QWORD *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8)
        v21 %= v8;
    }
    else
    {
      v21 &= v8 - 1;
    }
    v20 = (_QWORD *)(*(_QWORD *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v11;
}

void sub_1A36B2B1C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::clear(_QWORD *result)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t i;

  if (result[3])
  {
    v1 = result;
    result = (_QWORD *)result[2];
    if (result)
    {
      do
      {
        v2 = (_QWORD *)*result;
        operator delete(result);
        result = v2;
      }
      while (v2);
    }
    v1[2] = 0;
    v3 = v1[1];
    if (v3)
    {
      for (i = 0; i != v3; ++i)
        *(_QWORD *)(*v1 + 8 * i) = 0;
    }
    v1[3] = 0;
  }
  return result;
}

void std::__list_imp<std::pair<std::pair<std::string,std::string>,double>>::clear(uint64_t *a1)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v5;

  if (a1[2])
  {
    v2 = *a1;
    v3 = (uint64_t *)a1[1];
    v4 = *v3;
    *(_QWORD *)(v4 + 8) = *(_QWORD *)(*a1 + 8);
    **(_QWORD **)(v2 + 8) = v4;
    a1[2] = 0;
    if (v3 != a1)
    {
      do
      {
        v5 = (uint64_t *)v3[1];
        std::__destroy_at[abi:ne180100]<std::pair<std::pair<std::string,std::string>,double>,0>((uint64_t)(v3 + 2));
        operator delete(v3);
        v3 = v5;
      }
      while (v5 != a1);
    }
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::pair<std::string,std::string>,double>,0>(uint64_t a1)
{
  if (*(char *)(a1 + 47) < 0)
    operator delete(*(void **)(a1 + 24));
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

uint64_t modelMethodTypeForImplClass(void *a1)
{
  if ((objc_msgSend(a1, "isEqual:", objc_opt_class()) & 1) != 0
    || (objc_msgSend(a1, "isEqual:", objc_opt_class()) & 1) != 0)
  {
    return 4;
  }
  if ((objc_msgSend(a1, "isEqual:", objc_opt_class()) & 1) != 0)
    return 2;
  if ((objc_msgSend(a1, "isEqual:", objc_opt_class()) & 1) != 0)
    return 1;
  if ((objc_msgSend(a1, "isEqual:", objc_opt_class()) & 1) != 0)
    return 9;
  if ((objc_msgSend(a1, "isEqual:", objc_opt_class()) & 1) != 0)
    return 0;
  if ((objc_msgSend(a1, "isEqual:", objc_opt_class()) & 1) != 0)
    return 6;
  if ((objc_msgSend(a1, "isEqual:", objc_opt_class()) & 1) != 0)
    return 7;
  if (objc_msgSend(a1, "isEqual:", objc_opt_class()))
    return 8;
  return 4;
}

id stringArrayRepresentationFromData(void *a1)
{
  id v1;
  const char *v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  size_t v6;
  void *v7;

  v1 = objc_retainAutorelease(a1);
  v2 = (const char *)objc_msgSend(v1, "bytes");
  v3 = objc_msgSend(v1, "length");
  if ((unint64_t)v3 < 9
    || strncmp(v2, "bplist00", 8uLL)
    || (objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v1, 0, 0, 0),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 >= 1)
    {
      v5 = &v2[v3];
      do
      {
        v6 = strnlen(v2, v5 - v2);
        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v2, v6, 4);
        if (v7)
          objc_msgSend(v4, "addObject:", v7);
        v2 += v6 + 1;

      }
      while (v2 < v5);
    }
  }

  return v4;
}

id stringArrayRepresentationFromInverseMap(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  __CFString *v12;
  const __CFString *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v1, "allKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v3);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "unsignedIntegerValue");
        if (v9 > v6)
          v6 = v9;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  v10 = 0;
  do
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "objectForKey:", v11);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if (v12)
      v13 = v12;
    else
      v13 = &stru_1E4A3BA10;
    objc_msgSend(v2, "addObject:", v13);

    ++v10;
  }
  while (v10 <= v6);

  return v2;
}

id dataFromStringArrayRepresentation(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  const char *v7;
  id v8;
  char *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  id v15;
  const char *v16;
  const char *v17;
  size_t v18;
  char *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v26 != v5)
          objc_enumerationMutation(v1);
        v7 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i)), "UTF8String");
        if (v7)
          v4 += strlen(v7) + 1;
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", v4);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (char *)objc_msgSend(v8, "mutableBytes");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = v1;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j));
        v16 = (const char *)objc_msgSend(v15, "UTF8String", (_QWORD)v21);
        if (v16)
        {
          v17 = v16;
          v18 = strlen(v16);
          strncpy(v9, v17, v18);
          v19 = &v9[v18];
          *v19 = 0;
          v9 = v19 + 1;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v12);
  }

  return v8;
}

void sub_1A36B5378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_1A36B54D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t isAcceptableTokenArray(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (v1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && objc_msgSend(v1, "count"))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v2 = v1;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v10;
      while (2)
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v10 != v5)
            objc_enumerationMutation(v2);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v7 = 0;
            goto LABEL_16;
          }
          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        if (v4)
          continue;
        break;
      }
    }
    v7 = 1;
LABEL_16:

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void sub_1A36B5880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A36B59FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A36B5C14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MurmurHash3_x86_32(uint64_t result, int a2, int a3, unsigned int *a4)
{
  int v4;
  unsigned __int8 *v5;
  uint64_t v6;
  unint64_t v7;
  int v9;
  int v10;
  unsigned int v11;

  if (a2 >= 0)
    v4 = a2;
  else
    v4 = a2 + 3;
  v5 = (unsigned __int8 *)(result + (int)(v4 & 0xFFFFFFFC));
  if ((a2 + 3) >= 7)
  {
    v6 = -(v4 >> 2);
    do
    {
      HIDWORD(v7) = (461845907
                   * ((380141568 * *(_DWORD *)&v5[4 * v6]) | ((-862048943 * *(_DWORD *)&v5[4 * v6]) >> 17))) ^ a3;
      LODWORD(v7) = HIDWORD(v7);
      a3 = 5 * (v7 >> 19) - 430675100;
    }
    while (!__CFADD__(v6++, 1));
  }
  v9 = 0;
  v10 = a2 & 3;
  switch(v10)
  {
    case 1:
      goto LABEL_13;
    case 2:
LABEL_12:
      v9 |= v5[1] << 8;
LABEL_13:
      a3 ^= 461845907 * ((380141568 * (v9 ^ *v5)) | ((-862048943 * (v9 ^ *v5)) >> 17));
      break;
    case 3:
      v9 = v5[2] << 16;
      goto LABEL_12;
  }
  v11 = -2048144789 * (a3 ^ a2 ^ ((a3 ^ a2) >> 16));
  *a4 = (-1028477387 * (v11 ^ (v11 >> 13))) ^ ((-1028477387 * (v11 ^ (v11 >> 13))) >> 16);
  return result;
}

uint64_t MurmurHash3_x86_128(char *a1, int a2, int a3, int *a4)
{
  int v4;
  unsigned __int8 *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  int v12;
  int v13;
  int v14;
  unint64_t v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  uint64_t result;
  int v26;
  int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  int v34;
  unsigned int v35;
  int v36;
  unsigned int v37;
  int v38;
  int v39;

  if (a2 >= 0)
    v4 = a2;
  else
    v4 = a2 + 15;
  v5 = (unsigned __int8 *)&a1[v4 & 0xFFFFFFF0];
  if ((a2 + 15) >= 0x1F)
  {
    v9 = v4 >> 4;
    v10 = v4 >> 4;
    v8 = a3;
    v7 = a3;
    v6 = a3;
    v11 = -4 * v9;
    do
    {
      v12 = *(_DWORD *)&v5[4 * v11 + 4];
      v13 = *(_DWORD *)&v5[4 * v11 + 8];
      v14 = *(_DWORD *)&v5[4 * v11 + 12];
      HIDWORD(v15) = (-1425107063
                    * ((-888307712 * *(_DWORD *)&v5[4 * v11]) | ((597399067 * *(_DWORD *)&v5[4 * v11]) >> 17))) ^ a3;
      LODWORD(v15) = HIDWORD(v15);
      a3 = 5 * ((v15 >> 13) + v8) + 1444728091;
      HIDWORD(v15) = (951274213 * ((-1752629248 * v12) | ((-1425107063 * v12) >> 16))) ^ v8;
      LODWORD(v15) = HIDWORD(v15);
      v8 = 5 * ((v15 >> 15) + v7) + 197830471;
      HIDWORD(v15) = (-1578923117 * ((-1781923840 * v13) | ((951274213 * v13) >> 15))) ^ v7;
      LODWORD(v15) = HIDWORD(v15);
      v16 = 5 * ((v15 >> 17) + v6);
      HIDWORD(v15) = (597399067 * ((776732672 * v14) | ((-1578923117 * v14) >> 14))) ^ v6;
      LODWORD(v15) = HIDWORD(v15);
      v7 = v16 - 1764942795;
      v6 = 5 * ((v15 >> 19) + a3) + 850148119;
      v11 += 4;
      --v10;
    }
    while (v10);
  }
  else
  {
    v6 = a3;
    v7 = a3;
    v8 = a3;
  }
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  v21 = 0;
  v22 = 0;
  v23 = 0;
  v24 = 0;
  result = 0;
  v26 = 0;
  v27 = 0;
  switch(a2 & 0xF)
  {
    case 1:
      goto LABEL_23;
    case 2:
      goto LABEL_22;
    case 3:
      goto LABEL_21;
    case 4:
      goto LABEL_20;
    case 5:
      goto LABEL_19;
    case 6:
      goto LABEL_18;
    case 7:
      goto LABEL_17;
    case 8:
      goto LABEL_16;
    case 9:
      goto LABEL_15;
    case 0xA:
      goto LABEL_14;
    case 0xB:
      goto LABEL_13;
    case 0xC:
      goto LABEL_12;
    case 0xD:
      goto LABEL_11;
    case 0xE:
      goto LABEL_10;
    case 0xF:
      v17 = v5[14] << 16;
LABEL_10:
      v18 = v17 | (v5[13] << 8);
LABEL_11:
      v6 ^= 597399067 * ((776732672 * (v18 ^ v5[12])) | ((-1578923117 * (v18 ^ v5[12])) >> 14));
LABEL_12:
      v19 = v5[11] << 24;
LABEL_13:
      v20 = v19 | (v5[10] << 16);
LABEL_14:
      v21 = v20 ^ (v5[9] << 8);
LABEL_15:
      v7 ^= -1578923117 * ((-1781923840 * (v21 ^ v5[8])) | ((951274213 * (v21 ^ v5[8])) >> 15));
LABEL_16:
      v22 = v5[7] << 24;
LABEL_17:
      v23 = v22 | (v5[6] << 16);
LABEL_18:
      v24 = v23 ^ (v5[5] << 8);
LABEL_19:
      v8 ^= 951274213 * ((-1752629248 * (v24 ^ v5[4])) | ((-1425107063 * (v24 ^ v5[4])) >> 16));
LABEL_20:
      result = v5[3] << 24;
LABEL_21:
      v26 = result | (v5[2] << 16);
LABEL_22:
      v27 = v26 ^ (v5[1] << 8);
LABEL_23:
      a3 ^= -1425107063 * ((-888307712 * (v27 ^ *v5)) | ((597399067 * (v27 ^ *v5)) >> 17));
      break;
    default:
      break;
  }
  v28 = (v7 ^ a2) + (v6 ^ a2) + (v8 ^ a2) + (a3 ^ a2);
  v29 = v28 + (v8 ^ a2);
  v30 = v28 + (v7 ^ a2);
  v31 = v28 + (v6 ^ a2);
  v32 = -1028477387 * ((-2048144789 * (v28 ^ HIWORD(v28))) ^ ((-2048144789 * (v28 ^ HIWORD(v28))) >> 13));
  v33 = -1028477387 * ((-2048144789 * (v29 ^ HIWORD(v29))) ^ ((-2048144789 * (v29 ^ HIWORD(v29))) >> 13));
  v34 = v33 ^ HIWORD(v33);
  v35 = -1028477387 * ((-2048144789 * (v30 ^ HIWORD(v30))) ^ ((-2048144789 * (v30 ^ HIWORD(v30))) >> 13));
  v36 = v35 ^ HIWORD(v35);
  v37 = -1028477387 * ((-2048144789 * (v31 ^ HIWORD(v31))) ^ ((-2048144789 * (v31 ^ HIWORD(v31))) >> 13));
  v38 = v37 ^ HIWORD(v37);
  v39 = v34 + (v32 ^ HIWORD(v32)) + v36 + v38;
  *a4 = v39;
  a4[1] = v39 + v34;
  a4[2] = v39 + v36;
  a4[3] = v39 + v38;
  return result;
}

uint64_t MurmurHash3_x64_128(uint64_t result, int a2, unsigned int a3, unint64_t *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unsigned __int8 *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;

  v4 = a3;
  if (a2 < 16)
  {
    v7 = a3;
  }
  else
  {
    v5 = (_QWORD *)(result + 8);
    v6 = (a2 / 16);
    v7 = v4;
    do
    {
      v4 = 5
         * (__ROR8__((0x4CF5AD432745937FLL * ((0x88A129EA80000000 * *(v5 - 1)) | ((0x87C37B91114253D5 * *(v5 - 1)) >> 33))) ^ v4, 37)+ v7)+ 1390208809;
      v7 = 5
         * (v4
          + __ROR8__((0x87C37B91114253D5* ((0x4E8B26FE00000000 * *v5) | ((unint64_t)(0x4CF5AD432745937FLL * *v5) >> 31))) ^ v7, 33))+ 944331445;
      v5 += 2;
      --v6;
    }
    while (v6);
  }
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  v15 = 0;
  v16 = 0;
  v17 = 0;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  v21 = (unsigned __int8 *)(result + 16 * (a2 / 16));
  switch(a2 & 0xF)
  {
    case 1:
      goto LABEL_21;
    case 2:
      goto LABEL_20;
    case 3:
      goto LABEL_19;
    case 4:
      goto LABEL_18;
    case 5:
      goto LABEL_17;
    case 6:
      goto LABEL_16;
    case 7:
      goto LABEL_15;
    case 8:
      goto LABEL_14;
    case 9:
      goto LABEL_13;
    case 0xA:
      goto LABEL_12;
    case 0xB:
      goto LABEL_11;
    case 0xC:
      goto LABEL_10;
    case 0xD:
      goto LABEL_9;
    case 0xE:
      goto LABEL_8;
    case 0xF:
      v8 = (unint64_t)v21[14] << 48;
LABEL_8:
      v9 = v8 | ((unint64_t)v21[13] << 40);
LABEL_9:
      v10 = v9 ^ ((unint64_t)v21[12] << 32);
LABEL_10:
      v11 = v10 ^ ((unint64_t)v21[11] << 24);
LABEL_11:
      v12 = v11 ^ ((unint64_t)v21[10] << 16);
LABEL_12:
      v13 = v12 ^ ((unint64_t)v21[9] << 8);
LABEL_13:
      v7 ^= 0x87C37B91114253D5
          * ((0x4E8B26FE00000000 * (v13 ^ v21[8])) | ((0x4CF5AD432745937FLL * (v13 ^ v21[8])) >> 31));
LABEL_14:
      v14 = (unint64_t)v21[7] << 56;
LABEL_15:
      v15 = v14 | ((unint64_t)v21[6] << 48);
LABEL_16:
      v16 = v15 ^ ((unint64_t)v21[5] << 40);
LABEL_17:
      v17 = v16 ^ ((unint64_t)v21[4] << 32);
LABEL_18:
      v18 = v17 ^ ((unint64_t)v21[3] << 24);
LABEL_19:
      v19 = v18 ^ ((unint64_t)v21[2] << 16);
LABEL_20:
      v20 = v19 ^ ((unint64_t)v21[1] << 8);
LABEL_21:
      v4 ^= 0x4CF5AD432745937FLL
          * ((0x88A129EA80000000 * (v20 ^ *v21)) | ((0x87C37B91114253D5 * (v20 ^ *v21)) >> 33));
      break;
    default:
      break;
  }
  v22 = v7 ^ a2;
  v23 = (v4 ^ a2) + v22;
  v24 = v23 + v22;
  v25 = 0xC4CEB9FE1A85EC53
      * ((0xFF51AFD7ED558CCDLL * (v23 ^ (v23 >> 33))) ^ ((0xFF51AFD7ED558CCDLL * (v23 ^ (v23 >> 33))) >> 33));
  v26 = 0xC4CEB9FE1A85EC53
      * ((0xFF51AFD7ED558CCDLL * (v24 ^ (v24 >> 33))) ^ ((0xFF51AFD7ED558CCDLL * (v24 ^ (v24 >> 33))) >> 33));
  v27 = v26 ^ (v26 >> 33);
  v28 = v27 + (v25 ^ (v25 >> 33));
  *a4 = v28;
  a4[1] = v28 + v27;
  return result;
}

uint64_t ME_Model::perform_SGD(ME_Model *this)
{
  double v2;
  uint64_t v3;
  std::vector<int>::pointer begin;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  double v8;
  double *v9;
  double *v10;
  double *v11;
  uint64_t v12;
  double *v13;
  double *v14;
  uint64_t v15;
  int v16;
  int v17;
  double v18;
  unsigned int v19;
  uint64_t i;
  uint64_t v21;
  unint64_t v22;
  int v23;
  double v24;
  double *v25;
  double v26;
  double *v27;
  double *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  unint64_t v32;
  char *v33;
  double *v34;
  uint64_t v35;
  int v36;
  double *v37;
  uint64_t v38;
  int *v39;
  int *v40;
  double v41;
  uint64_t v42;
  double *v43;
  int **v44;
  int *v45;
  int *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  double v52;
  double v53;
  uint64_t v54;
  double *v55;
  int *v56;
  uint64_t v57;
  double *v58;
  int **v59;
  int *v60;
  int *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  double v66;
  double v67;
  double v68;
  _QWORD *v70;
  int v71;
  void *v72[3];
  std::vector<int>::value_type __x[624];
  uint64_t v74;
  std::random_device v75;
  void *__p;
  double *v77;
  double *v78;
  std::vector<int> v79;
  void *v80[3];
  void *v81[3];
  std::vector<int> v82;

  if (*((double *)this + 5) > 0.0)
  {
    v70 = std::operator<<[abi:ne180100]<std::char_traits<char>>(MEMORY[0x1E0DE4A50], "error: L2 regularization is currently not supported in SGD mode.");
    std::endl[abi:ne180100]<char,std::char_traits<char>>(v70);
    exit(1);
  }
  v2 = *((double *)this + 4);
  v3 = *((_QWORD *)this + 33) - *((_QWORD *)this + 32);
  std::vector<int>::vector(&v82, 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((_QWORD *)this + 7) - *((_QWORD *)this + 6)) >> 4));
  begin = v82.__begin_;
  if (v82.__end_ != v82.__begin_)
  {
    v5 = 0;
    v6 = v82.__end_ - v82.__begin_;
    if (v6 <= 1)
      v6 = 1;
    do
    {
      begin[v5] = v5;
      ++v5;
    }
    while (v6 != v5);
  }
  v7 = (int)(v3 >> 2);
  std::vector<double>::vector(v81, v7);
  v8 = *((double *)this + 1);
  *(_QWORD *)__x = 0;
  std::vector<double>::vector(v80, v7, __x);
  __x[0] = 0;
  std::vector<int>::vector(&v79, v7, __x);
  v77 = 0;
  __p = 0;
  v78 = 0;
  v9 = (double *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v78, 1uLL);
  v10 = v77;
  v11 = (double *)__p;
  v13 = &v9[v12];
  *v9 = 0.0;
  v14 = v9 + 1;
  while (v10 != v11)
  {
    v15 = *((_QWORD *)v10-- - 1);
    *((_QWORD *)v9-- - 1) = v15;
  }
  __p = v9;
  v77 = v14;
  v78 = v13;
  if (v11)
    operator delete(v11);
  v77 = v14;
  if (*((int *)this + 1) >= 1)
  {
    v16 = 0;
    v17 = 0;
    v18 = 0.0;
    while (1)
    {
      std::random_device::random_device[abi:ne180100](&v75);
      v19 = MEMORY[0x1A8592ADC](&v75);
      __x[0] = v19;
      for (i = 1; i != 624; ++i)
      {
        v19 = i + 1812433253 * (v19 ^ (v19 >> 30));
        __x[i] = v19;
      }
      v74 = 0;
      std::__shuffle[abi:ne180100]<std::_ClassicAlgPolicy,std::__wrap_iter<int *>,std::__wrap_iter<int *>,std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u> &>((unint64_t)v82.__begin_, (uint64_t)v82.__end_, (uint64_t)__x);
      v71 = v17;
      v21 = *((_QWORD *)this + 6);
      if (*((_QWORD *)this + 7) != v21)
        break;
LABEL_64:
      if (*((int *)this + 100) > 0)
        ME_Model::heldout_likelihood(this);
      std::random_device::~random_device(&v75);
      v17 = v71 + 1;
      if (v71 + 1 >= *((_DWORD *)this + 1))
        goto LABEL_67;
    }
    v22 = 0;
    while (1)
    {
      v23 = v82.__begin_[v22];
      std::vector<double>::vector(v72, *((int *)this + 70));
      ME_Model::conditional_probability((uint64_t)this, (_QWORD *)(v21 + 80 * v23), (double **)v72);
      v24 = v8
          * pow(*((long double *)this + 2), (double)v16/ (double)(0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((_QWORD *)this + 7) - *((_QWORD *)this + 6)) >> 4)));
      v25 = v77;
      v26 = *(v77 - 1) + v24 * v2;
      if (v77 >= v78)
      {
        v28 = (double *)__p;
        v29 = ((char *)v77 - (_BYTE *)__p) >> 3;
        v30 = v29 + 1;
        if ((unint64_t)(v29 + 1) >> 61)
          std::vector<double>::__throw_length_error[abi:ne180100]();
        v31 = (char *)v78 - (_BYTE *)__p;
        if (((char *)v78 - (_BYTE *)__p) >> 2 > v30)
          v30 = v31 >> 2;
        if ((unint64_t)v31 >= 0x7FFFFFFFFFFFFFF8)
          v32 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v32 = v30;
        if (v32)
        {
          v33 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v78, v32);
          v25 = v77;
          v28 = (double *)__p;
        }
        else
        {
          v33 = 0;
        }
        v34 = (double *)&v33[8 * v29];
        *v34 = v26;
        v27 = v34 + 1;
        while (v25 != v28)
        {
          v35 = *((_QWORD *)v25-- - 1);
          *((_QWORD *)v34-- - 1) = v35;
        }
        __p = v34;
        v77 = v27;
        v78 = (double *)&v33[8 * v32];
        if (v28)
          operator delete(v28);
      }
      else
      {
        *v77 = v26;
        v27 = v25 + 1;
      }
      v18 = v18 + v24 * v2;
      v77 = v27;
      v36 = *(_DWORD *)(v21 + 80 * v23);
      v37 = (double *)v72[0];
      v38 = v21 + 80 * v23;
      v39 = *(int **)(v38 + 8);
      v40 = *(int **)(v38 + 16);
      v41 = -v24;
      if (v39 != v40)
        break;
LABEL_47:
      v54 = v21 + 80 * v23;
      v55 = *(double **)(v54 + 32);
      v56 = *(int **)(v54 + 40);
      if (v55 != (double *)v56)
      {
        v57 = *((_QWORD *)this + 42);
        v58 = (double *)v80[0];
        while (1)
        {
          v59 = (int **)(v57 + 24 * *(int *)v55);
          v60 = *v59;
          v61 = v59[1];
          if (v60 != v61)
            break;
LABEL_60:
          v55 += 2;
          if (v55 == (double *)v56)
            goto LABEL_61;
        }
        v62 = *((_QWORD *)this + 32);
        v63 = *((_QWORD *)this + 24);
        while (2)
        {
          v64 = *v60;
          v65 = *(unsigned __int8 *)(v62 + 4 * v64);
          if ((_DWORD)v65 == v36)
            v66 = 1.0;
          else
            v66 = 0.0;
          v67 = *(double *)(v63 + 8 * v64) + v41 * (v55[1] * (v37[v65] - v66));
          *(double *)(v63 + 8 * v64) = v67;
          if (v67 > 0.0)
          {
            v68 = fmax(v67 - (v18 + v58[v64]), 0.0);
            goto LABEL_58;
          }
          v68 = v67;
          if (v67 < 0.0)
          {
            v68 = fmin(v67 + v18 - v58[v64], 0.0);
LABEL_58:
            *(double *)(v63 + 8 * v64) = v68;
          }
          v58[v64] = v58[v64] + v68 - v67;
          if (++v60 == v61)
            goto LABEL_60;
          continue;
        }
      }
LABEL_61:
      if (v37)
      {
        v72[1] = v37;
        operator delete(v37);
      }
      ++v22;
      ++v16;
      v21 = *((_QWORD *)this + 6);
      if (v22 >= 0xCCCCCCCCCCCCCCCDLL * ((*((_QWORD *)this + 7) - v21) >> 4))
        goto LABEL_64;
    }
    v42 = *((_QWORD *)this + 42);
    v43 = (double *)v80[0];
    while (1)
    {
      v44 = (int **)(v42 + 24 * *v39);
      v45 = *v44;
      v46 = v44[1];
      if (v45 != v46)
        break;
LABEL_46:
      if (++v39 == v40)
        goto LABEL_47;
    }
    v47 = *((_QWORD *)this + 32);
    v48 = *((_QWORD *)this + 24);
    while (1)
    {
      v49 = *v45;
      v50 = *(unsigned __int8 *)(v47 + 4 * v49);
      v51 = (_DWORD)v50 == v36 ? 1.0 : 0.0;
      v52 = *(double *)(v48 + 8 * v49) + v41 * (v37[v50] - v51);
      *(double *)(v48 + 8 * v49) = v52;
      if (v52 > 0.0)
        break;
      v53 = v52;
      if (v52 < 0.0)
      {
        v53 = fmin(v52 + v18 - v43[v49], 0.0);
        goto LABEL_44;
      }
LABEL_45:
      v43[v49] = v43[v49] + v53 - v52;
      if (++v45 == v46)
        goto LABEL_46;
    }
    v53 = fmax(v52 - (v18 + v43[v49]), 0.0);
LABEL_44:
    *(double *)(v48 + 8 * v49) = v53;
    goto LABEL_45;
  }
LABEL_67:
  if (__p)
  {
    v77 = (double *)__p;
    operator delete(__p);
  }
  if (v79.__begin_)
  {
    v79.__end_ = v79.__begin_;
    operator delete(v79.__begin_);
  }
  if (v80[0])
  {
    v80[1] = v80[0];
    operator delete(v80[0]);
  }
  if (v81[0])
  {
    v81[1] = v81[0];
    operator delete(v81[0]);
  }
  if (v82.__begin_)
  {
    v82.__end_ = v82.__begin_;
    operator delete(v82.__begin_);
  }
  return 0;
}

void sub_1A36B8B4C(_Unwind_Exception *a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)STACK[0xA00];
  if (STACK[0xA00])
  {
    STACK[0xA08] = (unint64_t)v3;
    operator delete(v3);
  }
  v4 = *(void **)(v1 - 248);
  if (v4)
  {
    *(_QWORD *)(v1 - 240) = v4;
    operator delete(v4);
  }
  v5 = *(void **)(v1 - 224);
  if (v5)
  {
    *(_QWORD *)(v1 - 216) = v5;
    operator delete(v5);
  }
  v6 = *(void **)(v1 - 200);
  if (v6)
  {
    *(_QWORD *)(v1 - 192) = v6;
    operator delete(v6);
  }
  v7 = *(void **)(v1 - 176);
  if (v7)
  {
    *(_QWORD *)(v1 - 168) = v7;
    operator delete(v7);
  }
  _Unwind_Resume(a1);
}

_QWORD *std::operator<<[abi:ne180100]<std::char_traits<char>>(_QWORD *a1, char *__s)
{
  size_t v4;

  v4 = strlen(__s);
  return std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(a1, (uint64_t)__s, v4);
}

_QWORD *std::endl[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1)
{
  const std::locale::facet *v2;
  std::locale v4;

  std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
  v2 = std::locale::use_facet(&v4, MEMORY[0x1E0DE4A90]);
  ((void (*)(const std::locale::facet *, uint64_t))v2->__vftable[2].~facet_0)(v2, 10);
  std::locale::~locale(&v4);
  std::ostream::put();
  std::ostream::flush();
  return a1;
}

void sub_1A36B8CAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::locale a10)
{
  std::locale::~locale(&a10);
  _Unwind_Resume(a1);
}

std::random_device *std::random_device::random_device[abi:ne180100](std::random_device *a1)
{
  std::string __token;

  std::string::basic_string[abi:ne180100]<0>(&__token, "/dev/urandom");
  std::random_device::random_device(a1, &__token);
  if (SHIBYTE(__token.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__token.__r_.__value_.__l.__data_);
  return a1;
}

void sub_1A36B8D14(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

std::vector<int> *__cdecl std::vector<int>::vector(std::vector<int> *this, std::vector<int>::size_type __n)
{
  std::vector<int>::pointer end;

  this->__begin_ = 0;
  this->__end_ = 0;
  this->__end_cap_.__value_ = 0;
  if (__n)
  {
    std::vector<int>::__vallocate[abi:ne180100](this, __n);
    end = this->__end_;
    bzero(end, 4 * __n);
    this->__end_ = &end[__n];
  }
  return this;
}

void sub_1A36B8D88(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

_QWORD *std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _BYTE v13[16];
  std::locale v14;

  MEMORY[0x1A8592AAC](v13, a1);
  if (v13[0])
  {
    v6 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *(_QWORD *)(v6 + 40);
    v8 = *(_DWORD *)(v6 + 8);
    v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v10 = std::locale::use_facet(&v14, MEMORY[0x1E0DE4A90]);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20)
      v11 = a2 + a3;
    else
      v11 = a2;
    if (!std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(v7, a2, v11, a2 + a3, v6, (char)v9))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  MEMORY[0x1A8592AB8](v13);
  return a1;
}

void sub_1A36B8EAC(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x1A8592AB8](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x1A36B8E8CLL);
}

void sub_1A36B8EF4(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t std::__pad_and_output[abi:ne180100]<char,std::char_traits<char>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6;
  uint64_t v11;
  int64_t v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  void *__p[2];
  char v18;

  v6 = a1;
  if (a1)
  {
    v11 = *(_QWORD *)(a5 + 24);
    if (v11 <= a4 - a2)
      v12 = 0;
    else
      v12 = v11 - (a4 - a2);
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1) != a3 - a2)
      return 0;
    if (v12 >= 1)
    {
      std::string::basic_string[abi:ne180100](__p, v12, __c);
      v13 = v18 >= 0 ? __p : (void **)__p[0];
      v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(_QWORD *)v6 + 96))(v6, v13, v12);
      if (v18 < 0)
        operator delete(__p[0]);
      if (v14 != v12)
        return 0;
    }
    v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v6 + 96))(v6, a3, v15) == v15)
      *(_QWORD *)(a5 + 24) = 0;
    else
      return 0;
  }
  return v6;
}

void sub_1A36B9028(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *std::string::basic_string[abi:ne180100](_QWORD *__b, size_t __len, int __c)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((_BYTE *)__b + 23) = __len;
    v6 = __b;
    if (!__len)
      goto LABEL_9;
  }
  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

uint64_t std::__shuffle[abi:ne180100]<std::_ClassicAlgPolicy,std::__wrap_iter<int *>,std::__wrap_iter<int *>,std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u> &>(unint64_t a1, uint64_t a2, uint64_t a3)
{
  int *v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  int v9;
  _QWORD v11[2];
  __int128 v12;

  if ((uint64_t)(a2 - a1) >= 5)
  {
    v4 = (int *)a1;
    v12 = xmmword_1A36F7510;
    v5 = a2 - 4;
    if (a2 - 4 > a1)
    {
      v7 = ((a2 - a1) >> 2) - 1;
      do
      {
        v11[0] = 0;
        v11[1] = v7;
        v8 = std::uniform_int_distribution<long>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>((uint64_t)&v12, a3, v11);
        if (v8)
        {
          v9 = *v4;
          *v4 = v4[v8];
          v4[v8] = v9;
        }
        ++v4;
        --v7;
      }
      while ((unint64_t)v4 < v5);
    }
  }
  return a2;
}

uint64_t std::uniform_int_distribution<long>::operator()<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>>(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t result;
  uint64_t v4;
  unint64_t v5;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _BYTE v10[64];

  result = a3[1];
  v4 = result - *a3;
  if (result != *a3)
  {
    v5 = v4 + 1;
    if (v4 == -1)
    {
      std::__independent_bits_engine<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>,unsigned long>::__independent_bits_engine((uint64_t)v10, a2, 0x40uLL);
      return std::__independent_bits_engine<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>,unsigned long>::__eval((uint64_t)v10);
    }
    else
    {
      v7 = __clz(v5);
      v8 = 63;
      if (((v5 << v7) & 0x7FFFFFFFFFFFFFFFLL) != 0)
        v8 = 64;
      std::__independent_bits_engine<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>,unsigned long>::__independent_bits_engine((uint64_t)v10, a2, v8 - v7);
      do
        v9 = std::__independent_bits_engine<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>,unsigned long>::__eval((uint64_t)v10);
      while (v9 >= v5);
      return *a3 + v9;
    }
  }
  return result;
}

uint64_t std::__independent_bits_engine<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>,unsigned long>::__independent_bits_engine(uint64_t result, uint64_t a2, unint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unsigned int v7;
  unsigned int v8;

  *(_QWORD *)result = a2;
  *(_QWORD *)(result + 8) = a3;
  if ((a3 & 0x1F) != 0)
    v3 = (a3 >> 5) + 1;
  else
    v3 = a3 >> 5;
  v4 = a3 / v3;
  *(_QWORD *)(result + 16) = a3 / v3;
  *(_QWORD *)(result + 24) = v3;
  v5 = (-1 << (a3 / v3)) & 0x100000000;
  if (a3 / v3 >= 0x40)
    v5 = 0;
  *(_QWORD *)(result + 40) = v5;
  if ((v5 ^ 0x100000000) > v5 / v3)
  {
    ++v3;
    v4 = a3 / v3;
    *(_QWORD *)(result + 16) = a3 / v3;
    *(_QWORD *)(result + 24) = v3;
    if (a3 / v3 > 0x3F)
    {
      v6 = 0;
      *(_QWORD *)(result + 32) = v3 + v4 * v3 - a3;
      *(_QWORD *)(result + 40) = 0;
      goto LABEL_13;
    }
    *(_QWORD *)(result + 40) = (-1 << v4) & 0x100000000;
  }
  *(_QWORD *)(result + 32) = v3 + a3 / v3 * v3 - a3;
  if (v4 > 0x3E)
    v6 = 0;
  else
    v6 = 0x80000000uLL >> v4 << (v4 + 1);
LABEL_13:
  *(_QWORD *)(result + 48) = v6;
  v7 = 0xFFFFFFFF >> -(char)v4;
  if (!v4)
    v7 = 0;
  if (v4 >= 0x1F)
    v8 = -1;
  else
    v8 = 0xFFFFFFFF >> ~(_BYTE)v4;
  *(_DWORD *)(result + 56) = v7;
  *(_DWORD *)(result + 60) = v8;
  return result;
}

uint64_t std::__independent_bits_engine<std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>,unsigned long>::__eval(uint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v8;
  unint64_t v9;
  uint64_t v10;

  if (*(_QWORD *)(a1 + 32))
  {
    v2 = 0;
    v3 = 0;
    do
    {
      do
        v4 = std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(*(std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> **)a1);
      while (*(_QWORD *)(a1 + 40) <= (unint64_t)v4);
      v5 = *(_QWORD *)(a1 + 16);
      if (v5 >= 0x40)
        v6 = 0;
      else
        v6 = v2 << v5;
      v2 = v6 + (*(_DWORD *)(a1 + 56) & v4);
      ++v3;
      v7 = *(_QWORD *)(a1 + 32);
    }
    while (v3 < v7);
  }
  else
  {
    v2 = 0;
    v7 = 0;
  }
  for (; v7 < *(_QWORD *)(a1 + 24); ++v7)
  {
    do
      v8 = std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(*(std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> **)a1);
    while (*(_QWORD *)(a1 + 48) <= (unint64_t)v8);
    v9 = *(_QWORD *)(a1 + 16);
    if (v9 >= 0x3F)
      v10 = 0;
    else
      v10 = v2 << (v9 + 1);
    v2 = v10 + (*(_DWORD *)(a1 + 60) & v8);
  }
  return v2;
}

std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *this)
{
  size_t i;
  size_t v2;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v3;

  i = this->__i_;
  v2 = (i + 1) % 0x270;
  v3 = this->__x_[(i + 397) % 0x270] ^ ((this->__x_[v2] & 0x7FFFFFFE | this->__x_[i] & 0x80000000) >> 1) ^ ((int)(this->__x_[v2] << 31) >> 31) & 0x9908B0DF;
  this->__x_[i] = v3;
  this->__i_ = v2;
  LODWORD(i) = ((v3 ^ (v3 >> 11)) << 7) & 0x9D2C5680 ^ v3 ^ (v3 >> 11);
  return ((_DWORD)i << 15) & 0xEFC60000 ^ i ^ ((((_DWORD)i << 15) & 0xEFC60000 ^ i) >> 18);
}

void sub_1A36BA2F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_1A36BA4C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A36BAC2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)NLE5Embedding;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1A36BB19C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, __int128 buf)
{
  void *v13;
  void *v14;
  void *v15;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  if (a2)
  {

    if (a2 == 3)
    {
      v18 = __cxa_begin_catch(exception_object);
      v19 = (void *)MEMORY[0x1A8592E0C]();
      NLGetLogCategory(0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "internal");
      v21 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        NLGetLogIdentifier(0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)MEMORY[0x1E0CB3940];
        (*(void (**)(void *))(*(_QWORD *)v18 + 16))(v18);
        objc_msgSend(v23, "stringWithFormat:", CFSTR("Unexpected Espresso E5 error during embedding load: %s"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543618;
        *(_QWORD *)((char *)&buf + 4) = v22;
        WORD6(buf) = 2114;
        *(_QWORD *)((char *)&buf + 14) = v24;
        _os_log_impl(&dword_1A36A7000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", (uint8_t *)&buf, 0x16u);

      }
    }
    else
    {
      v25 = __cxa_begin_catch(exception_object);
      v19 = (void *)MEMORY[0x1A8592E0C]();
      if (a2 == 2)
      {
        NLGetLogCategory(0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "internal");
        v21 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          NLGetLogIdentifier(0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = (void *)MEMORY[0x1E0CB3940];
          (*(void (**)(void *))(*(_QWORD *)v25 + 16))(v25);
          objc_msgSend(v28, "stringWithFormat:", CFSTR("Failed to load embedding from MIL representation: %s"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138543618;
          *(_QWORD *)((char *)&buf + 4) = v27;
          WORD6(buf) = 2114;
          *(_QWORD *)((char *)&buf + 14) = v29;
          _os_log_impl(&dword_1A36A7000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", (uint8_t *)&buf, 0x16u);

        }
      }
      else
      {
        NLGetLogCategory(0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "internal");
        v21 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          NLGetLogIdentifier(0);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to load embedding from MIL representation"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138543618;
          *(_QWORD *)((char *)&buf + 4) = v31;
          WORD6(buf) = 2114;
          *(_QWORD *)((char *)&buf + 14) = v32;
          _os_log_impl(&dword_1A36A7000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", (uint8_t *)&buf, 0x16u);

        }
      }
    }

    objc_autoreleasePoolPop(v19);
    __cxa_end_catch();
    JUMPOUT(0x1A36BAFC4);
  }
  _Unwind_Resume(exception_object);
}

void compileModel(uint64_t a1, int a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  void *__p;
  char v8;
  _BYTE v9[16];

  v4 = a3;
  MEMORY[0x1A859292C](v9);
  std::string::basic_string[abi:ne180100]<0>(&__p, "/private/var/db/com.apple.naturallanguaged");
  E5RT::E5CompilerConfigOptions::SetBundleCacheLocation();
  if (v8 < 0)
    operator delete(__p);
  E5RT::E5Compiler::MakeCompiler();
  createE5CompilerOptions(a2, v4);
  E5RT::E5Compiler::Compile();
  if (v6)
    (*(void (**)())(*(_QWORD *)v6 + 8))();
  v5 = __p;
  __p = 0;
  if (v5)
    (*(void (**)(void *))(*(_QWORD *)v5 + 8))(v5);
  MEMORY[0x1A8592938](v9);

}

void sub_1A36BB7CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, char a16)
{
  void *v16;

  if (a9)
    (*(void (**)(uint64_t))(*(_QWORD *)a9 + 8))(a9);
  if (__p)
    (*(void (**)(void *))(*(_QWORD *)__p + 8))(__p);
  MEMORY[0x1A8592938](&a16);

  _Unwind_Resume(a1);
}

void sub_1A36BB840()
{
  JUMPOUT(0x1A36BB834);
}

void sub_1A36BBAA8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, const __CFString *a20,__int128 buf)
{
  _QWORD *v21;
  void *v22;
  void *v23;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;

  if (a2)
  {

    if (a11)
      (*(void (**)(uint64_t))(*(_QWORD *)a11 + 8))(a11);
    if (a12)
      (*(void (**)(uint64_t))(*(_QWORD *)a12 + 8))(a12);
    MEMORY[0x1A8592938](&a13);
    if (a2 == 3)
    {
      v26 = __cxa_begin_catch(exception_object);
      v27 = (void *)MEMORY[0x1A8592E0C]();
      NLGetLogCategory(0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "internal");
      v29 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        NLGetLogIdentifier(0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)MEMORY[0x1E0CB3940];
        (*(void (**)(void *))(*(_QWORD *)v26 + 16))(v26);
        objc_msgSend(v31, "stringWithFormat:", CFSTR("%s"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138543618;
        *(_QWORD *)((char *)&buf + 4) = v30;
        WORD6(buf) = 2114;
        *(_QWORD *)((char *)&buf + 14) = v32;
        _os_log_impl(&dword_1A36A7000, v29, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", (uint8_t *)&buf, 0x16u);

      }
      objc_autoreleasePoolPop(v27);
      if (v21)
      {
        v33 = (void *)MEMORY[0x1E0CB35C8];
        a15 = *MEMORY[0x1E0CB2D50];
        v34 = (void *)MEMORY[0x1E0CB3940];
        (*(void (**)(void *))(*(_QWORD *)v26 + 16))(v26);
        objc_msgSend(v34, "stringWithFormat:", CFSTR("Compilation failed: %s"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        a16 = (uint64_t)v35;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &a16, &a15, 1);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 7, v36);
        *v21 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v37 = __cxa_begin_catch(exception_object);
      if (a2 == 2)
      {
        v38 = v37;
        v39 = (void *)MEMORY[0x1A8592E0C]();
        NLGetLogCategory(0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "internal");
        v41 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          NLGetLogIdentifier(0);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = (void *)MEMORY[0x1E0CB3940];
          (*(void (**)(void *))(*(_QWORD *)v38 + 16))(v38);
          objc_msgSend(v43, "stringWithFormat:", CFSTR("%s"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(buf) = 138543618;
          *(_QWORD *)((char *)&buf + 4) = v42;
          WORD6(buf) = 2114;
          *(_QWORD *)((char *)&buf + 14) = v44;
          _os_log_impl(&dword_1A36A7000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@%{public}@", (uint8_t *)&buf, 0x16u);

        }
        objc_autoreleasePoolPop(v39);
        if (v21)
        {
          v45 = (void *)MEMORY[0x1E0CB35C8];
          a17 = *MEMORY[0x1E0CB2D50];
          v46 = (void *)MEMORY[0x1E0CB3940];
          (*(void (**)(void *))(*(_QWORD *)v38 + 16))(v38);
          objc_msgSend(v46, "stringWithFormat:", CFSTR("Compilation failed: %s"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          a18 = (uint64_t)v47;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &a18, &a17, 1);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 7, v48);
          *v21 = (id)objc_claimAutoreleasedReturnValue();

        }
      }
      else if (v21)
      {
        v49 = (void *)MEMORY[0x1E0CB35C8];
        a19 = *MEMORY[0x1E0CB2D50];
        a20 = CFSTR("Compilation failed");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &a20, &a19, 1);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 7, v50);
        *v21 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    __cxa_end_catch();
    JUMPOUT(0x1A36BBA60);
  }
  _Unwind_Resume(exception_object);
}

void createE5CompilerOptions(int a1, void *a2)
{
  char *v3;
  uint64_t v4;
  _QWORD *v5;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  E5RT::E5CompilerOptions *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  std::vector<std::string>::pointer end;
  __int128 v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  std::string *v20;
  std::string *v21;
  __int128 v22;
  std::string *v23;
  E5RT::E5CompilerOptions *v24;
  void *__p[2];
  std::string::size_type v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  std::vector<std::string> v31;
  void *v32;
  char *v33;
  _QWORD *v34;
  _BYTE v35[128];
  std::__split_buffer<std::string> __v;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v24 = a2;
  E5RT::E5CompilerOptions::Create(v24);
  v3 = (char *)operator new(8uLL);
  v32 = v3;
  *(_QWORD *)v3 = 1;
  v33 = v3 + 8;
  v34 = v3 + 8;
  if (a1)
  {
    v5 = std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)&v34, 2uLL);
    v6 = (char *)v32;
    v7 = v33;
    v5[1] = 4;
    v8 = (char *)(v5 + 1);
    v9 = (char *)(v5 + 2);
    while (v7 != v6)
    {
      v10 = *((_QWORD *)v7 - 1);
      v7 -= 8;
      *((_QWORD *)v8 - 1) = v10;
      v8 -= 8;
    }
    v32 = v8;
    v33 = (char *)(v5 + 2);
    v34 = &v5[v4];
    if (v6)
      operator delete(v6);
    v33 = v9;
  }
  if (-[E5RT::E5CompilerOptions count](v24, "count"))
  {
    std::string::basic_string[abi:ne180100]<0>(&__v, "main");
    memset(&v31, 0, sizeof(v31));
    __p[0] = &v31;
    LOBYTE(__p[1]) = 0;
    v31.__begin_ = (std::vector<std::string>::pointer)operator new(0x18uLL);
    v31.__end_ = v31.__begin_;
    v31.__end_cap_.__value_ = v31.__begin_ + 1;
    v31.__end_ = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v31.__end_cap_, (__int128 *)&__v, (__int128 *)&__v.__end_cap_, v31.__begin_);
    if (SHIBYTE(__v.__end_) < 0)
      operator delete(__v.__first_);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v11 = v24;
    v12 = -[E5RT::E5CompilerOptions countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v28 != v13)
            objc_enumerationMutation(v11);
          std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i)), "UTF8String"));
          end = v31.__end_;
          if (v31.__end_ >= v31.__end_cap_.__value_)
          {
            v17 = 0xAAAAAAAAAAAAAAABLL * (((char *)v31.__end_ - (char *)v31.__begin_) >> 3);
            v18 = v17 + 1;
            if (v17 + 1 > 0xAAAAAAAAAAAAAAALL)
              std::vector<double>::__throw_length_error[abi:ne180100]();
            if (0x5555555555555556 * (((char *)v31.__end_cap_.__value_ - (char *)v31.__begin_) >> 3) > v18)
              v18 = 0x5555555555555556 * (((char *)v31.__end_cap_.__value_ - (char *)v31.__begin_) >> 3);
            if (0xAAAAAAAAAAAAAAABLL * (((char *)v31.__end_cap_.__value_ - (char *)v31.__begin_) >> 3) >= 0x555555555555555)
              v19 = 0xAAAAAAAAAAAAAAALL;
            else
              v19 = v18;
            __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v31.__end_cap_;
            if (v19)
              v20 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::string>>((uint64_t)&v31.__end_cap_, v19);
            else
              v20 = 0;
            v21 = v20 + v17;
            __v.__first_ = v20;
            __v.__begin_ = v21;
            __v.__end_cap_.__value_ = &v20[v19];
            v22 = *(_OWORD *)__p;
            v21->__r_.__value_.__r.__words[2] = v26;
            *(_OWORD *)&v21->__r_.__value_.__l.__data_ = v22;
            __p[1] = 0;
            v26 = 0;
            __p[0] = 0;
            __v.__end_ = v21 + 1;
            std::vector<std::string>::__swap_out_circular_buffer(&v31, &__v);
            v23 = v31.__end_;
            std::__split_buffer<std::string>::~__split_buffer(&__v);
            v31.__end_ = v23;
            if (SHIBYTE(v26) < 0)
              operator delete(__p[0]);
          }
          else
          {
            v16 = *(_OWORD *)__p;
            v31.__end_->__r_.__value_.__r.__words[2] = v26;
            *(_OWORD *)&end->__r_.__value_.__l.__data_ = v16;
            v31.__end_ = end + 1;
          }
        }
        v12 = -[E5RT::E5CompilerOptions countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v12);
    }

    E5RT::E5CompilerOptions::SetMilEntryPoints();
    __v.__first_ = (std::__split_buffer<std::string>::pointer)&v31;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
  }
  E5RT::E5CompilerOptions::SetComputeDeviceTypesAllowed();
  std::string::basic_string[abi:ne180100]<0>(&__v, "bnns");
  E5RT::E5CompilerOptions::SetPreferredCpuBackend();
  if (SHIBYTE(__v.__end_) < 0)
    operator delete(__v.__first_);
  if (v32)
  {
    v33 = (char *)v32;
    operator delete(v32);
  }

}

void sub_1A36BC3D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t *a10, void *a11, void *a12, uint64_t a13, int a14, __int16 a15, char a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,void *__p,uint64_t a31)
{
  uint64_t v32;

  if (__p)
    operator delete(__p);
  v32 = *a10;
  *a10 = 0;
  if (v32)
    (*(void (**)(uint64_t))(*(_QWORD *)v32 + 8))(v32);

  _Unwind_Resume(a1);
}

void sub_1A36BC690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, int a14, __int16 a15, uint64_t a16, char a17, char a18)
{
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  _Unwind_Resume(a1);
}

void sub_1A36BD718(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, char a12, uint64_t a13, char a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,void *__p,uint64_t a26,int a27,__int16 a28,char a29,char a30)
{
  void *v30;
  void *v31;

  if (a18)
    (*(void (**)(uint64_t))(*(_QWORD *)a18 + 8))(a18);
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>>>::~__hash_table((uint64_t)&a19);
  _Unwind_Resume(a1);
}

_QWORD *std::shared_ptr<E5RT::ExecutionStreamOperation>::operator=[abi:ne180100]<E5RT::ExecutionStreamOperation,std::default_delete<E5RT::ExecutionStreamOperation>,void>(_QWORD *a1, uint64_t *a2)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;

  v4 = *a2;
  if (*a2)
  {
    v5 = (_QWORD *)operator new();
    v6 = *a2;
    *v5 = &unk_1E4A3A298;
    v5[1] = 0;
    v5[2] = 0;
    v5[3] = v6;
  }
  else
  {
    v5 = 0;
  }
  *a2 = 0;
  v7 = (std::__shared_weak_count *)a1[1];
  *a1 = v4;
  a1[1] = v5;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldaxr(p_shared_owners);
    while (__stlxr(v9 - 1, p_shared_owners));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  return a1;
}

void sub_1A36BDB38(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void sub_1A36BDBB4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A36BDE30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v2;

  _Unwind_Resume(a1);
}

void sub_1A36BDEF8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A36BE288(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A36BE9E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, void *a20,uint64_t a21,char a22,void *a23,uint64_t a24,int a25,__int16 a26,char a27,char a28,uint64_t a29,void *__p,uint64_t a31)
{
  void *v31;
  void *v32;

  _Unwind_Resume(a1);
}

void applesauce::CF::ArrayRef::~ArrayRef(const void **this)
{
  const void *v1;

  v1 = *this;
  if (v1)
    CFRelease(v1);
}

void sub_1A36BF104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, const void *a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23)
{
  void *v23;
  void *v24;
  void *v25;

  if (__p)
  {
    a23 = (uint64_t)__p;
    operator delete(__p);
  }
  applesauce::CF::ArrayRef::~ArrayRef(&a10);

  _Unwind_Resume(a1);
}

void std::vector<int>::resize(std::vector<int> *this, std::vector<int>::size_type __sz)
{
  std::vector<int>::size_type v2;

  v2 = this->__end_ - this->__begin_;
  if (__sz <= v2)
  {
    if (__sz < v2)
      this->__end_ = &this->__begin_[__sz];
  }
  else
  {
    std::vector<int>::__append(this, __sz - v2);
  }
}

void sub_1A36BF3B4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A36BF548(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

std::string *std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>(uint64_t a1, __int128 *a2, __int128 *a3, std::string *this)
{
  std::string *v4;
  __int128 *v6;
  __int128 v7;
  _QWORD v9[3];
  char v10;
  std::string *v11;
  std::string *v12;

  v4 = this;
  v11 = this;
  v12 = this;
  v9[0] = a1;
  v9[1] = &v11;
  v9[2] = &v12;
  v10 = 0;
  if (a2 != a3)
  {
    v6 = a2;
    do
    {
      if (*((char *)v6 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(v4, *(const std::string::value_type **)v6, *((_QWORD *)v6 + 1));
        v4 = v12;
      }
      else
      {
        v7 = *v6;
        v4->__r_.__value_.__r.__words[2] = *((_QWORD *)v6 + 2);
        *(_OWORD *)&v4->__r_.__value_.__l.__data_ = v7;
      }
      v6 = (__int128 *)((char *)v6 + 24);
      v12 = ++v4;
    }
    while (v6 != a3);
  }
  v10 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v9);
  return v4;
}

void sub_1A36BF724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)&a9);
  _Unwind_Resume(a1);
}

applesauce::CF::ArrayRef *applesauce::CF::ArrayRef::ArrayRef(applesauce::CF::ArrayRef *this, CFTypeRef cf)
{
  CFTypeID v3;
  void *exception;

  *(_QWORD *)this = cf;
  if (cf)
  {
    v3 = CFGetTypeID(cf);
    if (v3 != CFArrayGetTypeID())
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x1A8592A4C](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
    }
  }
  return this;
}

void sub_1A36BF7B4(_Unwind_Exception *a1)
{
  CFTypeRef *v1;
  void *v2;

  __cxa_free_exception(v2);
  if (*v1)
    CFRelease(*v1);
  _Unwind_Resume(a1);
}

int *std::vector<int>::__insert_with_size[abi:ne180100]<std::__wrap_iter<int *>,std::__wrap_iter<int *>>(std::vector<int> *a1, uint64_t __dst, char *__src, char *a4, uint64_t a5)
{
  int *v5;
  int *v7;
  std::allocator<int> *p_end_cap;
  int *v10;
  int *value;
  unint64_t v12;
  std::vector<int>::pointer begin;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  int *v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  int64_t v22;
  int *v23;
  int *v24;
  int *v25;
  int *v26;
  int v27;
  int *v28;
  uint64_t v29;
  int *v30;
  int v31;
  std::__split_buffer<int> __v;

  v5 = (int *)__dst;
  if (a5 < 1)
    return v5;
  v7 = (int *)__src;
  value = a1->__end_cap_.__value_;
  p_end_cap = (std::allocator<int> *)&a1->__end_cap_;
  v10 = value;
  v12 = *((_QWORD *)p_end_cap - 1);
  if (a5 > (uint64_t)((uint64_t)value - v12) >> 2)
  {
    begin = a1->__begin_;
    v14 = a5 + ((uint64_t)(v12 - (unint64_t)a1->__begin_) >> 2);
    if (v14 >> 62)
      std::vector<double>::__throw_length_error[abi:ne180100]();
    v15 = (__dst - (uint64_t)begin) >> 2;
    v16 = (char *)v10 - (char *)begin;
    if (v16 >> 1 > v14)
      v14 = v16 >> 1;
    if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFFCLL)
      v17 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v17 = v14;
    __v.__end_cap_.__value_ = p_end_cap;
    if (v17)
      v18 = (int *)std::__allocate_at_least[abi:ne180100]<std::allocator<ME_Model::ME_Feature>>((uint64_t)p_end_cap, v17);
    else
      v18 = 0;
    v28 = &v18[v15];
    __v.__first_ = v18;
    __v.__begin_ = v28;
    __v.__end_cap_.__value_ = &v18[v17];
    v29 = 4 * a5;
    v30 = &v28[a5];
    do
    {
      v31 = *v7++;
      *v28++ = v31;
      v29 -= 4;
    }
    while (v29);
    __v.__end_ = v30;
    v5 = std::vector<int>::__swap_out_circular_buffer(a1, &__v, v5);
    if (__v.__end_ != __v.__begin_)
      __v.__end_ = (std::__split_buffer<int>::pointer)((char *)__v.__end_
                                                     + (((char *)__v.__begin_ - (char *)__v.__end_ + 3) & 0xFFFFFFFFFFFFFFFCLL));
    if (__v.__first_)
      operator delete(__v.__first_);
    return v5;
  }
  v19 = v12 - __dst;
  v20 = (uint64_t)(v12 - __dst) >> 2;
  if (v20 >= a5)
  {
    v21 = &__src[4 * a5];
    v23 = (int *)*((_QWORD *)p_end_cap - 1);
LABEL_17:
    v24 = &v5[a5];
    v25 = &v23[-a5];
    v26 = v23;
    if ((unint64_t)v25 < v12)
    {
      v26 = v23;
      do
      {
        v27 = *v25++;
        *v26++ = v27;
      }
      while ((unint64_t)v25 < v12);
    }
    a1->__end_ = v26;
    if (v23 != v24)
      memmove(&v23[-(v23 - v24)], v5, (char *)v23 - (char *)v24);
    if (v21 != (char *)v7)
      memmove(v5, v7, v21 - (char *)v7);
    return v5;
  }
  v21 = &__src[4 * v20];
  v22 = a4 - v21;
  if (a4 != v21)
    memmove(*((void **)p_end_cap - 1), &__src[4 * v20], a4 - v21);
  v23 = (int *)(v12 + v22);
  a1->__end_ = (std::vector<int>::pointer)(v12 + v22);
  if (v19 >= 1)
    goto LABEL_17;
  return v5;
}

void sub_1A36BF9B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, uint64_t a12)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

std::vector<int>::pointer std::vector<int>::__swap_out_circular_buffer(std::vector<int> *this, std::__split_buffer<int> *__v, std::vector<int>::pointer __p)
{
  int *begin;
  std::vector<int>::pointer v6;
  int *v7;
  std::vector<int>::pointer v8;
  int v9;
  int *end;
  std::__split_buffer<int>::pointer v11;
  int64_t v12;
  int *v13;
  int *v14;
  int *value;

  begin = __v->__begin_;
  v6 = this->__begin_;
  v7 = begin;
  if (this->__begin_ != __p)
  {
    v8 = __p;
    v7 = __v->__begin_;
    do
    {
      v9 = *--v8;
      *--v7 = v9;
    }
    while (v8 != v6);
  }
  __v->__begin_ = v7;
  end = this->__end_;
  v11 = __v->__end_;
  v12 = (char *)end - (char *)__p;
  if (end != __p)
  {
    memmove(__v->__end_, __p, (char *)end - (char *)__p);
    v7 = __v->__begin_;
  }
  __v->__end_ = (std::__split_buffer<int>::pointer)((char *)v11 + v12);
  v13 = this->__begin_;
  this->__begin_ = v7;
  __v->__begin_ = v13;
  v14 = this->__end_;
  this->__end_ = __v->__end_;
  __v->__end_ = v14;
  value = this->__end_cap_.__value_;
  this->__end_cap_.__value_ = __v->__end_cap_.__value_;
  __v->__end_cap_.__value_ = value;
  __v->__first_ = __v->__begin_;
  return begin;
}

void std::vector<int>::__append(std::vector<int> *this, std::vector<int>::size_type __n)
{
  std::__compressed_pair<int *> *p_end_cap;
  int *v5;
  int *value;
  int *end;
  std::vector<int>::pointer begin;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char *v14;
  char *v15;
  int *v16;
  int *v17;
  int v18;

  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  v5 = value;
  end = p_end_cap[-1].__value_;
  if (__n <= value - end)
  {
    if (__n)
    {
      bzero(p_end_cap[-1].__value_, 4 * __n);
      end += __n;
    }
    this->__end_ = end;
  }
  else
  {
    begin = this->__begin_;
    v9 = (char *)end - (char *)this->__begin_;
    v10 = __n + (v9 >> 2);
    if (v10 >> 62)
      std::vector<double>::__throw_length_error[abi:ne180100]();
    v11 = v9 >> 2;
    v12 = (char *)v5 - (char *)begin;
    if (v12 >> 1 > v10)
      v10 = v12 >> 1;
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFFCLL)
      v13 = 0x3FFFFFFFFFFFFFFFLL;
    else
      v13 = v10;
    if (v13)
    {
      v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ME_Model::ME_Feature>>((uint64_t)p_end_cap, v13);
      begin = this->__begin_;
      end = this->__end_;
    }
    else
    {
      v14 = 0;
    }
    v15 = &v14[4 * v11];
    v16 = (int *)&v14[4 * v13];
    bzero(v15, 4 * __n);
    v17 = (int *)&v15[4 * __n];
    while (end != begin)
    {
      v18 = *--end;
      *((_DWORD *)v15 - 1) = v18;
      v15 -= 4;
    }
    this->__begin_ = (std::vector<int>::pointer)v15;
    this->__end_ = v17;
    this->__end_cap_.__value_ = v16;
    if (begin)
      operator delete(begin);
  }
}

uint64_t std::unordered_map<std::string,std::shared_ptr<E5RT::ProgramFunction>>::unordered_map(uint64_t a1, uint64_t a2)
{
  unsigned __int8 *i;

  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_DWORD *)(a1 + 32) = *(_DWORD *)(a2 + 32);
  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__rehash<true>(a1, *(_QWORD *)(a2 + 8));
  for (i = *(unsigned __int8 **)(a2 + 16); i; i = *(unsigned __int8 **)i)
    std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,std::shared_ptr<E5RT::ProgramFunction>> const&>(a1, i + 16, (__int128 *)i + 1);
  return a1;
}

void sub_1A36BFC18(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>>>::~__hash_table(v1);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>>>::__emplace_unique_key_args<std::string,std::pair<std::string const,std::shared_ptr<E5RT::ProgramFunction>> const&>(uint64_t a1, unsigned __int8 *a2, __int128 *a3)
{
  unint64_t v3;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint8x8_t v11;
  unint64_t v12;
  unsigned __int8 **v13;
  unsigned __int8 *i;
  unint64_t v15;
  float v16;
  float v17;
  _BOOL8 v18;
  unint64_t v19;
  unint64_t v20;
  size_t v21;
  _QWORD *v22;
  unint64_t v23;
  _QWORD v25[3];

  v7 = (_QWORD *)(a1 + 24);
  v8 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  v9 = v8;
  v10 = *(_QWORD *)(a1 + 8);
  if (v10)
  {
    v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    v12 = v11.u32[0];
    if (v11.u32[0] > 1uLL)
    {
      v3 = v8;
      if (v8 >= v10)
        v3 = v8 % v10;
    }
    else
    {
      v3 = (v10 - 1) & v8;
    }
    v13 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v3);
    if (v13)
    {
      for (i = *v13; i; i = *(unsigned __int8 **)i)
      {
        v15 = *((_QWORD *)i + 1);
        if (v15 == v9)
        {
          if ((std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2) & 1) != 0)
            return i;
        }
        else
        {
          if (v12 > 1)
          {
            if (v15 >= v10)
              v15 %= v10;
          }
          else
          {
            v15 &= v10 - 1;
          }
          if (v15 != v3)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>>>::__construct_node_hash<std::pair<std::string const,std::shared_ptr<E5RT::ProgramFunction>> const&>(a1, v9, a3, (uint64_t)v25);
  v16 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v17 = *(float *)(a1 + 32);
  if (!v10 || (float)(v17 * (float)v10) < v16)
  {
    v18 = 1;
    if (v10 >= 3)
      v18 = (v10 & (v10 - 1)) != 0;
    v19 = v18 | (2 * v10);
    v20 = vcvtps_u32_f32(v16 / v17);
    if (v19 <= v20)
      v21 = v20;
    else
      v21 = v19;
    std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__rehash<true>(a1, v21);
    v10 = *(_QWORD *)(a1 + 8);
    if ((v10 & (v10 - 1)) != 0)
    {
      if (v9 >= v10)
        v3 = v9 % v10;
      else
        v3 = v9;
    }
    else
    {
      v3 = (v10 - 1) & v9;
    }
  }
  v22 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v22)
  {
    *(_QWORD *)v25[0] = *v22;
    *v22 = v25[0];
  }
  else
  {
    *(_QWORD *)v25[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v25[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v3) = a1 + 16;
    if (*(_QWORD *)v25[0])
    {
      v23 = *(_QWORD *)(*(_QWORD *)v25[0] + 8);
      if ((v10 & (v10 - 1)) != 0)
      {
        if (v23 >= v10)
          v23 %= v10;
      }
      else
      {
        v23 &= v10 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v23) = v25[0];
    }
  }
  i = (unsigned __int8 *)v25[0];
  v25[0] = 0;
  ++*v7;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>>>>::reset[abi:ne180100]((uint64_t)v25, 0);
  return i;
}

void sub_1A36BFE98(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

std::string *std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>>>::__construct_node_hash<std::pair<std::string const,std::shared_ptr<E5RT::ProgramFunction>> const&>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  char *v8;
  std::string *result;

  v7 = a1 + 16;
  v8 = (char *)operator new(0x38uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  *(_QWORD *)v8 = 0;
  *((_QWORD *)v8 + 1) = a2;
  result = std::pair<std::string const,std::shared_ptr<E5RT::ProgramFunction>>::pair[abi:ne180100]((std::string *)(v8 + 16), a3);
  *(_BYTE *)(a4 + 16) = 1;
  return result;
}

void sub_1A36BFF0C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

unint64_t std::__string_hash<char>::operator()[abi:ne180100](uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  char v5;

  v2 = *(_QWORD *)(a2 + 8);
  if (*(char *)(a2 + 23) >= 0)
  {
    v3 = *(unsigned __int8 *)(a2 + 23);
  }
  else
  {
    a2 = *(_QWORD *)a2;
    v3 = v2;
  }
  return std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100]((uint64_t)&v5, (uint64_t *)a2, v3);
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::operator()[abi:ne180100](uint64_t a1, uint64_t *a2, unint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  unint64_t v41;

  if (a3 > 0x20)
  {
    if (a3 > 0x40)
    {
      v4 = *(uint64_t *)((char *)a2 + a3 - 48);
      v5 = *(uint64_t *)((char *)a2 + a3 - 40);
      v6 = *(uint64_t *)((char *)a2 + a3 - 24);
      v8 = *(uint64_t *)((char *)a2 + a3 - 64);
      v7 = *(uint64_t *)((char *)a2 + a3 - 56);
      v9 = *(uint64_t *)((char *)a2 + a3 - 16);
      v10 = *(uint64_t *)((char *)a2 + a3 - 8);
      v11 = v7 + v9;
      v12 = 0x9DDFEA08EB382D69
          * (v6 ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))) >> 47) ^ (0x9DDFEA08EB382D69 * (v6 ^ (v4 + a3))));
      v13 = 0x9DDFEA08EB382D69 * (v12 ^ (v12 >> 47));
      v14 = v8 + a3 + v7 + v4;
      v15 = v14 + v5;
      v16 = __ROR8__(v14, 44) + v8 + a3 + __ROR8__(v5 + v8 + a3 - 0x622015F714C7D297 * (v12 ^ (v12 >> 47)), 21);
      v17 = v7 + v9 + *(uint64_t *)((char *)a2 + a3 - 32) - 0x4B6D499041670D8DLL;
      v18 = v17 + v6 + v9;
      v19 = __ROR8__(v18, 44);
      v20 = v18 + v10;
      v21 = v19 + v17 + __ROR8__(v17 + v5 + v10, 21);
      v23 = *a2;
      v22 = a2 + 4;
      v24 = v23 - 0x4B6D499041670D8DLL * v5;
      v25 = -(uint64_t)((a3 - 1) & 0xFFFFFFFFFFFFFFC0);
      do
      {
        v26 = *(v22 - 3);
        v27 = v24 + v15 + v11 + v26;
        v28 = v22[2];
        v29 = v22[3];
        v30 = v22[1];
        v11 = v30 + v15 - 0x4B6D499041670D8DLL * __ROR8__(v11 + v16 + v28, 42);
        v31 = v13 + v20;
        v32 = *(v22 - 2);
        v33 = *(v22 - 1);
        v34 = *(v22 - 4) - 0x4B6D499041670D8DLL * v16;
        v35 = v34 + v20 + v33;
        v36 = v34 + v26 + v32;
        v15 = v36 + v33;
        v37 = __ROR8__(v36, 44) + v34;
        v38 = (0xB492B66FBE98F273 * __ROR8__(v27, 37)) ^ v21;
        v24 = 0xB492B66FBE98F273 * __ROR8__(v31, 33);
        v16 = v37 + __ROR8__(v35 + v38, 21);
        v39 = v24 + v21 + *v22;
        v20 = v39 + v30 + v28 + v29;
        v21 = __ROR8__(v39 + v30 + v28, 44) + v39 + __ROR8__(v11 + v32 + v39 + v29, 21);
        v22 += 8;
        v13 = v38;
        v25 += 64;
      }
      while (v25);
      v40 = v24
          - 0x622015F714C7D297
          * ((0x9DDFEA08EB382D69
            * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) ^ ((0x9DDFEA08EB382D69 * (v21 ^ ((0x9DDFEA08EB382D69 * (v21 ^ v16)) >> 47) ^ (0x9DDFEA08EB382D69 * (v21 ^ v16)))) >> 47));
      v41 = 0x9DDFEA08EB382D69
          * (v40 ^ (v38
                  - 0x4B6D499041670D8DLL * (v11 ^ (v11 >> 47))
                  - 0x622015F714C7D297
                  * ((0x9DDFEA08EB382D69
                    * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) ^ ((0x9DDFEA08EB382D69 * (v20 ^ ((0x9DDFEA08EB382D69 * (v20 ^ v15)) >> 47) ^ (0x9DDFEA08EB382D69 * (v20 ^ v15)))) >> 47))));
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) ^ ((0x9DDFEA08EB382D69 * (v40 ^ (v41 >> 47) ^ v41)) >> 47));
    }
    else
    {
      return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](a2, a3);
    }
  }
  else if (a3 > 0x10)
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](a2, a3);
  }
  else
  {
    return std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](a2, a3);
  }
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_0_to_16[abi:ne180100](_DWORD *a1, unint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t result;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  if (a2 < 9)
  {
    if (a2 < 4)
    {
      result = 0x9AE16A3B2F90404FLL;
      if (a2)
      {
        v8 = (0xC949D7C7509E6557 * (a2 + 4 * *((unsigned __int8 *)a1 + a2 - 1))) ^ (0x9AE16A3B2F90404FLL
                                                                                      * (*(unsigned __int8 *)a1 | ((unint64_t)*((unsigned __int8 *)a1 + (a2 >> 1)) << 8)));
        return 0x9AE16A3B2F90404FLL * (v8 ^ (v8 >> 47));
      }
    }
    else
    {
      v6 = *(unsigned int *)((char *)a1 + a2 - 4);
      v7 = 0x9DDFEA08EB382D69 * (((8 * *a1) + a2) ^ v6);
      return 0x9DDFEA08EB382D69
           * ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) ^ ((0x9DDFEA08EB382D69 * (v6 ^ (v7 >> 47) ^ v7)) >> 47));
    }
  }
  else
  {
    v3 = *(_QWORD *)((char *)a1 + a2 - 8);
    v4 = __ROR8__(v3 + a2, a2);
    return (0x9DDFEA08EB382D69
          * ((0x9DDFEA08EB382D69
            * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)))) ^ ((0x9DDFEA08EB382D69 * (v4 ^ ((0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)) >> 47) ^ (0x9DDFEA08EB382D69 * (v4 ^ *(_QWORD *)a1)))) >> 47))) ^ v3;
  }
  return result;
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_17_to_32[abi:ne180100](_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v2 = a1[1];
  v3 = 0xB492B66FBE98F273 * *a1;
  v4 = __ROR8__(0x9AE16A3B2F90404FLL * *(_QWORD *)((char *)a1 + a2 - 8), 30) + __ROR8__(v3 - v2, 43);
  v5 = v3 + a2 + __ROR8__(v2 ^ 0xC949D7C7509E6557, 20) - 0x9AE16A3B2F90404FLL * *(_QWORD *)((char *)a1 + a2 - 8);
  v6 = 0x9DDFEA08EB382D69 * (v5 ^ (v4 - 0x3C5A37A36834CED9 * *(_QWORD *)((char *)a1 + a2 - 16)));
  return 0x9DDFEA08EB382D69
       * ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) ^ ((0x9DDFEA08EB382D69 * (v5 ^ (v6 >> 47) ^ v6)) >> 47));
}

unint64_t std::__murmur2_or_cityhash<unsigned long,64ul>::__hash_len_33_to_64[abi:ne180100](_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v2 = *(_QWORD *)((char *)a1 + a2 - 16);
  v3 = *a1 - 0x3C5A37A36834CED9 * (v2 + a2);
  v5 = a1[2];
  v4 = a1[3];
  v6 = __ROR8__(v3 + v4, 52);
  v7 = v3 + a1[1];
  v8 = __ROR8__(v7, 7);
  v9 = v7 + v5;
  v10 = *(_QWORD *)((char *)a1 + a2 - 32) + v5;
  v11 = v8 + __ROR8__(*a1 - 0x3C5A37A36834CED9 * (v2 + a2), 37) + v6 + __ROR8__(v9, 31);
  v12 = *(_QWORD *)((char *)a1 + a2 - 24) + v10 + v2;
  v13 = 0xC3A5C85C97CB3127 * (v12 + *(_QWORD *)((char *)a1 + a2 - 8) + v4 + v11)
      - 0x651E95C4D06FBFB1
      * (v9
       + v4
       + __ROR8__(v10, 37)
       + __ROR8__(*(_QWORD *)((char *)a1 + a2 - 24) + v10, 7)
       + __ROR8__(*(_QWORD *)((char *)a1 + a2 - 8) + v4 + v10, 52)
       + __ROR8__(v12, 31));
  return 0x9AE16A3B2F90404FLL
       * ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) ^ ((v11 - 0x3C5A37A36834CED9 * (v13 ^ (v13 >> 47))) >> 47));
}

std::string *std::pair<std::string const,std::shared_ptr<E5RT::ProgramFunction>>::pair[abi:ne180100](std::string *this, __int128 *a2)
{
  __int128 v4;
  std::string::size_type v5;
  unint64_t *v6;
  unint64_t v7;

  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v4 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v4;
  }
  v5 = *((_QWORD *)a2 + 4);
  this[1].__r_.__value_.__r.__words[0] = *((_QWORD *)a2 + 3);
  this[1].__r_.__value_.__l.__size_ = v5;
  if (v5)
  {
    v6 = (unint64_t *)(v5 + 8);
    do
      v7 = __ldxr(v6);
    while (__stxr(v7 + 1, v6));
  }
  return this;
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::shared_ptr<E5RT::ProgramFunction>>,0>((uint64_t)v2 + 16);
    operator delete(v2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::shared_ptr<E5RT::ProgramFunction>>,0>(uint64_t a1)
{
  std::shared_ptr<E5RT::ProgramFunction>::~shared_ptr[abi:ne180100](a1 + 24);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

uint64_t std::shared_ptr<E5RT::ProgramFunction>::~shared_ptr[abi:ne180100](uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;

  v2 = *(std::__shared_weak_count **)(a1 + 8);
  if (v2)
  {
    p_shared_owners = (unint64_t *)&v2->__shared_owners_;
    do
      v4 = __ldaxr(p_shared_owners);
    while (__stlxr(v4 - 1, p_shared_owners));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
  return a1;
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>>>::__deallocate_node(a1, *(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>>>::__deallocate_node(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (_QWORD *)*v2;
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::shared_ptr<E5RT::ProgramFunction>>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>>>::find<std::string>(_QWORD *a1, unsigned __int8 *a2)
{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 **v10;
  unsigned __int8 *v11;
  uint64_t v12;
  unint64_t v13;

  v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 3), (uint64_t)a2);
  v5 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v5)
    return 0;
  v6 = v4;
  v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    v9 = v4;
    if (v4 >= *(_QWORD *)&v5)
      v9 = v4 % *(_QWORD *)&v5;
  }
  else
  {
    v9 = (*(_QWORD *)&v5 - 1) & v4;
  }
  v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10)
    return 0;
  v11 = *v10;
  if (*v10)
  {
    v12 = (uint64_t)(a1 + 4);
    do
    {
      v13 = *((_QWORD *)v11 + 1);
      if (v6 == v13)
      {
        if ((std::equal_to<std::string>::operator()[abi:ne180100](v12, v11 + 16, a2) & 1) != 0)
          return v11;
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(_QWORD *)&v5)
            v13 %= *(_QWORD *)&v5;
        }
        else
        {
          v13 &= *(_QWORD *)&v5 - 1;
        }
        if (v13 != v9)
          return 0;
      }
      v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

{
  unint64_t v4;
  int8x8_t v5;
  unint64_t v6;
  uint8x8_t v7;
  unint64_t v8;
  unint64_t v9;
  unsigned __int8 **v10;
  unsigned __int8 *v11;
  uint64_t v12;
  unint64_t v13;

  v4 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)(a1 + 3), (uint64_t)a2);
  v5 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v5)
    return 0;
  v6 = v4;
  v7 = (uint8x8_t)vcnt_s8(v5);
  v7.i16[0] = vaddlv_u8(v7);
  v8 = v7.u32[0];
  if (v7.u32[0] > 1uLL)
  {
    v9 = v4;
    if (v4 >= *(_QWORD *)&v5)
      v9 = v4 % *(_QWORD *)&v5;
  }
  else
  {
    v9 = (*(_QWORD *)&v5 - 1) & v4;
  }
  v10 = *(unsigned __int8 ***)(*a1 + 8 * v9);
  if (!v10)
    return 0;
  v11 = *v10;
  if (*v10)
  {
    v12 = (uint64_t)(a1 + 4);
    do
    {
      v13 = *((_QWORD *)v11 + 1);
      if (v13 == v6)
      {
        if ((std::equal_to<std::string>::operator()[abi:ne180100](v12, v11 + 16, a2) & 1) != 0)
          return v11;
      }
      else
      {
        if (v8 > 1)
        {
          if (v13 >= *(_QWORD *)&v5)
            v13 %= *(_QWORD *)&v5;
        }
        else
        {
          v13 &= *(_QWORD *)&v5 - 1;
        }
        if (v13 != v9)
          return 0;
      }
      v11 = *(unsigned __int8 **)v11;
    }
    while (v11);
  }
  return v11;
}

void std::__throw_out_of_range[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::out_of_range::out_of_range[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E4A39AD0, MEMORY[0x1E0DE42E0]);
}

void sub_1A36C06C0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::out_of_range::out_of_range[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5028] + 16);
  return result;
}

void std::__shared_ptr_pointer<E5RT::ExecutionStreamOperation  *>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1A8592B54);
}

uint64_t std::__shared_ptr_pointer<E5RT::ExecutionStreamOperation  *>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<E5RT::ExecutionStreamOperation  *>::__get_deleter(uint64_t a1, uint64_t a2)
{
  {
    return a1 + 24;
  }
  else
  {
    return 0;
  }
}

BOOL std::type_info::operator==[abi:ne180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v2 == v3)
    return 1;
  if ((v3 & v2) < 0 != __OFSUB__(v2, v3))
    return strcmp((const char *)(v2 & 0x7FFFFFFFFFFFFFFFLL), (const char *)(v3 & 0x7FFFFFFFFFFFFFFFLL)) == 0;
  return 0;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>>>::__emplace_unique_key_args<std::string,std::string const&,std::unique_ptr<E5RT::BufferObject>>(uint64_t a1, unsigned __int8 *a2, __int128 *a3, uint64_t *a4)
{
  unint64_t v4;
  _QWORD *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint8x8_t v13;
  unint64_t v14;
  unsigned __int8 **v15;
  unsigned __int8 *i;
  unint64_t v17;
  float v18;
  float v19;
  _BOOL8 v20;
  unint64_t v21;
  unint64_t v22;
  size_t v23;
  _QWORD *v24;
  unint64_t v25;
  _QWORD v27[3];

  v9 = (_QWORD *)(a1 + 24);
  v10 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  v11 = v10;
  v12 = *(_QWORD *)(a1 + 8);
  if (v12)
  {
    v13 = (uint8x8_t)vcnt_s8((int8x8_t)v12);
    v13.i16[0] = vaddlv_u8(v13);
    v14 = v13.u32[0];
    if (v13.u32[0] > 1uLL)
    {
      v4 = v10;
      if (v10 >= v12)
        v4 = v10 % v12;
    }
    else
    {
      v4 = (v12 - 1) & v10;
    }
    v15 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v4);
    if (v15)
    {
      for (i = *v15; i; i = *(unsigned __int8 **)i)
      {
        v17 = *((_QWORD *)i + 1);
        if (v17 == v11)
        {
          if ((std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2) & 1) != 0)
            return i;
        }
        else
        {
          if (v14 > 1)
          {
            if (v17 >= v12)
              v17 %= v12;
          }
          else
          {
            v17 &= v12 - 1;
          }
          if (v17 != v4)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>>>::__construct_node_hash<std::string const&,std::unique_ptr<E5RT::BufferObject>>(a1, v11, a3, a4, (uint64_t)v27);
  v18 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v19 = *(float *)(a1 + 32);
  if (!v12 || (float)(v19 * (float)v12) < v18)
  {
    v20 = 1;
    if (v12 >= 3)
      v20 = (v12 & (v12 - 1)) != 0;
    v21 = v20 | (2 * v12);
    v22 = vcvtps_u32_f32(v18 / v19);
    if (v21 <= v22)
      v23 = v22;
    else
      v23 = v21;
    std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__rehash<true>(a1, v23);
    v12 = *(_QWORD *)(a1 + 8);
    if ((v12 & (v12 - 1)) != 0)
    {
      if (v11 >= v12)
        v4 = v11 % v12;
      else
        v4 = v11;
    }
    else
    {
      v4 = (v12 - 1) & v11;
    }
  }
  v24 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v24)
  {
    *(_QWORD *)v27[0] = *v24;
    *v24 = v27[0];
  }
  else
  {
    *(_QWORD *)v27[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v27[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v27[0])
    {
      v25 = *(_QWORD *)(*(_QWORD *)v27[0] + 8);
      if ((v12 & (v12 - 1)) != 0)
      {
        if (v25 >= v12)
          v25 %= v12;
      }
      else
      {
        v25 &= v12 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v25) = v27[0];
    }
  }
  i = (unsigned __int8 *)v27[0];
  v27[0] = 0;
  ++*v9;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>>>>::reset[abi:ne180100]((uint64_t)v27, 0);
  return i;
}

void sub_1A36C0B34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

std::string *std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>>>::__construct_node_hash<std::string const&,std::unique_ptr<E5RT::BufferObject>>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 *a3@<X2>, uint64_t *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  char *v10;
  std::string *result;

  v9 = a1 + 16;
  v10 = (char *)operator new(0x38uLL);
  *(_QWORD *)a5 = v10;
  *(_QWORD *)(a5 + 8) = v9;
  *(_BYTE *)(a5 + 16) = 0;
  *(_QWORD *)v10 = 0;
  *((_QWORD *)v10 + 1) = a2;
  result = std::pair<std::string const,std::shared_ptr<E5RT::BufferObject>>::pair[abi:ne180100]<std::string const&,std::unique_ptr<E5RT::BufferObject>,0>((std::string *)(v10 + 16), a3, a4);
  *(_BYTE *)(a5 + 16) = 1;
  return result;
}

void sub_1A36C0BB8(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

std::string *std::pair<std::string const,std::shared_ptr<E5RT::BufferObject>>::pair[abi:ne180100]<std::string const&,std::unique_ptr<E5RT::BufferObject>,0>(std::string *this, __int128 *a2, uint64_t *a3)
{
  __int128 v5;

  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(this, *(const std::string::value_type **)a2, *((_QWORD *)a2 + 1));
  }
  else
  {
    v5 = *a2;
    this->__r_.__value_.__r.__words[2] = *((_QWORD *)a2 + 2);
    *(_OWORD *)&this->__r_.__value_.__l.__data_ = v5;
  }
  std::shared_ptr<E5RT::BufferObject>::shared_ptr[abi:ne180100]<E5RT::BufferObject,std::default_delete<E5RT::BufferObject>,void>((uint64_t *)&this[1], a3);
  return this;
}

void sub_1A36C0C2C(_Unwind_Exception *exception_object)
{
  uint64_t v1;

  if (*(char *)(v1 + 23) < 0)
    operator delete(*(void **)v1);
  _Unwind_Resume(exception_object);
}

uint64_t *std::shared_ptr<E5RT::BufferObject>::shared_ptr[abi:ne180100]<E5RT::BufferObject,std::default_delete<E5RT::BufferObject>,void>(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;

  v4 = *a2;
  *a1 = *a2;
  if (v4)
  {
    v5 = (_QWORD *)operator new();
    v6 = *a2;
    *v5 = &unk_1E4A3A260;
    v5[1] = 0;
    v5[2] = 0;
    v5[3] = v6;
  }
  else
  {
    v5 = 0;
  }
  a1[1] = (uint64_t)v5;
  *a2 = 0;
  return a1;
}

void std::__shared_ptr_pointer<E5RT::BufferObject  *>::~__shared_ptr_pointer(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  JUMPOUT(0x1A8592B54);
}

uint64_t std::__shared_ptr_pointer<E5RT::BufferObject  *>::__on_zero_shared(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 24);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 8))(result);
  return result;
}

uint64_t std::__shared_ptr_pointer<E5RT::BufferObject  *>::__get_deleter(uint64_t a1, uint64_t a2)
{
    return a1 + 24;
  else
    return 0;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, __int128 **a4)
{
  unint64_t v4;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint8x8_t v12;
  unint64_t v13;
  unsigned __int8 **v14;
  unsigned __int8 *i;
  unint64_t v16;
  float v17;
  float v18;
  _BOOL8 v19;
  unint64_t v20;
  unint64_t v21;
  size_t v22;
  _QWORD *v23;
  unint64_t v24;
  _QWORD v26[3];

  v8 = (_QWORD *)(a1 + 24);
  v9 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 8);
  if (v11)
  {
    v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      v4 = v9;
      if (v9 >= v11)
        v4 = v9 % v11;
    }
    else
    {
      v4 = (v11 - 1) & v9;
    }
    v14 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v4);
    if (v14)
    {
      for (i = *v14; i; i = *(unsigned __int8 **)i)
      {
        v16 = *((_QWORD *)i + 1);
        if (v16 == v10)
        {
          if ((std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2) & 1) != 0)
            return i;
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11)
              v16 %= v11;
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4)
            break;
        }
      }
    }
  }
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(a1, v10, a4, (uint64_t)v26);
  v17 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v18 = *(float *)(a1 + 32);
  if (!v11 || (float)(v18 * (float)v11) < v17)
  {
    v19 = 1;
    if (v11 >= 3)
      v19 = (v11 & (v11 - 1)) != 0;
    v20 = v19 | (2 * v11);
    v21 = vcvtps_u32_f32(v17 / v18);
    if (v20 <= v21)
      v22 = v21;
    else
      v22 = v20;
    std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__rehash<true>(a1, v22);
    v11 = *(_QWORD *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
        v4 = v10 % v11;
      else
        v4 = v10;
    }
    else
    {
      v4 = (v11 - 1) & v10;
    }
  }
  v23 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v23)
  {
    *(_QWORD *)v26[0] = *v23;
    *v23 = v26[0];
  }
  else
  {
    *(_QWORD *)v26[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v26[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v26[0])
    {
      v24 = *(_QWORD *)(*(_QWORD *)v26[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v24 >= v11)
          v24 %= v11;
      }
      else
      {
        v24 &= v11 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v24) = v26[0];
    }
  }
  i = (unsigned __int8 *)v26[0];
  v26[0] = 0;
  ++*v8;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>>>>::reset[abi:ne180100]((uint64_t)v26, 0);
  return i;
}

void sub_1A36C0FB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, ...)
{
  va_list va;

  va_start(va, a4);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>>>::__construct_node_hash<std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 **a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v7;
  _QWORD *v8;
  std::string *v9;
  __int128 *v10;
  __int128 v11;

  v7 = a1 + 16;
  v8 = operator new(0x38uLL);
  *(_QWORD *)a4 = v8;
  *(_QWORD *)(a4 + 8) = v7;
  *(_BYTE *)(a4 + 16) = 0;
  *v8 = 0;
  v8[1] = a2;
  v9 = (std::string *)(v8 + 2);
  v10 = *a3;
  if (*((char *)*a3 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v9, *(const std::string::value_type **)v10, *((_QWORD *)v10 + 1));
  }
  else
  {
    v11 = *v10;
    v8[4] = *((_QWORD *)v10 + 2);
    *(_OWORD *)&v9->__r_.__value_.__l.__data_ = v11;
  }
  v8[5] = 0;
  v8[6] = 0;
  *(_BYTE *)(a4 + 16) = 1;
}

void sub_1A36C1054(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>>>>::reset[abi:ne180100](v1, 0);
  _Unwind_Resume(a1);
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::BufferObject>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t a1, unsigned __int8 *a2, uint64_t a3, __int128 **a4)
{
  unint64_t v4;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint8x8_t v12;
  unint64_t v13;
  unsigned __int8 **v14;
  unsigned __int8 *i;
  unint64_t v16;
  _QWORD *v17;
  __int128 *v18;
  __int128 v19;
  float v20;
  float v21;
  _BOOL8 v22;
  unint64_t v23;
  unint64_t v24;
  size_t v25;
  _QWORD *v26;
  unint64_t v27;
  _QWORD v29[2];
  char v30;

  v8 = (_QWORD *)(a1 + 24);
  v9 = std::__string_hash<char>::operator()[abi:ne180100](a1 + 24, (uint64_t)a2);
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 8);
  if (v11)
  {
    v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    v13 = v12.u32[0];
    if (v12.u32[0] > 1uLL)
    {
      v4 = v9;
      if (v9 >= v11)
        v4 = v9 % v11;
    }
    else
    {
      v4 = (v11 - 1) & v9;
    }
    v14 = *(unsigned __int8 ***)(*(_QWORD *)a1 + 8 * v4);
    if (v14)
    {
      for (i = *v14; i; i = *(unsigned __int8 **)i)
      {
        v16 = *((_QWORD *)i + 1);
        if (v16 == v10)
        {
          if ((std::equal_to<std::string>::operator()[abi:ne180100](a1 + 32, i + 16, a2) & 1) != 0)
            return i;
        }
        else
        {
          if (v13 > 1)
          {
            if (v16 >= v11)
              v16 %= v11;
          }
          else
          {
            v16 &= v11 - 1;
          }
          if (v16 != v4)
            break;
        }
      }
    }
  }
  v17 = operator new(0x38uLL);
  v29[0] = v17;
  v29[1] = a1 + 16;
  *v17 = 0;
  v17[1] = v10;
  v18 = *a4;
  v19 = **a4;
  v17[4] = *((_QWORD *)*a4 + 2);
  *((_OWORD *)v17 + 1) = v19;
  *((_QWORD *)v18 + 1) = 0;
  *((_QWORD *)v18 + 2) = 0;
  *(_QWORD *)v18 = 0;
  v17[5] = 0;
  v17[6] = 0;
  v30 = 1;
  v20 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v21 = *(float *)(a1 + 32);
  if (!v11 || (float)(v21 * (float)v11) < v20)
  {
    v22 = 1;
    if (v11 >= 3)
      v22 = (v11 & (v11 - 1)) != 0;
    v23 = v22 | (2 * v11);
    v24 = vcvtps_u32_f32(v20 / v21);
    if (v23 <= v24)
      v25 = v24;
    else
      v25 = v23;
    std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__rehash<true>(a1, v25);
    v11 = *(_QWORD *)(a1 + 8);
    if ((v11 & (v11 - 1)) != 0)
    {
      if (v10 >= v11)
        v4 = v10 % v11;
      else
        v4 = v10;
    }
    else
    {
      v4 = (v11 - 1) & v10;
    }
  }
  v26 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v26)
  {
    *(_QWORD *)v29[0] = *v26;
    *v26 = v29[0];
  }
  else
  {
    *(_QWORD *)v29[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v29[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = a1 + 16;
    if (*(_QWORD *)v29[0])
    {
      v27 = *(_QWORD *)(*(_QWORD *)v29[0] + 8);
      if ((v11 & (v11 - 1)) != 0)
      {
        if (v27 >= v11)
          v27 %= v11;
      }
      else
      {
        v27 &= v11 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v27) = v29[0];
    }
  }
  i = (unsigned __int8 *)v29[0];
  v29[0] = 0;
  ++*v8;
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>>>>::reset[abi:ne180100]((uint64_t)v29, 0);
  return i;
}

void sub_1A36C12F4(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<E5RT::ProgramFunction>>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void applesauce::CF::convert_to<std::vector<int>,0>(const void *a1@<X0>, std::vector<int> *a2@<X8>)
{
  CFTypeID TypeID;
  applesauce::CF *exception;

  if (!a1 || (TypeID = CFArrayGetTypeID(), TypeID != CFGetTypeID(a1)))
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::convert_error(exception);
  }
  applesauce::CF::details::CFArray_get_value_to<std::vector<int>>((const __CFArray *)a1, a2);
}

void sub_1A36C136C()
{
  void *v0;

  __cxa_throw(v0, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
}

void sub_1A36C1384(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void applesauce::CF::convert_error(applesauce::CF *this)
{
  JUMPOUT(0x1A8592A4CLL);
}

void applesauce::CF::details::CFArray_get_value_to<std::vector<int>>(const __CFArray *a1@<X0>, std::vector<int> *a2@<X8>)
{
  int Count;
  CFIndex v5;
  uint64_t v6;
  const __CFNumber *ValueAtIndex;
  int v8;
  int v9;
  int *value;
  std::vector<int>::pointer end;
  int *v12;
  std::vector<int>::pointer begin;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char *v18;
  int *v19;
  int v20;

  Count = CFArrayGetCount(a1);
  a2->__end_ = 0;
  a2->__end_cap_.__value_ = 0;
  a2->__begin_ = 0;
  std::vector<int>::reserve(a2, Count);
  if (Count >= 1)
  {
    v5 = 0;
    v6 = Count;
    do
    {
      ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(a1, v5);
      v8 = applesauce::CF::convert_to<int,0>(ValueAtIndex);
      v9 = v8;
      end = a2->__end_;
      value = a2->__end_cap_.__value_;
      if (end >= value)
      {
        begin = a2->__begin_;
        v14 = end - a2->__begin_;
        v15 = v14 + 1;
        if ((unint64_t)(v14 + 1) >> 62)
          std::vector<double>::__throw_length_error[abi:ne180100]();
        v16 = (char *)value - (char *)begin;
        if (v16 >> 1 > v15)
          v15 = v16 >> 1;
        if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFFCLL)
          v17 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v17 = v15;
        if (v17)
        {
          v18 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ME_Model::ME_Feature>>((uint64_t)&a2->__end_cap_, v17);
          begin = a2->__begin_;
          end = a2->__end_;
        }
        else
        {
          v18 = 0;
        }
        v19 = (int *)&v18[4 * v14];
        *v19 = v9;
        v12 = v19 + 1;
        while (end != begin)
        {
          v20 = *--end;
          *--v19 = v20;
        }
        a2->__begin_ = v19;
        a2->__end_ = v12;
        a2->__end_cap_.__value_ = (int *)&v18[4 * v17];
        if (begin)
          operator delete(begin);
      }
      else
      {
        *end = v8;
        v12 = end + 1;
      }
      a2->__end_ = v12;
      ++v5;
    }
    while (v5 != v6);
  }
}

void sub_1A36C14E8(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<int>::reserve(std::vector<int> *this, std::vector<int>::size_type __n)
{
  std::__compressed_pair<int *> *p_end_cap;
  int *value;
  int64_t v5;
  char *v6;
  int *v7;
  uint64_t v8;
  int *v9;
  std::vector<int>::pointer begin;
  int *end;
  int *v12;
  int v13;

  value = this->__end_cap_.__value_;
  p_end_cap = &this->__end_cap_;
  if (__n > value - this->__begin_)
  {
    if (__n >> 62)
      std::vector<double>::__throw_length_error[abi:ne180100]();
    v5 = (char *)this->__end_ - (char *)this->__begin_;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ME_Model::ME_Feature>>((uint64_t)p_end_cap, __n);
    v7 = (int *)&v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    v9 = (int *)&v6[4 * v8];
    begin = this->__begin_;
    end = this->__end_;
    v12 = v7;
    if (end != this->__begin_)
    {
      v12 = v7;
      do
      {
        v13 = *--end;
        *--v12 = v13;
      }
      while (end != begin);
    }
    this->__begin_ = v12;
    this->__end_ = v7;
    this->__end_cap_.__value_ = v9;
    if (begin)
      operator delete(begin);
  }
}

uint64_t applesauce::CF::convert_to<int,0>(const __CFNumber *a1)
{
  uint64_t result;
  applesauce::CF *exception;

  result = applesauce::CF::convert_as<int,0>(a1);
  if ((result & 0xFF00000000) == 0)
  {
    exception = (applesauce::CF *)__cxa_allocate_exception(0x10uLL);
    applesauce::CF::convert_error(exception);
  }
  return result;
}

void sub_1A36C15D8()
{
  void *v0;

  __cxa_throw(v0, MEMORY[0x1E0DE4E80], MEMORY[0x1E0DE4338]);
}

void sub_1A36C15F0(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

uint64_t applesauce::CF::convert_as<int,0>(const __CFNumber *a1)
{
  CFTypeID TypeID;

  if (a1 && (TypeID = CFNumberGetTypeID(), TypeID == CFGetTypeID(a1)))
    return applesauce::CF::details::number_convert_as<int>(a1);
  else
    return applesauce::CF::details::treat_as_BOOL_for_convert_as<int>(a1);
}

uint64_t applesauce::CF::details::treat_as_BOOL_for_convert_as<int>(const __CFBoolean *a1)
{
  CFTypeID TypeID;
  uint64_t Value;
  uint64_t v4;

  if (a1 && (TypeID = CFBooleanGetTypeID(), TypeID == CFGetTypeID(a1)))
  {
    Value = CFBooleanGetValue(a1);
    v4 = 0x100000000;
  }
  else
  {
    Value = 0;
    v4 = 0;
  }
  return v4 | Value;
}

uint64_t applesauce::CF::details::number_convert_as<int>(const __CFNumber *a1)
{
  const __CFNumber *v2;
  CFNumberType v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  const __CFNumber *v7;
  CFNumberType v8;
  const __CFNumber *v9;
  CFNumberType v10;
  const __CFNumber *v11;
  CFNumberType v12;
  const __CFNumber *v13;
  CFNumberType v14;
  int Value;
  uint64_t v16;
  unsigned __int8 v17;
  int v18;
  int v19;
  uint64_t v20;
  double valuePtr;

  switch(CFNumberGetType(a1))
  {
    case kCFNumberSInt8Type:
      LOBYTE(valuePtr) = 0;
      v2 = a1;
      v3 = kCFNumberSInt8Type;
      goto LABEL_10;
    case kCFNumberSInt16Type:
      LOWORD(valuePtr) = 0;
      v7 = a1;
      v8 = kCFNumberSInt16Type;
      goto LABEL_17;
    case kCFNumberSInt32Type:
      LODWORD(valuePtr) = 0;
      v9 = a1;
      v10 = kCFNumberSInt32Type;
      goto LABEL_28;
    case kCFNumberSInt64Type:
      valuePtr = 0.0;
      v9 = a1;
      v10 = kCFNumberSInt64Type;
      goto LABEL_28;
    case kCFNumberFloat32Type:
      LODWORD(valuePtr) = 0;
      v11 = a1;
      v12 = kCFNumberFloat32Type;
      goto LABEL_24;
    case kCFNumberFloat64Type:
      valuePtr = 0.0;
      v13 = a1;
      v14 = kCFNumberFloat64Type;
      goto LABEL_30;
    case kCFNumberCharType:
      LOBYTE(valuePtr) = 0;
      v2 = a1;
      v3 = kCFNumberCharType;
LABEL_10:
      Value = CFNumberGetValue(v2, v3, &valuePtr);
      v16 = Value != 0;
      if (Value)
        v17 = LOBYTE(valuePtr);
      else
        v17 = 0;
      v18 = -256;
      if ((v16 & (SLOBYTE(valuePtr) < 0)) == 0)
        v18 = 0;
      v5 = v16 << 32;
      LODWORD(v6) = v18 & 0xFFFFFF00 | v17;
      v4 = v6 & 0xFFFFFF00;
      return v5 | v4 & 0xFFFFFF00 | v6;
    case kCFNumberShortType:
      LOWORD(valuePtr) = 0;
      v7 = a1;
      v8 = kCFNumberShortType;
LABEL_17:
      if (CFNumberGetValue(v7, v8, &valuePtr))
        v6 = SLOWORD(valuePtr) & 0xFFFFFFFFLL | 0x100000000;
      else
        v6 = 0;
      goto LABEL_33;
    case kCFNumberIntType:
      LODWORD(valuePtr) = 0;
      v9 = a1;
      v10 = kCFNumberIntType;
      goto LABEL_28;
    case kCFNumberLongType:
      valuePtr = 0.0;
      v9 = a1;
      v10 = kCFNumberLongType;
      goto LABEL_28;
    case kCFNumberLongLongType:
      valuePtr = 0.0;
      v9 = a1;
      v10 = kCFNumberLongLongType;
      goto LABEL_28;
    case kCFNumberFloatType:
      LODWORD(valuePtr) = 0;
      v11 = a1;
      v12 = kCFNumberFloatType;
LABEL_24:
      v19 = CFNumberGetValue(v11, v12, &valuePtr);
      v20 = (int)*(float *)&valuePtr;
      goto LABEL_31;
    case kCFNumberDoubleType:
      valuePtr = 0.0;
      v13 = a1;
      v14 = kCFNumberDoubleType;
      goto LABEL_30;
    case kCFNumberCFIndexType:
      valuePtr = 0.0;
      v9 = a1;
      v10 = kCFNumberCFIndexType;
      goto LABEL_28;
    case kCFNumberNSIntegerType:
      valuePtr = 0.0;
      v9 = a1;
      v10 = kCFNumberNSIntegerType;
LABEL_28:
      v19 = CFNumberGetValue(v9, v10, &valuePtr);
      v20 = LODWORD(valuePtr);
      goto LABEL_31;
    case kCFNumberCGFloatType:
      valuePtr = 0.0;
      v13 = a1;
      v14 = kCFNumberCGFloatType;
LABEL_30:
      v19 = CFNumberGetValue(v13, v14, &valuePtr);
      v20 = (int)valuePtr;
LABEL_31:
      v6 = v20 | 0x100000000;
      if (!v19)
        v6 = 0;
LABEL_33:
      v4 = v6 & 0xFFFFFF00;
      v5 = v6 & 0x100000000;
      break;
    default:
      v4 = 0;
      v5 = 0;
      LOBYTE(v6) = 0;
      break;
  }
  return v5 | v4 & 0xFFFFFF00 | v6;
}

id predictedMRLModelLabelForString(const void *a1, int a2, void *a3, void *a4, void *a5)
{
  id v9;
  NSDictionary *v10;
  NSString *v11;
  unint64_t OutputSize;
  float *v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  OutputSize = MRLModelGetOutputSize();
  v13 = (float *)operator new[]();
  fillOutputProbabilities(a1, a2, v10, v11, v13);
  if (OutputSize < 2)
  {
    v16 = 1;
  }
  else
  {
    LODWORD(v14) = 0;
    v15 = 1;
    v16 = 1;
    do
    {
      if (v13[v15] > *(float *)&v14)
      {
        v16 = v15;
        *(float *)&v14 = v13[v15];
      }
      ++v15;
    }
    while (OutputSize != v15);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  MEMORY[0x1A8592B3C](v13, 0x1000C8052888210);

  return v18;
}

void sub_1A36C1A40(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void fillOutputProbabilities(const void *a1, int a2, NSDictionary *a3, NSString *a4, float *a5)
{
  uint64_t OutputSize;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  _DWORD *v12;
  uint64_t i;
  void *v14;
  float *v15;
  float *v16;
  uint64_t v17;
  float *v18;
  float *v19;
  float *v20;
  uint64_t j;
  float v22;
  int v23;
  NSString *v24;
  NSDictionary *v25;

  v25 = a3;
  v24 = a4;
  OutputSize = MRLModelGetOutputSize();
  inputSequenceFromSentence(v24, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = a2;
  v10 = objc_msgSend(v9, "count");
  v11 = v10 + 2;
  v12 = (_DWORD *)operator new[]();
  *v12 = 1;
  if (v10)
  {
    for (i = 0; i != v10; ++i)
    {
      objc_msgSend(v9, "objectAtIndex:", i);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12[i + 1] = tokenIDFromTokenAndVocabularyMap(v14, v25);

    }
  }
  v12[v10 + 1] = 2;
  if (OutputSize)
    bzero(a5, 4 * OutputSize);
  if (v23)
  {
    v15 = (float *)operator new[]();
    v16 = v15;
    if (v11 * OutputSize)
      bzero(v15, 4 * v11 * OutputSize);
    MRLModelRecognize();
    if (v10 != -2)
    {
      v17 = 0;
      v18 = v16;
      do
      {
        v19 = v18;
        v20 = a5;
        for (j = OutputSize; j; --j)
        {
          v22 = *v19++;
          *v20 = v22 + *v20;
          ++v20;
        }
        ++v17;
        v18 += OutputSize;
      }
      while (v17 != v11);
    }
    for (; OutputSize; --OutputSize)
    {
      *a5 = *a5 / (float)v11;
      ++a5;
    }
    MEMORY[0x1A8592B3C](v16, 0x1000C8052888210);
  }
  else
  {
    MRLModelRecognize();
  }
  MEMORY[0x1A8592B3C](v12, 0x1000C8052888210);

}

void sub_1A36C1CA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, id a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

id predictedMRLModelLabelHypothesesForString(const void *a1, int a2, void *a3, void *a4, void *a5)
{
  id v9;
  NSDictionary *v10;
  NSString *v11;
  void *v12;
  unint64_t OutputSize;
  float *v14;
  void *v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  NSDictionary *v21;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  OutputSize = MRLModelGetOutputSize();
  v14 = (float *)operator new[]();
  fillOutputProbabilities(a1, a2, v10, v11, v14);
  if (OutputSize >= 2)
  {
    v21 = v10;
    v15 = 0;
    for (i = 1; i != OutputSize; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", i);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14[i]);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v19, v18);

      }
      v15 = v18;
    }

    v10 = v21;
  }
  MEMORY[0x1A8592B3C](v14, 0x1000C8052888210);

  return v12;
}

void sub_1A36C1E70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

uint64_t createMRLModelFromURL(void *a1)
{
  id v1;
  __CFDictionary *Mutable;
  uint64_t v3;

  v1 = a1;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0D50580], (const void *)objc_msgSend(v1, "path"));
  v3 = MRLModelCreate();
  CFRelease(Mutable);

  return v3;
}

void sub_1A36C1F5C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t createMRLModelFromData(void *a1)
{
  id v1;
  __CFDictionary *Mutable;
  uint64_t v3;

  v1 = a1;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x1E0D50570], v1);
  v3 = MRLModelCompile();
  MRLModelSetMaxSequenceLength();
  CFRelease(Mutable);

  return v3;
}

void sub_1A36C1FFC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id dataFromMRLModel()
{
  return (id)MRLModelCopyQuantizedSerializedData();
}

id tagForNLTag(void *a1)
{
  id v1;
  void *v2;
  id v3;

  v1 = a1;
  v2 = v1;
  if (tagForNLTag_onceToken == -1)
  {
    if (v1)
      goto LABEL_3;
LABEL_6:
    v3 = 0;
    goto LABEL_7;
  }
  dispatch_once(&tagForNLTag_onceToken, &__block_literal_global_140);
  if (!v2)
    goto LABEL_6;
LABEL_3:
  objc_msgSend((id)tagForNLTag_tagDictionary, "objectForKey:", v2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (!v3)
    v3 = v2;
LABEL_7:

  return v3;
}

void sub_1A36C46DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

id _NSPathForSystemFramework(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "count");
  if (v4)
  {
    v5 = 0;
    while (1)
    {
      objc_msgSend(v3, "objectAtIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("Frameworks"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByAppendingPathComponent:", v1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v2, "fileExistsAtPath:", v8) & 1) != 0)
        break;
      objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("PrivateFrameworks"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringByAppendingPathComponent:", v1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v2, "fileExistsAtPath:", v10))
      {
        v8 = v10;
        break;
      }

      if (v4 == (id)++v5)
      {
        v4 = 0;
        goto LABEL_9;
      }
    }
    v4 = v8;

  }
LABEL_9:

  return v4;
}

void sub_1A36C5354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __tagForNLTag_block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[40];
  _QWORD v3[41];

  v3[40] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("Word");
  v2[1] = CFSTR("Punctuation");
  v3[0] = CFSTR("Word");
  v3[1] = CFSTR("Punctuation");
  v2[2] = CFSTR("Whitespace");
  v2[3] = CFSTR("Other");
  v3[2] = CFSTR("Whitespace");
  v3[3] = CFSTR("Other");
  v2[4] = CFSTR("Noun");
  v2[5] = CFSTR("Verb");
  v3[4] = CFSTR("Noun");
  v3[5] = CFSTR("Verb");
  v2[6] = CFSTR("Adjective");
  v2[7] = CFSTR("Adverb");
  v3[6] = CFSTR("Adjective");
  v3[7] = CFSTR("Adverb");
  v2[8] = CFSTR("Pronoun");
  v2[9] = CFSTR("Determiner");
  v3[8] = CFSTR("Pronoun");
  v3[9] = CFSTR("Determiner");
  v2[10] = CFSTR("Particle");
  v2[11] = CFSTR("Preposition");
  v3[10] = CFSTR("Particle");
  v3[11] = CFSTR("Preposition");
  v2[12] = CFSTR("Number");
  v2[13] = CFSTR("Conjunction");
  v3[12] = CFSTR("Number");
  v3[13] = CFSTR("Conjunction");
  v2[14] = CFSTR("Interjection");
  v2[15] = CFSTR("Classifier");
  v3[14] = CFSTR("Interjection");
  v3[15] = CFSTR("Classifier");
  v2[16] = CFSTR("Idiom");
  v2[17] = CFSTR("OtherWord");
  v3[16] = CFSTR("Idiom");
  v3[17] = CFSTR("OtherWord");
  v2[18] = CFSTR("SentenceTerminator");
  v2[19] = CFSTR("OpenQuote");
  v3[18] = CFSTR("SentenceTerminator");
  v3[19] = CFSTR("OpenQuote");
  v2[20] = CFSTR("CloseQuote");
  v2[21] = CFSTR("OpenParenthesis");
  v3[20] = CFSTR("CloseQuote");
  v3[21] = CFSTR("OpenParenthesis");
  v2[22] = CFSTR("CloseParenthesis");
  v2[23] = CFSTR("WordJoiner");
  v3[22] = CFSTR("CloseParenthesis");
  v3[23] = CFSTR("WordJoiner");
  v2[24] = CFSTR("Dash");
  v2[25] = CFSTR("Punctuation");
  v3[24] = CFSTR("Dash");
  v3[25] = CFSTR("Punctuation");
  v2[26] = CFSTR("ParagraphBreak");
  v2[27] = CFSTR("Whitespace");
  v3[26] = CFSTR("ParagraphBreak");
  v3[27] = CFSTR("Whitespace");
  v2[28] = CFSTR("PersonalName");
  v2[29] = CFSTR("PlaceName");
  v3[28] = CFSTR("PersonalName");
  v3[29] = CFSTR("PlaceName");
  v2[30] = CFSTR("OrganizationName");
  v2[31] = 0x1E4A3CD30;
  v3[30] = CFSTR("OrganizationName");
  v3[31] = CFSTR("1.0");
  v2[32] = 0x1E4A3CD50;
  v2[33] = CFSTR("Anger");
  v3[32] = CFSTR("-1.0");
  v3[33] = CFSTR("Anger");
  v2[34] = CFSTR("Fear");
  v2[35] = CFSTR("Happiness");
  v3[34] = CFSTR("Fear");
  v3[35] = CFSTR("Happiness");
  v2[36] = CFSTR("Love");
  v2[37] = CFSTR("Sadness");
  v3[36] = CFSTR("Love");
  v3[37] = CFSTR("Sadness");
  v2[38] = CFSTR("Surprise");
  v2[39] = CFSTR("OtherEmotion");
  v3[38] = CFSTR("Surprise");
  v3[39] = CFSTR("OtherEmotion");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 40);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)tagForNLTag_tagDictionary;
  tagForNLTag_tagDictionary = v0;

}

void ___loadTextInput_block_invoke()
{
  void *v0;
  void *v1;
  char *v2;
  id v3;

  _NSPathForSystemFramework(CFSTR("TextInput.framework"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("TextInput"));
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v1 = dlopen((const char *)objc_msgSend(objc_retainAutorelease(v3), "fileSystemRepresentation"), 256);
    if (v1)
    {
      _TILinguisticAssetDownloadClient = (uint64_t)NSClassFromString(CFSTR("TILinguisticAssetDownloadClient"));
      if (!_TILinguisticAssetDownloadClient)
        goto LABEL_8;
    }
    else if (!_TILinguisticAssetDownloadClient)
    {
LABEL_8:
      v2 = dlerror();
      goto LABEL_9;
    }
  }
  else if (!_TILinguisticAssetDownloadClient)
  {
    v1 = 0;
    v2 = "nil libraryPath";
LABEL_9:
    NSLog(CFSTR("Failed to load TextInput, handle %p class %p error %s"), v1, 0, v2);
  }

}

uint64_t createMaxEntModelFromTrainingDataSet(void *a1, void *a2, unint64_t a3)
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  unint64_t j;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  double Current;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v33;
  unint64_t v34;
  void *v35;
  void *v36;
  NSDictionary *v37;
  NSDictionary *v38;
  id v39;
  void *v40;
  id v41;
  _QWORD v42[4];
  id v43;
  unint64_t v44;
  std::string v45;
  std::string __p;
  uint64_t v47;
  _QWORD v48[6];

  v48[4] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v39 = a2;
  objc_msgSend(v5, "labelMap");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "inverseLabelMap");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vocabularyMap");
  v37 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "documentFrequencyMap");
  v38 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataProviderOfType:", 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataProviderOfType:", 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v33;
  v6 = operator new();
  *(_OWORD *)(v6 + 80) = 0u;
  *(_OWORD *)(v6 + 96) = 0u;
  *(_QWORD *)(v6 + 56) = 0;
  *(_QWORD *)(v6 + 64) = 0;
  *(_QWORD *)(v6 + 48) = 0;
  *(_DWORD *)(v6 + 72) = 0;
  *(_DWORD *)(v6 + 112) = 1065353216;
  *(_OWORD *)(v6 + 152) = 0u;
  *(_OWORD *)(v6 + 168) = 0u;
  *(_QWORD *)(v6 + 128) = 0;
  *(_QWORD *)(v6 + 136) = 0;
  *(_QWORD *)(v6 + 120) = 0;
  *(_DWORD *)(v6 + 144) = 0;
  *(_DWORD *)(v6 + 184) = 1065353216;
  *(_OWORD *)(v6 + 192) = 0u;
  *(_OWORD *)(v6 + 208) = 0u;
  *(_OWORD *)(v6 + 224) = 0u;
  *(_QWORD *)(v6 + 240) = 0;
  *(_DWORD *)(v6 + 248) = 1065353216;
  *(_QWORD *)(v6 + 264) = 0;
  *(_QWORD *)(v6 + 272) = 0;
  *(_QWORD *)(v6 + 256) = 0;
  *(_DWORD *)v6 = 0;
  *(_DWORD *)(v6 + 24) = 0;
  *(_QWORD *)(v6 + 32) = 0;
  *(_QWORD *)(v6 + 40) = 0;
  *(_OWORD *)(v6 + 288) = 0u;
  *(_OWORD *)(v6 + 304) = 0u;
  *(_OWORD *)(v6 + 320) = 0u;
  *(_OWORD *)(v6 + 336) = 0u;
  *(_OWORD *)(v6 + 352) = 0u;
  *(_OWORD *)(v6 + 368) = 0u;
  *(_QWORD *)(v6 + 432) = 0;
  *(_OWORD *)(v6 + 400) = 0u;
  *(_OWORD *)(v6 + 416) = 0u;
  v7 = objc_msgSend(v41, "numberOfInstances");
  objc_msgSend(v36, "numberOfInstances");
  if (v7)
  {
    for (i = 0; i != v7; ++i)
    {
      objc_msgSend(v41, "instanceAtIndex:", i);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v9, "label");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v10, "tokens");
          v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
          createSample(v13, v37, v38, (NSDictionary *)v7, (uint64_t)&__p);

          std::to_string(&v45, objc_msgSend(v12, "unsignedIntegerValue"));
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
            operator delete(__p.__r_.__value_.__l.__data_);
          __p = v45;
          ME_Model::add_training_sample((ME_Model *)v6, (const ME_Sample *)&__p);
          reportInstanceCompletionToTrainer(v39, i, v7, 2);
          v45.__r_.__value_.__r.__words[0] = (std::string::size_type)v48;
          std::vector<std::pair<std::string,double>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v45);
          v45.__r_.__value_.__r.__words[0] = (std::string::size_type)&v47;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v45);
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
            operator delete(__p.__r_.__value_.__l.__data_);
        }

      }
    }
  }
  *(_QWORD *)(v6 + 40) = 0x3FF0000000000000;
  *(_DWORD *)(v6 + 24) = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Starting MaxEnt training with %llu samples"), v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "logMessage:", v14);

  v15 = v7 / 0x4E20 + 10;
  if (v15 >= a3)
    v15 = a3;
  v34 = v15;
  v16 = (void *)MEMORY[0x1A8592E0C]();
  NLGetLogCategory(0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "internal");
  v18 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    LODWORD(__p.__r_.__value_.__l.__data_) = 134217984;
    *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = 0;
    _os_log_impl(&dword_1A36A7000, v18, OS_LOG_TYPE_INFO, "event: %lu", (uint8_t *)&__p, 0xCu);
  }

  objc_autoreleasePoolPop(v16);
  for (j = 0; j < objc_msgSend(&unk_1E4A47DA0, "count"); ++j)
  {
    v20 = (void *)MEMORY[0x1A8592E0C]();
    NLGetLogCategory(0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "internal");
    v22 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(&unk_1E4A47DA0, "objectAtIndexedSubscript:", j);
      v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v24 = objc_msgSend(v23, "UTF8String");
      LODWORD(__p.__r_.__value_.__l.__data_) = 134218498;
      *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = 1;
      WORD2(__p.__r_.__value_.__r.__words[1]) = 2048;
      *(std::string::size_type *)((char *)&__p.__r_.__value_.__r.__words[1] + 6) = j;
      HIWORD(__p.__r_.__value_.__r.__words[2]) = 2082;
      v47 = v24;
      _os_log_impl(&dword_1A36A7000, v22, OS_LOG_TYPE_INFO, "event: %lu, column: %lu, value: %{public}s", (uint8_t *)&__p, 0x20u);

    }
    objc_autoreleasePoolPop(v20);
  }
  Current = CFAbsoluteTimeGetCurrent();
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __createMaxEntModelFromTrainingDataSet_block_invoke;
  v42[3] = &unk_1E4A3AB88;
  v26 = v39;
  v43 = v26;
  v44 = v34;
  v27 = ME_Model::train((ME_Model *)v6, (uint64_t)v42);
  v28 = (void *)MEMORY[0x1A8592E0C](v27);
  NLGetLogCategory(0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "internal");
  v30 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    LODWORD(__p.__r_.__value_.__l.__data_) = 134217984;
    *(std::string::size_type *)((char *)__p.__r_.__value_.__r.__words + 4) = 3;
    _os_log_impl(&dword_1A36A7000, v30, OS_LOG_TYPE_INFO, "event: %lu", (uint8_t *)&__p, 0xCu);
  }

  objc_autoreleasePoolPop(v28);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Finished MaxEnt training in %.2f seconds"), CFAbsoluteTimeGetCurrent() - Current);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "logMessage:", v31);

  return v6;
}

void sub_1A36C60BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,void *a26)
{
  void *v26;

  _Unwind_Resume(a1);
}

void createSample(NSArray *a1@<X0>, NSDictionary *a2@<X1>, NSDictionary *a3@<X2>, NSDictionary *a4@<X3>, uint64_t a5@<X8>)
{
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  void *v38;
  double v39;
  NSDictionary *v40;
  NSArray *v41;
  NSArray *obj;
  NSDictionary *v43;
  NSDictionary *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  std::string v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v41 = a1;
  v44 = a2;
  v43 = a3;
  std::string::basic_string[abi:ne180100]<0>((_QWORD *)a5, "");
  *(_OWORD *)(a5 + 56) = 0u;
  *(_OWORD *)(a5 + 40) = 0u;
  *(_OWORD *)(a5 + 24) = 0u;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v41;
  v11 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v55 != v12)
          objc_enumerationMutation(obj);
        v14 = tokenIDFromTokenAndVocabularyMap(*(void **)(*((_QWORD *)&v54 + 1) + 8 * i), v44);
        if (v14 != 3)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKey:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "unsignedIntegerValue");

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17 + 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKey:", v18, v15);

        }
      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    }
    while (v11);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  objc_msgSend(v9, "allKeys");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v51;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v51 != v21)
          objc_enumerationMutation(v19);
        v23 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * j);
        objc_msgSend(v9, "objectForKey:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKey:](v43, "objectForKey:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "doubleValue");
        v27 = v26;
        if (v25)
          objc_msgSend(v25, "doubleValue");
        else
          v28 = 1.0;
        if (v28 >= 1.0)
          v29 = v28;
        else
          v29 = 1.0;
        if (v27 >= 1.0)
          v30 = v27 + 1.0;
        else
          v30 = 2.0;
        v31 = log(v30);
        v32 = log((double)(unint64_t)v40 / v29);
        std::to_string(&v49, objc_msgSend(v23, "unsignedIntegerValue"));
        ME_Sample::add_feature((uint64_t *)a5, (uint64_t)&v49, v31 * v32);
        if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v49.__r_.__value_.__l.__data_);

      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    }
    while (v20);
  }

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend(v10, "allKeys");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
  if (v34)
  {
    v35 = *(_QWORD *)v46;
    do
    {
      for (k = 0; k != v34; ++k)
      {
        if (*(_QWORD *)v46 != v35)
          objc_enumerationMutation(v33);
        v37 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * k);
        objc_msgSend(v10, "objectForKey:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        std::to_string(&v49, objc_msgSend(v37, "unsignedIntegerValue") + 98304);
        objc_msgSend(v38, "doubleValue");
        ME_Sample::add_feature((uint64_t *)a5, (uint64_t)&v49, v39);
        if (SHIBYTE(v49.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v49.__r_.__value_.__l.__data_);

      }
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
    }
    while (v34);
  }

}

void sub_1A36C6658(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  void **v29;
  void *v30;
  void *v31;
  void *v32;

  ME_Sample::~ME_Sample(v29);
  _Unwind_Resume(a1);
}

void __createMaxEntModelFromTrainingDataSet_block_invoke(uint64_t a1, uint64_t a2, int a3, float a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "logMessage:", v8);

  v9 = (void *)MEMORY[0x1A8592E0C]();
  NLGetLogCategory(0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "internal");
  v11 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = *(_QWORD *)(a1 + 40) - a3 + 1;
    v16 = 134218496;
    v17 = 2;
    v18 = 2048;
    v19 = 0;
    v20 = 2048;
    v21 = *(double *)&v12;
    _os_log_impl(&dword_1A36A7000, v11, OS_LOG_TYPE_INFO, "event: %lu, column: %lu, value: %ld", (uint8_t *)&v16, 0x20u);
  }

  objc_autoreleasePoolPop(v9);
  v13 = (void *)MEMORY[0x1A8592E0C]();
  NLGetLogCategory(0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "internal");
  v15 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = 134218496;
    v17 = 2;
    v18 = 2048;
    v19 = 1;
    v20 = 2048;
    v21 = a4;
    _os_log_impl(&dword_1A36A7000, v15, OS_LOG_TYPE_INFO, "event: %lu, column: %lu, value: %f", (uint8_t *)&v16, 0x20u);
  }

  objc_autoreleasePoolPop(v13);
}

void sub_1A36C6950(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id predictedMaxEntModelLabelForString(ME_Model *a1, void *a2, void *a3, void *a4, NSDictionary *a5, void *a6)
{
  id v11;
  NSDictionary *v12;
  NSDictionary *v13;
  NSArray *v14;
  void **v15;
  void *v16;
  void *v17;
  void *__p[3];
  void *v20[2];
  char v21;
  uint64_t v22;
  uint64_t v23;
  void **v24;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  inputSequenceFromSentence(a6, 0);
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  createSample(v14, v12, v13, a5, (uint64_t)v20);
  ME_Model::classify(a1, (ME_Sample *)v20, __p);
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  if (v21 >= 0)
    v15 = v20;
  else
    v15 = (void **)v20[0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", strtoul((const char *)v15, 0, 10));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void **)&v23;
  std::vector<std::pair<std::string,double>>::__destroy_vector::operator()[abi:ne180100](&v24);
  v24 = (void **)&v22;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v24);
  if (v21 < 0)
    operator delete(v20[0]);

  return v17;
}

void sub_1A36C6ABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  va_list va;

  va_start(va, a5);

  ME_Sample::~ME_Sample((void **)va);
  _Unwind_Resume(a1);
}

id predictedMaxEntModelLabelHypothesesForString(ME_Model *a1, void *a2, void *a3, void *a4, NSDictionary *a5, void *a6)
{
  id v11;
  NSDictionary *v12;
  NSArray *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  __int128 *v17;
  __int128 v18;
  std::string *v19;
  void *v20;
  void *v21;
  void *v22;
  NSDictionary *v24;
  std::string v25;
  void *__p;
  _BYTE *v27;
  void *v28[2];
  char v29;
  uint64_t v30;
  uint64_t v31;

  v11 = a2;
  v12 = a3;
  v24 = a4;
  inputSequenceFromSentence(a6, 0);
  v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
  createSample(v13, v12, v24, a5, (uint64_t)v28);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  ME_Model::classify(a1, (ME_Sample *)v28, &__p);
  if ((int)((unint64_t)(v27 - (_BYTE *)__p) >> 3) >= 1)
  {
    v15 = 0;
    v16 = 0;
    do
    {
      v17 = (__int128 *)(*((_QWORD *)a1 + 15) + v15);
      if (*((char *)v17 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v25, *(const std::string::value_type **)v17, *((_QWORD *)v17 + 1));
      }
      else
      {
        v18 = *v17;
        v25.__r_.__value_.__r.__words[2] = *((_QWORD *)v17 + 2);
        *(_OWORD *)&v25.__r_.__value_.__l.__data_ = v18;
      }
      if ((v25.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v19 = &v25;
      else
        v19 = (std::string *)v25.__r_.__value_.__r.__words[0];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", strtoul((const char *)v19, 0, 10));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)__p + v16));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKey:", v22, v21);

      }
      if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v25.__r_.__value_.__l.__data_);
      ++v16;
      v15 += 24;
    }
    while (v16 < (int)((unint64_t)(v27 - (_BYTE *)__p) >> 3));
  }
  if (__p)
  {
    v27 = __p;
    operator delete(__p);
  }
  __p = &v31;
  std::vector<std::pair<std::string,double>>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  __p = &v30;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
  if (v29 < 0)
    operator delete(v28[0]);

  return v14;
}

void sub_1A36C6D14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, void *a10, void *a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,void *a21)
{
  void *v21;
  void *v22;
  void *v23;

  ME_Sample::~ME_Sample(&a21);
  _Unwind_Resume(a1);
}

uint64_t createMaxEntModelFromData(void *a1)
{
  id v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  double *v6;
  void *v7;
  void *v8;
  char *v9;
  double *v10;
  unsigned int *v11;
  unint64_t v12;
  unsigned int v13;
  int v14;
  char *v15;
  int v16;
  unsigned int v17;
  id v19;

  v1 = objc_retainAutorelease(a1);
  v2 = objc_msgSend(v1, "bytes");
  v3 = objc_msgSend(v1, "length");
  v4 = operator new();
  v5 = v3 >> 3;
  *(_OWORD *)(v4 + 80) = 0u;
  *(_OWORD *)(v4 + 96) = 0u;
  *(_QWORD *)(v4 + 56) = 0;
  *(_QWORD *)(v4 + 64) = 0;
  *(_QWORD *)(v4 + 48) = 0;
  *(_DWORD *)(v4 + 72) = 0;
  *(_DWORD *)(v4 + 112) = 1065353216;
  *(_OWORD *)(v4 + 152) = 0u;
  *(_OWORD *)(v4 + 168) = 0u;
  *(_QWORD *)(v4 + 128) = 0;
  *(_QWORD *)(v4 + 136) = 0;
  *(_QWORD *)(v4 + 120) = 0;
  *(_DWORD *)(v4 + 144) = 0;
  *(_DWORD *)(v4 + 184) = 1065353216;
  *(_OWORD *)(v4 + 192) = 0u;
  *(_OWORD *)(v4 + 208) = 0u;
  *(_OWORD *)(v4 + 224) = 0u;
  *(_QWORD *)(v4 + 240) = 0;
  *(_DWORD *)(v4 + 248) = 1065353216;
  *(_QWORD *)(v4 + 264) = 0;
  *(_QWORD *)(v4 + 272) = 0;
  *(_QWORD *)(v4 + 256) = 0;
  *(_DWORD *)v4 = 0;
  *(_DWORD *)(v4 + 24) = 0;
  *(_QWORD *)(v4 + 32) = 0;
  *(_QWORD *)(v4 + 40) = 0;
  *(_OWORD *)(v4 + 288) = 0u;
  *(_OWORD *)(v4 + 304) = 0u;
  *(_OWORD *)(v4 + 320) = 0u;
  *(_OWORD *)(v4 + 336) = 0u;
  *(_OWORD *)(v4 + 352) = 0u;
  *(_OWORD *)(v4 + 368) = 0u;
  *(_QWORD *)(v4 + 432) = 0;
  *(_OWORD *)(v4 + 400) = 0u;
  *(_OWORD *)(v4 + 416) = 0u;
  v6 = (double *)malloc_type_calloc((v3 >> 3) + 1, 0x18uLL, 0x10100403CCBF1C1uLL);
  v7 = malloc_type_calloc((v3 >> 3) + 1, 0xCuLL, 0x32E0DBC9uLL);
  v8 = v7;
  if (v3 >= 8)
  {
    v19 = v1;
    if (v5 <= 1)
      v5 = 1;
    v10 = v6 + 2;
    v11 = (unsigned int *)(v2 + 4);
    v12 = v5;
    v9 = (char *)v7;
    do
    {
      v13 = *(v11 - 1);
      v14 = v13 & 0xFFFFFF;
      *((_QWORD *)v10 - 2) = v9;
      v15 = &v9[snprintf(v9, 4uLL, "%u", HIBYTE(v13)) + 1];
      *((_QWORD *)v10 - 1) = v15;
      v16 = snprintf(v15, 8uLL, "%u", v14);
      v17 = *v11;
      v11 += 2;
      v9 = &v15[v16 + 1];
      *v10 = COERCE_FLOAT(bswap32(v17));
      v10 += 3;
      --v12;
    }
    while (v12);
    v1 = v19;
  }
  else
  {
    v5 = 0;
    v9 = (char *)v7;
  }
  *(_QWORD *)&v6[3 * v5] = v9;
  *(_DWORD *)v9 = 3092271;
  ME_Model::load_from_array(v4, (uint64_t)v6);
  free(v6);
  free(v8);

  return v4;
}

void sub_1A36C6FB8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

id dataFromMaxEntModel(_QWORD *a1)
{
  id v1;
  uint64_t v2;
  uint64_t *v3;
  _DWORD *v4;
  double v5;
  std::string *v6;
  int v7;
  std::string *p_p;
  unsigned int v9;
  unsigned int v12;
  std::string __p;
  std::string v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;

  v16 = (uint64_t)&v16;
  v17 = &v16;
  v18 = 0;
  ME_Model::get_features(a1, &v16);
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 8 * v18);
  v1 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v2 = objc_msgSend(v1, "mutableBytes");
  v3 = v17;
  if (v17 != &v16)
  {
    v4 = (_DWORD *)(v2 + 4);
    do
    {
      if (*((char *)v3 + 39) < 0)
        std::string::__init_copy_ctor_external(&v15, (const std::string::value_type *)v3[2], v3[3]);
      else
        v15 = *(std::string *)(v3 + 2);
      if (*((char *)v3 + 63) < 0)
        std::string::__init_copy_ctor_external(&__p, (const std::string::value_type *)v3[5], v3[6]);
      else
        __p = *(std::string *)(v3 + 5);
      v5 = *((double *)v3 + 8);
      if ((v15.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v6 = &v15;
      else
        v6 = (std::string *)v15.__r_.__value_.__r.__words[0];
      v7 = strtoul((const char *)v6, 0, 10);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      v9 = strtoul((const char *)p_p, 0, 10);
      if ((v7 - 1) <= 0xFE && v9 != 0 && HIBYTE(v9) == 0)
      {
        *(float *)&v12 = v5;
        *(v4 - 1) = v9 | (v7 << 24);
        *v4 = bswap32(v12);
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v15.__r_.__value_.__l.__data_);
      v3 = (uint64_t *)v3[1];
      v4 += 2;
    }
    while (v3 != &v16);
  }
  std::__list_imp<std::pair<std::pair<std::string,std::string>,double>>::clear(&v16);
  return v1;
}

void sub_1A36C7178(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18, uint64_t a19)
{
  void *v19;

  std::__list_imp<std::pair<std::pair<std::string,std::string>,double>>::clear(&a19);

  _Unwind_Resume(a1);
}

ME_Model *releaseMaxEntModel(ME_Model *result)
{
  if (result)
  {
    ME_Model::~ME_Model(result);
    JUMPOUT(0x1A8592B54);
  }
  return result;
}

uint64_t std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::__deallocate_node(a1, *(void ***)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::vector<ME_Model::Sample>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v1;
  _QWORD *v2;
  _QWORD *v4;
  void *v5;

  v1 = *a1;
  v2 = **a1;
  if (v2)
  {
    v4 = v1[1];
    v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 10;
        std::__destroy_at[abi:ne180100]<ME_Model::Sample,0>(v4);
      }
      while (v4 != v2);
      v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void ME_Sample::add_feature(uint64_t *a1, uint64_t a2, double a3)
{
  unint64_t v5;
  unint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  int v18;
  std::string __p;
  double v20;
  _QWORD v21[5];

  if (*(char *)(a2 + 23) < 0)
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)a2, *(_QWORD *)(a2 + 8));
  else
    __p = *(std::string *)a2;
  v20 = a3;
  v5 = a1[8];
  v6 = a1[7];
  if (v6 >= v5)
  {
    v8 = a1[6];
    v9 = (uint64_t)(v6 - v8) >> 5;
    v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 59)
      std::vector<double>::__throw_length_error[abi:ne180100]();
    v11 = v5 - v8;
    if (v11 >> 4 > v10)
      v10 = v11 >> 4;
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFE0)
      v12 = 0x7FFFFFFFFFFFFFFLL;
    else
      v12 = v10;
    v21[4] = a1 + 8;
    v13 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<std::string,double>>>((uint64_t)(a1 + 8), v12);
    v14 = &v13[32 * v9];
    v21[0] = v13;
    v21[1] = v14;
    v21[3] = &v13[32 * v15];
    v16 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    *((_QWORD *)v14 + 2) = *((_QWORD *)&__p.__r_.__value_.__l + 2);
    *(_OWORD *)v14 = v16;
    memset(&__p, 0, sizeof(__p));
    *((double *)v14 + 3) = v20;
    v21[2] = v14 + 32;
    std::vector<std::pair<std::string,double>>::__swap_out_circular_buffer(a1 + 6, v21);
    v17 = a1[7];
    std::__split_buffer<std::pair<std::string,double>>::~__split_buffer((uint64_t)v21);
    v18 = SHIBYTE(__p.__r_.__value_.__r.__words[2]);
    a1[7] = v17;
    if (v18 < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  else
  {
    v7 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
    *(_QWORD *)(v6 + 16) = *((_QWORD *)&__p.__r_.__value_.__l + 2);
    *(_OWORD *)v6 = v7;
    *(double *)(v6 + 24) = v20;
    a1[7] = v6 + 32;
  }
}

void sub_1A36C73D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, uint64_t a15, uint64_t a16, char a17)
{
  std::__split_buffer<std::pair<std::string,double>>::~__split_buffer((uint64_t)&a17);
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(a1);
}

uint64_t std::vector<std::pair<std::string,double>>::__swap_out_circular_buffer(uint64_t *a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::pair<std::string,double>>,std::reverse_iterator<std::pair<std::string,double>*>,std::reverse_iterator<std::pair<std::string,double>*>,std::reverse_iterator<std::pair<std::string,double>*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v5;
  v6 = *a1;
  *a1 = v5;
  a2[1] = v6;
  v7 = a1[1];
  a1[1] = a2[2];
  a2[2] = v7;
  v8 = a1[2];
  a1[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

uint64_t std::__uninitialized_allocator_move_if_noexcept[abi:ne180100]<std::allocator<std::pair<std::string,double>>,std::reverse_iterator<std::pair<std::string,double>*>,std::reverse_iterator<std::pair<std::string,double>*>,std::reverse_iterator<std::pair<std::string,double>*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  _QWORD v12[3];
  char v13;
  __int128 v14;
  __int128 v15;

  v7 = a7;
  *(_QWORD *)&v15 = a6;
  *((_QWORD *)&v15 + 1) = a7;
  v14 = v15;
  v12[0] = a1;
  v12[1] = &v14;
  v12[2] = &v15;
  if (a3 == a5)
  {
    v10 = a6;
  }
  else
  {
    v8 = a7;
    do
    {
      v9 = *(_OWORD *)(a3 - 32);
      *(_QWORD *)(v8 - 16) = *(_QWORD *)(a3 - 16);
      *(_OWORD *)(v8 - 32) = v9;
      *(_QWORD *)(a3 - 24) = 0;
      *(_QWORD *)(a3 - 16) = 0;
      *(_QWORD *)(a3 - 32) = 0;
      *(_QWORD *)(v8 - 8) = *(_QWORD *)(a3 - 8);
      v8 -= 32;
      v7 -= 32;
      a3 -= 32;
    }
    while (a3 != a5);
    *((_QWORD *)&v15 + 1) = v8;
    v10 = v15;
  }
  v13 = 1;
  std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,double>>,std::reverse_iterator<std::pair<std::string,double>*>>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v12);
  return v10;
}

uint64_t std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,double>>,std::reverse_iterator<std::pair<std::string,double>*>>>::~__exception_guard_exceptions[abi:ne180100](uint64_t a1)
{
  if (!*(_BYTE *)(a1 + 24))
    std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,double>>,std::reverse_iterator<std::pair<std::string,double>*>>::operator()[abi:ne180100](a1);
  return a1;
}

void std::_AllocatorDestroyRangeReverse<std::allocator<std::pair<std::string,double>>,std::reverse_iterator<std::pair<std::string,double>*>>::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 16) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 8) + 8);
  while (v1 != v2)
  {
    if (*(char *)(v1 + 23) < 0)
      operator delete(*(void **)v1);
    v1 += 32;
  }
}

uint64_t std::__split_buffer<std::pair<std::string,double>>::~__split_buffer(uint64_t a1)
{
  std::__split_buffer<std::pair<std::string,double>>::__destruct_at_end[abi:ne180100](a1, *(void ***)(a1 + 8));
  if (*(_QWORD *)a1)
    operator delete(*(void **)a1);
  return a1;
}

void std::__split_buffer<std::pair<std::string,double>>::__destruct_at_end[abi:ne180100](uint64_t a1, void **a2)
{
  void **v2;
  void **v5;

  v2 = *(void ***)(a1 + 16);
  if (v2 != a2)
  {
    do
    {
      v5 = v2 - 4;
      *(_QWORD *)(a1 + 16) = v2 - 4;
      if (*((char *)v2 - 9) < 0)
      {
        operator delete(*v5);
        v5 = *(void ***)(a1 + 16);
      }
      v2 = v5;
    }
    while (v5 != a2);
  }
}

void ME_Model::~ME_Model(ME_Model *this)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void **v7;

  v2 = (void *)*((_QWORD *)this + 51);
  if (v2)
  {
    *((_QWORD *)this + 52) = v2;
    operator delete(v2);
  }
  v7 = (void **)((char *)this + 360);
  std::vector<ME_Model::Sample>::__destroy_vector::operator()[abi:ne180100](&v7);
  v7 = (void **)((char *)this + 336);
  std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100](&v7);
  v3 = (void *)*((_QWORD *)this + 39);
  if (v3)
  {
    *((_QWORD *)this + 40) = v3;
    operator delete(v3);
  }
  v4 = (void *)*((_QWORD *)this + 36);
  if (v4)
  {
    *((_QWORD *)this + 37) = v4;
    operator delete(v4);
  }
  v5 = (void *)*((_QWORD *)this + 32);
  if (v5)
  {
    *((_QWORD *)this + 33) = v5;
    operator delete(v5);
  }
  std::__hash_table<std::__hash_value_type<unsigned int,int>,std::__unordered_map_hasher<unsigned int,std::__hash_value_type<unsigned int,int>,std::hash<unsigned int>,std::equal_to<unsigned int>,true>,std::__unordered_map_equal<unsigned int,std::__hash_value_type<unsigned int,int>,std::equal_to<unsigned int>,std::hash<unsigned int>,true>,std::allocator<std::__hash_value_type<unsigned int,int>>>::~__hash_table((uint64_t)this + 216);
  v6 = (void *)*((_QWORD *)this + 24);
  if (v6)
  {
    *((_QWORD *)this + 25) = v6;
    operator delete(v6);
  }
  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::~__hash_table((uint64_t)this + 152);
  v7 = (void **)((char *)this + 120);
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v7);
  std::__hash_table<std::__hash_value_type<std::string,int>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,int>,ME_Model::hashfun_str,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,int>,std::equal_to<std::string>,ME_Model::hashfun_str,true>,std::allocator<std::__hash_value_type<std::string,int>>>::~__hash_table((uint64_t)this + 80);
  v7 = (void **)((char *)this + 48);
  std::vector<ME_Model::Sample>::__destroy_vector::operator()[abi:ne180100](&v7);
}

void std::vector<std::vector<int>>::__destroy_vector::operator()[abi:ne180100](void ***a1)
{
  void **v2;

  v2 = *a1;
  if (*v2)
  {
    std::vector<std::vector<int>>::__clear[abi:ne180100]((uint64_t *)v2);
    operator delete(**a1);
  }
}

id createCRFSuiteMaxEntModelDataFromTrainingDataSet(void *a1)
{
  void *v1;
  id v2;
  NSDictionary *v3;
  NSDictionary *i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  NSDictionary *v21;
  NSDictionary *v22;
  std::string v23;

  v19 = a1;
  objc_msgSend(v19, "labelMap");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "inverseLabelMap");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "vocabularyMap");
  v22 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "documentFrequencyMap");
  v21 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dataProviderOfType:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dataProviderOfType:", 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v17;
  maxent_model_create();
  v3 = (NSDictionary *)objc_msgSend(v2, "numberOfInstances");
  objc_msgSend(v20, "numberOfInstances");
  if (v3)
  {
    for (i = 0; i != v3; i = (NSDictionary *)((char *)i + 1))
    {
      objc_msgSend(v2, "instanceAtIndex:", i);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        objc_msgSend(v5, "label");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v1, "objectForKey:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          objc_msgSend(v6, "tokens");
          v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
          createSample(v9, v22, v21, v3);

          std::to_string(&v23, objc_msgSend(v8, "unsignedIntegerValue"));
          maxent_sample_set_label();
          if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v23.__r_.__value_.__l.__data_);
          maxent_add_training_sample();
          maxent_sample_release();
        }

      }
    }
  }
  maxent_use_l2_regularizer();
  maxent_train();
  NSTemporaryDirectory();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("maxentmodel_%d.dat"), getpid());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_retainAutorelease(v12);
  objc_msgSend(v13, "fileSystemRepresentation");
  if (maxent_save_to_file())
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeItemAtPath:error:", v13, 0);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void sub_1A36C7A10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, void *a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  _Unwind_Resume(a1);
}

uint64_t createSample(NSArray *a1, NSDictionary *a2, NSDictionary *a3, NSDictionary *a4)
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  void *v35;
  NSArray *v37;
  NSArray *obj;
  void *v39;
  NSDictionary *v40;
  NSDictionary *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  std::string v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v37 = a1;
  v41 = a2;
  v40 = a3;
  v7 = maxent_sample_create();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v37;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v52 != v10)
          objc_enumerationMutation(obj);
        v12 = tokenIDFromTokenAndVocabularyMap(*(void **)(*((_QWORD *)&v51 + 1) + 8 * i), v41);
        if (v12 != 3)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKey:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "unsignedIntegerValue");

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v15 + 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKey:", v16, v13);

        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
    }
    while (v9);
  }

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  objc_msgSend(v8, "allKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v48;
    v20 = (double)(unint64_t)a4;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v48 != v19)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
        objc_msgSend(v8, "objectForKey:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKey:](v40, "objectForKey:", v22);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "doubleValue");
        v26 = v25;
        if (v24)
          objc_msgSend(v24, "doubleValue");
        else
          v27 = 1.0;
        if (v27 >= 1.0)
          v28 = v27;
        else
          v28 = 1.0;
        if (v26 >= 1.0)
          v29 = v26 + 1.0;
        else
          v29 = 2.0;
        log(v29);
        log(v20 / v28);
        std::to_string(&v46, objc_msgSend(v22, "unsignedIntegerValue"));
        maxent_sample_add_feature_with_value();
        if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v46.__r_.__value_.__l.__data_);

      }
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    }
    while (v18);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(v39, "allKeys");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
  if (v31)
  {
    v32 = *(_QWORD *)v43;
    do
    {
      for (k = 0; k != v31; ++k)
      {
        if (*(_QWORD *)v43 != v32)
          objc_enumerationMutation(v30);
        v34 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * k);
        objc_msgSend(v39, "objectForKey:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        std::to_string(&v46, objc_msgSend(v34, "unsignedIntegerValue") + 98304);
        objc_msgSend(v35, "doubleValue");
        maxent_sample_add_feature_with_value();
        if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v46.__r_.__value_.__l.__data_);

      }
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
    }
    while (v31);
  }

  return v7;
}

void sub_1A36C7F4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, void *a12, void *a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  void *v29;
  void *v30;

  _Unwind_Resume(a1);
}

id predictedCRFSuiteMaxEntModelLabelForString(uint64_t a1, void *a2, void *a3, void *a4, NSDictionary *a5, void *a6)
{
  id v10;
  NSDictionary *v11;
  NSDictionary *v12;
  NSArray *v13;
  const char *label;
  void *v15;
  void *v16;

  v10 = a2;
  v11 = a3;
  v12 = a4;
  inputSequenceFromSentence(a6, 0);
  v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
  createSample(v13, v11, v12, a5);
  maxent_classify();
  label = (const char *)maxent_sample_get_label();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", strtoul(label, 0, 10));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  maxent_sample_release();
  return v16;
}

void sub_1A36C816C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

id predictedCRFSuiteMaxEntModelLabelHypothesesForString(uint64_t a1, void *a2, void *a3, void *a4, NSDictionary *a5, void *a6)
{
  id v10;
  NSDictionary *v11;
  NSDictionary *v12;
  NSArray *v13;
  void *v14;
  id v15;
  id v17;
  id v18;
  _QWORD v19[3];
  int v20;

  v10 = a2;
  v11 = a3;
  v12 = a4;
  inputSequenceFromSentence(a6, 0);
  v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
  createSample(v13, v11, v12, a5);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v20 = 0;
  v17 = v10;
  v18 = v14;
  maxent_classify();
  maxent_sample_release();
  v15 = v18;

  _Block_object_dispose(v19, 8);
  return v15;
}

void sub_1A36C82FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, void *a7, uint64_t a8, uint64_t a9, ...)
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  va_list va;

  va_start(va, a9);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __predictedCRFSuiteMaxEntModelLabelHypothesesForString_block_invoke(_QWORD *a1, double a2)
{
  const char *class_label;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  class_label = (const char *)maxent_get_class_label();
  v5 = strtoul(class_label, 0, 10);
  v6 = (void *)a1[4];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v11;
  if (v11)
  {
    v9 = (void *)a1[5];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, v11);

    v8 = v11;
  }
  ++*(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24);

}

void sub_1A36C8428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

uint64_t createCRFSuiteMaxEntModelFromData(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = objc_retainAutorelease(a1);
  objc_msgSend(v1, "bytes");
  objc_msgSend(v1, "length");
  v2 = maxent_load_with_bytes();

  return v2;
}

void sub_1A36C849C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

_DWORD *tokensForEntrySequence(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  _DWORD *v4;
  uint64_t i;
  void *v6;

  v1 = a1;
  v2 = objc_msgSend(v1, "count");
  if (v2)
  {
    v3 = v2;
    v4 = malloc_type_malloc(4 * v2, 0x100004052888210uLL);
    for (i = 0; i != v3; ++i)
    {
      objc_msgSend(v1, "objectAtIndex:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4[i] = objc_msgSend(v6, "tokenID");

    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void sub_1A36CBB4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id entrySequenceForStringWithOptionalBOS(void *a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  NLLexiconEntry *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;

  v7 = a1;
  v8 = a2;
  v9 = (void *)MEMORY[0x1E0C99DE8];
  v10 = a3;
  objc_msgSend(v9, "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    v12 = -[NLLexiconEntry initWithString:tokenID:flags:probability:]([NLLexiconEntry alloc], "initWithString:tokenID:flags:probability:", &stru_1E4A3BA10, 1, 0, -30.0);
    objc_msgSend(v11, "addObject:", v12);

  }
  objc_msgSend(v10, "setString:", v7);
  v13 = objc_msgSend(v7, "length");
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __entrySequenceForStringWithOptionalBOS_block_invoke;
  v20[3] = &unk_1E4A3B088;
  v21 = v7;
  v22 = v8;
  v14 = v11;
  v23 = v14;
  v15 = v8;
  v16 = v7;
  objc_msgSend(v10, "enumerateTokensInRange:usingBlock:", 0, v13, v20);

  v17 = v23;
  v18 = v14;

  return v18;
}

void __entrySequenceForStringWithOptionalBOS_block_invoke(id *a1, uint64_t a2, uint64_t a3)
{
  NLLexiconEntry *v4;
  id v5;
  void *v6;
  id v7;

  objc_msgSend(a1[4], "substringWithRange:", a2, a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "entryForString:");
  v4 = (NLLexiconEntry *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = a1[5];
    objc_msgSend(v7, "lowercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "entryForString:", v6);
    v4 = (NLLexiconEntry *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      v4 = -[NLLexiconEntry initWithString:tokenID:flags:probability:]([NLLexiconEntry alloc], "initWithString:tokenID:flags:probability:", v7, 0, 0, -30.0);
  }
  objc_msgSend(a1[6], "addObject:", v4);

}

void *NLPClassifierModelCreateTrainedModelWithData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, void *a7, void *a8)
{
  id v14;
  id v15;
  void *v16;
  id v17;
  NLPModelTrainingDelegate *v18;
  NLModelTrainingDataSet *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  id v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v14 = a7;
  v30 = 0;
  v15 = a8;
  +[NLModelConfiguration defaultModelConfigurationForType:options:error:](NLModelConfiguration, "defaultModelConfigurationForType:options:error:", 0, a1, &v30);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v30;
  v18 = -[NLPModelTrainingDelegate initWithLogHandler:]([NLPModelTrainingDelegate alloc], "initWithLogHandler:", v15);

  if (a2 >= 1 && v16)
  {
    v19 = -[NLModelTrainingDataSet initWithConfiguration:numberOfTrainingInstances:numberOfValidationInstances:trainingDataSource:validationDataSource:instanceDataProvider:]([NLModelTrainingDataSet alloc], "initWithConfiguration:numberOfTrainingInstances:numberOfValidationInstances:trainingDataSource:validationDataSource:instanceDataProvider:", v16, a2, a3, a4, a5, v14);
    +[NLModelTrainer modelTrainerWithConfiguration:dataSet:options:delegate:](NLModelTrainer, "modelTrainerWithConfiguration:dataSet:options:delegate:", v16, v19, a1, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[NLDataSet numberOfValidationInstances](v19, "numberOfValidationInstances");
    if (!a3 && v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Holding out %llu samples for validation\n"), v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "logMessage:", v22);

    }
    objc_msgSend(v20, "trainedModel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      objc_msgSend(v20, "trainingError");
      v24 = objc_claimAutoreleasedReturnValue();

      v17 = (id)v24;
    }
  }
  else
  {
    if (!v16)
    {
      v23 = 0;
      goto LABEL_11;
    }
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v31 = *MEMORY[0x1E0CB2D50];
    v32[0] = CFSTR("Failed to train model, no training data supplied");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v19 = (NLModelTrainingDataSet *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 9, v19);
    v23 = 0;
    v20 = v17;
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_11:
  if (!a6 || v23)
  {
    if (v23)
      v27 = v23;
  }
  else
  {
    if (v17)
      v26 = v17;
    *a6 = v17;
  }

  return v23;
}

NSUInteger NLPClassifierModelGetCurrentRevision()
{
  return +[NLModelConfiguration currentRevisionForType:](NLModelConfiguration, "currentRevisionForType:", 0);
}

uint64_t NLPClassifierModelIsRevisionSupported(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  if (a1 < 0)
    return 0;
  +[NLModelConfiguration supportedRevisionsForType:](NLModelConfiguration, "supportedRevisionsForType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsIndex:", a1);

  return v3;
}

uint64_t NLPClassifierModelGetRevision(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "configuration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "revision");

  return v2;
}

NLModel *NLPClassifierModelCreateWithData(uint64_t a1, _QWORD *a2)
{
  NLModel *v3;
  id v4;
  void *v5;
  id v6;
  NLModel *v7;
  id v9;

  v9 = 0;
  v3 = -[NLModel initWithData:error:]([NLModel alloc], "initWithData:error:", a1, &v9);
  v4 = v9;
  v5 = v4;
  if (!a2 || v3)
  {
    if (v3)
      v7 = v3;
    else
      v7 = 0;
  }
  else
  {
    if (v4)
      v6 = v4;
    v7 = 0;
    *a2 = v5;
  }

  return v7;
}

uint64_t NLPClassifierModelCopyData(void *a1)
{
  objc_msgSend(a1, "data");
  return objc_claimAutoreleasedReturnValue();
}

NLModel *NLPClassifierModelCreateWithURL(uint64_t a1, _QWORD *a2)
{
  NLModel *v3;
  id v4;
  void *v5;
  id v6;
  NLModel *v7;
  id v9;

  v9 = 0;
  v3 = -[NLModel initWithContentsOfURL:error:]([NLModel alloc], "initWithContentsOfURL:error:", a1, &v9);
  v4 = v9;
  v5 = v4;
  if (!a2 || v3)
  {
    if (v3)
      v7 = v3;
    else
      v7 = 0;
  }
  else
  {
    if (v4)
      v6 = v4;
    v7 = 0;
    *a2 = v5;
  }

  return v7;
}

uint64_t NLPClassifierModelWriteToURL(void *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  id v9;

  v9 = 0;
  v4 = objc_msgSend(a1, "writeToURL:atomically:error:", a2, 1, &v9);
  v5 = v9;
  v6 = v5;
  if (a3 && (v4 & 1) == 0)
  {
    if (v5)
      v7 = v5;
    *a3 = v6;
  }

  return v4;
}

uint64_t NLPClassifierModelWriteCoreMLModelToURLWithOptions(void *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v10;

  v10 = 0;
  v5 = objc_msgSend(a1, "writeMLModelToURL:options:error:", a2, a3, &v10);
  v6 = v10;
  v7 = v6;
  if (a4 && (v5 & 1) == 0)
  {
    if (v6)
      v8 = v6;
    *a4 = v7;
  }

  return v5;
}

uint64_t NLPClassifierModelWriteCoreMLModelToURL(void *a1, uint64_t a2, _QWORD *a3)
{
  return NLPClassifierModelWriteCoreMLModelToURLWithOptions(a1, a2, 0, a3);
}

void *NLPClassifierModelCopyPredictedLabelForText(void *a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "predictedLabelForString:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

uint64_t NLPClassifierModelCopyPredictedLabelHypothesesForText(void *a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(a1, "predictedLabelHypothesesForString:maximumCount:", a2, a3);
  return objc_claimAutoreleasedReturnValue();
}

void *NLPClassifierModelCopyTestResults(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  NLPModelTrainingDataProvider *v9;
  void *v10;
  NLPModelTrainingDataProvider *v11;
  void *v12;
  id v13;

  v7 = a1;
  v8 = a4;
  v9 = [NLPModelTrainingDataProvider alloc];
  objc_msgSend(v7, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NLPModelTrainingDataProvider initWithConfiguration:numberOfInstances:dataSource:instanceDataProvider:](v9, "initWithConfiguration:numberOfInstances:dataSource:instanceDataProvider:", v10, a2, a3, v8);

  objc_msgSend(v7, "testResultsWithDataProvider:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v13 = v12;

  return v12;
}

void *NLPSequenceModelCreateTrainedModelWithData(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6, void *a7, void *a8)
{
  id v14;
  id v15;
  void *v16;
  id v17;
  NLPModelTrainingDelegate *v18;
  NLModelTrainingDataSet *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  id v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v14 = a7;
  v30 = 0;
  v15 = a8;
  +[NLModelConfiguration defaultModelConfigurationForType:options:error:](NLModelConfiguration, "defaultModelConfigurationForType:options:error:", 1, a1, &v30);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v30;
  v18 = -[NLPModelTrainingDelegate initWithLogHandler:]([NLPModelTrainingDelegate alloc], "initWithLogHandler:", v15);

  if (a2 >= 1 && v16)
  {
    v19 = -[NLModelTrainingDataSet initWithConfiguration:numberOfTrainingInstances:numberOfValidationInstances:trainingDataSource:validationDataSource:instanceDataProvider:]([NLModelTrainingDataSet alloc], "initWithConfiguration:numberOfTrainingInstances:numberOfValidationInstances:trainingDataSource:validationDataSource:instanceDataProvider:", v16, a2, a3, a4, a5, v14);
    +[NLModelTrainer modelTrainerWithConfiguration:dataSet:options:delegate:](NLModelTrainer, "modelTrainerWithConfiguration:dataSet:options:delegate:", v16, v19, a1, v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[NLDataSet numberOfValidationInstances](v19, "numberOfValidationInstances");
    if (!a3 && v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Holding out %llu samples for validation\n"), v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "logMessage:", v22);

    }
    objc_msgSend(v20, "trainedModel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      objc_msgSend(v20, "trainingError");
      v24 = objc_claimAutoreleasedReturnValue();

      v17 = (id)v24;
    }
  }
  else
  {
    if (!v16)
    {
      v23 = 0;
      goto LABEL_11;
    }
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v31 = *MEMORY[0x1E0CB2D50];
    v32[0] = CFSTR("Failed to train model, no training data supplied");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v19 = (NLModelTrainingDataSet *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 9, v19);
    v23 = 0;
    v20 = v17;
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_11:
  if (!a6 || v23)
  {
    if (v23)
      v27 = v23;
  }
  else
  {
    if (v17)
      v26 = v17;
    *a6 = v17;
  }

  return v23;
}

NSUInteger NLPSequenceModelGetCurrentRevision()
{
  return +[NLModelConfiguration currentRevisionForType:](NLModelConfiguration, "currentRevisionForType:", 1);
}

uint64_t NLPSequenceModelIsRevisionSupported(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  if (a1 < 0)
    return 0;
  +[NLModelConfiguration supportedRevisionsForType:](NLModelConfiguration, "supportedRevisionsForType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsIndex:", a1);

  return v3;
}

uint64_t NLPSequenceModelGetRevision(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "configuration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "revision");

  return v2;
}

NLModel *NLPSequenceModelCreateWithData(uint64_t a1, _QWORD *a2)
{
  NLModel *v3;
  id v4;
  void *v5;
  id v6;
  NLModel *v7;
  id v9;

  v9 = 0;
  v3 = -[NLModel initWithData:error:]([NLModel alloc], "initWithData:error:", a1, &v9);
  v4 = v9;
  v5 = v4;
  if (!a2 || v3)
  {
    if (v3)
      v7 = v3;
    else
      v7 = 0;
  }
  else
  {
    if (v4)
      v6 = v4;
    v7 = 0;
    *a2 = v5;
  }

  return v7;
}

uint64_t NLPSequenceModelCopyData(void *a1)
{
  objc_msgSend(a1, "data");
  return objc_claimAutoreleasedReturnValue();
}

NLModel *NLPSequenceModelCreateWithURL(uint64_t a1, _QWORD *a2)
{
  NLModel *v3;
  id v4;
  void *v5;
  id v6;
  NLModel *v7;
  id v9;

  v9 = 0;
  v3 = -[NLModel initWithContentsOfURL:error:]([NLModel alloc], "initWithContentsOfURL:error:", a1, &v9);
  v4 = v9;
  v5 = v4;
  if (!a2 || v3)
  {
    if (v3)
      v7 = v3;
    else
      v7 = 0;
  }
  else
  {
    if (v4)
      v6 = v4;
    v7 = 0;
    *a2 = v5;
  }

  return v7;
}

uint64_t NLPSequenceModelWriteToURL(void *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  id v9;

  v9 = 0;
  v4 = objc_msgSend(a1, "writeToURL:atomically:error:", a2, 1, &v9);
  v5 = v9;
  v6 = v5;
  if (a3 && (v4 & 1) == 0)
  {
    if (v5)
      v7 = v5;
    *a3 = v6;
  }

  return v4;
}

uint64_t NLPSequenceModelWriteCoreMLModelToURLWithOptions(void *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v10;

  v10 = 0;
  v5 = objc_msgSend(a1, "writeMLModelToURL:options:error:", a2, a3, &v10);
  v6 = v10;
  v7 = v6;
  if (a4 && (v5 & 1) == 0)
  {
    if (v6)
      v8 = v6;
    *a4 = v7;
  }

  return v5;
}

uint64_t NLPSequenceModelWriteCoreMLModelToURL(void *a1, uint64_t a2, _QWORD *a3)
{
  return NLPSequenceModelWriteCoreMLModelToURLWithOptions(a1, a2, 0, a3);
}

__CFDictionary *NLPSequenceModelCopyPredictedTokensAndLabelsForText(void *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  __CFDictionary *Mutable;
  void *v9;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a1;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  generateTokenSequence(a2, 0, v5, v6, v7);
  objc_msgSend(v4, "predictedLabelsForTokens:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  CFDictionaryAddValue(Mutable, (const void *)kNLPTokenArrayKey, v5);
  CFDictionaryAddValue(Mutable, (const void *)kNLPLabelArrayKey, v9);
  CFDictionaryAddValue(Mutable, (const void *)kNLPTokenRangeLocationArrayKey, v6);
  CFDictionaryAddValue(Mutable, (const void *)kNLPTokenRangeLengthArrayKey, v7);

  return Mutable;
}

__CFDictionary *NLPSequenceModelCopyPredictedTokensAndLabelHypothesesForText(void *a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  __CFDictionary *Mutable;
  void *v11;

  v5 = (void *)MEMORY[0x1E0C99DE8];
  v6 = a1;
  objc_msgSend(v5, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  generateTokenSequence(a2, 0, v7, v8, v9);
  objc_msgSend(v6, "predictedLabelHypothesesForTokens:maximumCount:", v7, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  CFDictionaryAddValue(Mutable, (const void *)kNLPTokenArrayKey, v7);
  CFDictionaryAddValue(Mutable, (const void *)kNLPLabelHypothesesArrayKey, v11);
  CFDictionaryAddValue(Mutable, (const void *)kNLPTokenRangeLocationArrayKey, v8);
  CFDictionaryAddValue(Mutable, (const void *)kNLPTokenRangeLengthArrayKey, v9);

  return Mutable;
}

void *NLPSequenceModelCopyPredictedLabelsForTokens(void *a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "predictedLabelsForTokens:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

uint64_t NLPSequenceModelCopyPredictedLabelHypothesesForTokens(void *a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(a1, "predictedLabelHypothesesForTokens:maximumCount:", a2, a3);
  return objc_claimAutoreleasedReturnValue();
}

void *NLPSequenceModelCopyPredictedLabelArraysForTokenArrays(void *a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "predictedLabelArraysForTokenArrays:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

void *NLPSequenceModelCopyTestResults(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  NLPModelTrainingDataProvider *v9;
  void *v10;
  NLPModelTrainingDataProvider *v11;
  void *v12;
  id v13;

  v7 = a1;
  v8 = a4;
  v9 = [NLPModelTrainingDataProvider alloc];
  objc_msgSend(v7, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NLPModelTrainingDataProvider initWithConfiguration:numberOfInstances:dataSource:instanceDataProvider:](v9, "initWithConfiguration:numberOfInstances:dataSource:instanceDataProvider:", v10, a2, a3, v8);

  objc_msgSend(v7, "testResultsWithDataProvider:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v13 = v12;

  return v12;
}

NLModel *NLPGazetteerModelCreateWithData(uint64_t a1, _QWORD *a2)
{
  NLModel *v3;
  id v4;
  void *v5;
  id v6;
  NLModel *v7;
  id v9;

  v9 = 0;
  v3 = -[NLModel initWithData:error:]([NLModel alloc], "initWithData:error:", a1, &v9);
  v4 = v9;
  v5 = v4;
  if (!a2 || v3)
  {
    if (v3)
      v7 = v3;
    else
      v7 = 0;
  }
  else
  {
    if (v4)
      v6 = v4;
    v7 = 0;
    *a2 = v5;
  }

  return v7;
}

NLModel *NLPGazetteerModelCreateWithURL(uint64_t a1, _QWORD *a2)
{
  NLModel *v3;
  id v4;
  void *v5;
  id v6;
  NLModel *v7;
  id v9;

  v9 = 0;
  v3 = -[NLModel initWithContentsOfURL:error:]([NLModel alloc], "initWithContentsOfURL:error:", a1, &v9);
  v4 = v9;
  v5 = v4;
  if (!a2 || v3)
  {
    if (v3)
      v7 = v3;
    else
      v7 = 0;
  }
  else
  {
    if (v4)
      v6 = v4;
    v7 = 0;
    *a2 = v5;
  }

  return v7;
}

uint64_t NLPGazetteerModelWriteCoreMLModelToURLWithOptions(void *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v10;

  v10 = 0;
  v5 = objc_msgSend(a1, "writeMLModelToURL:options:error:", a2, a3, &v10);
  v6 = v10;
  v7 = v6;
  if (a4 && (v5 & 1) == 0)
  {
    if (v6)
      v8 = v6;
    *a4 = v7;
  }

  return v5;
}

void *NLPGazetteerModelCopyLabelForString(void *a1, uint64_t a2)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "predictedLabelForString:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

NSUInteger NLPGazetteerModelGetCurrentRevision()
{
  return +[NLModelConfiguration currentRevisionForType:](NLModelConfiguration, "currentRevisionForType:", 0);
}

uint64_t NLPGazetteerModelIsRevisionSupported(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  if (a1 < 0)
    return 0;
  +[NLModelConfiguration supportedRevisionsForType:](NLModelConfiguration, "supportedRevisionsForType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsIndex:", a1);

  return v3;
}

uint64_t NLPGazetteerModelGetRevision(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "configuration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "revision");

  return v2;
}

NLModel *NLPEmbeddingModelCreateWithData(uint64_t a1, _QWORD *a2)
{
  NLModel *v3;
  id v4;
  void *v5;
  id v6;
  NLModel *v7;
  id v9;

  v9 = 0;
  v3 = -[NLModel initWithData:error:]([NLModel alloc], "initWithData:error:", a1, &v9);
  v4 = v9;
  v5 = v4;
  if (!a2 || v3)
  {
    if (v3)
      v7 = v3;
    else
      v7 = 0;
  }
  else
  {
    if (v4)
      v6 = v4;
    v7 = 0;
    *a2 = v5;
  }

  return v7;
}

NLModel *NLPEmbeddingModelCreateWithURL(uint64_t a1, _QWORD *a2)
{
  NLModel *v3;
  id v4;
  void *v5;
  id v6;
  NLModel *v7;
  id v9;

  v9 = 0;
  v3 = -[NLModel initWithContentsOfURL:error:]([NLModel alloc], "initWithContentsOfURL:error:", a1, &v9);
  v4 = v9;
  v5 = v4;
  if (!a2 || v3)
  {
    if (v3)
      v7 = v3;
    else
      v7 = 0;
  }
  else
  {
    if (v4)
      v6 = v4;
    v7 = 0;
    *a2 = v5;
  }

  return v7;
}

uint64_t NLPEmbeddingModelWriteCoreMLModelToURLWithOptions(void *a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  id v10;

  v10 = 0;
  v5 = objc_msgSend(a1, "writeMLModelToURL:options:error:", a2, a3, &v10);
  v6 = v10;
  v7 = v6;
  if (a4 && (v5 & 1) == 0)
  {
    if (v6)
      v8 = v6;
    *a4 = v7;
  }

  return v5;
}

id NLPEmbeddingModelCopyVectorForString(void *a1, uint64_t a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "predictedLabelForString:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v2, "componentsSeparatedByString:", CFSTR(","), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "doubleValue");
          objc_msgSend(v9, "numberWithDouble:");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v10);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

    if (v3)
    {
      v3 = v3;

    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

NSUInteger NLPEmbeddingModelGetCurrentRevision()
{
  return +[NLModelConfiguration currentRevisionForType:](NLModelConfiguration, "currentRevisionForType:", 0);
}

uint64_t NLPEmbeddingModelIsRevisionSupported(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  if (a1 < 0)
    return 0;
  +[NLModelConfiguration supportedRevisionsForType:](NLModelConfiguration, "supportedRevisionsForType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsIndex:", a1);

  return v3;
}

uint64_t NLPEmbeddingModelGetRevision(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "configuration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "revision");

  return v2;
}

__CFString *_getLanguageTag(int a1)
{
  if ((a1 - 2) > 0x38)
    return (__CFString *)0;
  else
    return _languageTags[a1 - 1];
}

void ME_Model::regularized_func_grad(ME_Model *this, double a2, double **a3, double **a4)
{
  double v6;
  double *v7;
  uint64_t v8;
  unint64_t v9;
  double v10;

  v6 = ME_Model::FunctionGradient(this, (uint64_t)a3, a4);
  v7 = *a3;
  v8 = (char *)a3[1] - (char *)*a3;
  if (v8)
  {
    v9 = v8 >> 3;
    if (v9 <= 1)
      v9 = 1;
    do
    {
      v10 = *v7++;
      v6 = v6 + a2 * fabs(v10);
      --v9;
    }
    while (v9);
  }
}

double ME_Model::constrained_line_search(ME_Model *this, double a2, const Vec *a3, double **a4, double a5, const Vec *a6, Vec *a7, double **a8)
{
  double *v16;
  unint64_t v17;
  double *v18;
  double v19;
  double *v20;
  uint64_t v21;
  unint64_t v22;
  double *v23;
  double v24;
  double *v25;
  char *v26;
  uint64_t v27;
  unint64_t v28;
  double *v29;
  double *v30;
  double v31;
  double v32;
  double v33;
  double *v34;
  uint64_t v35;
  unint64_t v36;
  double *v37;
  double v38;
  double v39;
  double *v40;
  uint64_t v41;
  unint64_t v42;
  double *v43;
  double *v44;
  double v45;
  double v46;
  double v47;
  int64_t v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  double v52;
  void *v54[3];
  void *__p;
  _BYTE *v56;
  void *v57;
  _BYTE *v58;
  uint64_t v59;

  v57 = 0;
  v58 = 0;
  v59 = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v57, *(const void **)a3, *((_QWORD *)a3 + 1), (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3);
  v16 = (double *)v57;
  if (v58 != v57)
  {
    v17 = (v58 - (_BYTE *)v57) >> 3;
    v18 = *a4;
    if (v17 <= 1)
      v17 = 1;
    do
    {
      if (*v16 == 0.0)
        *v16 = -*v18;
      ++v18;
      ++v16;
      --v17;
    }
    while (v17);
  }
  v19 = 2.0;
  do
  {
    while (1)
    {
      Vec::Vec((Vec *)v54, (uint64_t)(*((_QWORD *)a6 + 1) - *(_QWORD *)a6) >> 3, 0.0);
      v19 = v19 * 0.5;
      v20 = *(double **)a6;
      v21 = *((_QWORD *)a6 + 1) - *(_QWORD *)a6;
      if (v21)
      {
        v22 = v21 >> 3;
        v23 = (double *)v54[0];
        if (v22 <= 1)
          v22 = 1;
        do
        {
          v24 = *v20++;
          *v23++ = v19 * v24;
          --v22;
        }
        while (v22);
      }
      Vec::Vec((Vec *)&__p, (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3, 0.0);
      v25 = *(double **)a3;
      v26 = (char *)__p;
      v27 = *((_QWORD *)a3 + 1) - *(_QWORD *)a3;
      if (v27)
      {
        v28 = v27 >> 3;
        v29 = (double *)v54[0];
        if (v28 <= 1)
          v28 = 1;
        v30 = (double *)__p;
        do
        {
          v31 = *v25++;
          v32 = v31;
          v33 = *v29++;
          *v30++ = v32 + v33;
          --v28;
        }
        while (v28);
      }
      if (&__p != (void **)a7)
      {
        std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>((char *)a7, v26, (uint64_t)v56, (v56 - v26) >> 3);
        v26 = (char *)__p;
      }
      if (v26)
      {
        v56 = v26;
        operator delete(v26);
      }
      if (v54[0])
      {
        v54[1] = v54[0];
        operator delete(v54[0]);
      }
      v34 = *(double **)a7;
      v35 = *((_QWORD *)a7 + 1) - *(_QWORD *)a7;
      if (v35)
      {
        v36 = v35 >> 3;
        v37 = (double *)v57;
        if (v36 <= 1)
          v36 = 1;
        do
        {
          if (*v34 * *v37 <= 0.0)
            *v34 = 0.0;
          ++v37;
          ++v34;
          --v36;
        }
        while (v36);
      }
      ME_Model::regularized_func_grad(this, a2, (double **)a7, a8);
      v39 = v38;
      Vec::Vec((Vec *)&__p, (uint64_t)(*((_QWORD *)a7 + 1) - *(_QWORD *)a7) >> 3, 0.0);
      v40 = *(double **)a7;
      v41 = *((_QWORD *)a7 + 1) - *(_QWORD *)a7;
      if (v41)
      {
        v42 = v41 >> 3;
        v43 = *(double **)a3;
        v44 = (double *)__p;
        if (v42 <= 1)
          v42 = 1;
        do
        {
          v45 = *v40++;
          v46 = v45;
          v47 = *v43++;
          *v44++ = v46 - v47;
          --v42;
        }
        while (v42);
      }
      v48 = v56 - (_BYTE *)__p;
      if (v56 == __p)
        break;
      v49 = 0;
      v50 = v48 >> 3;
      if ((unint64_t)(v48 >> 3) <= 1)
        v50 = 1;
      v51 = 0.0;
      do
      {
        v51 = v51 + *((double *)__p + v49) * (*a4)[v49];
        ++v49;
      }
      while (v50 != v49);
      v52 = a5 + v51 * 0.1;
      v56 = __p;
      operator delete(__p);
      if (v39 <= v52)
        goto LABEL_43;
    }
    if (v56)
      operator delete(v56);
  }
  while (v39 > a5 + 0.0);
LABEL_43:
  if (v57)
  {
    v58 = v57;
    operator delete(v57);
  }
  return v39;
}

void sub_1A36D1C88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, void *a16, uint64_t a17)
{
  if (__p)
    operator delete(__p);
  if (a10)
    operator delete(a10);
  if (a16)
    operator delete(a16);
  _Unwind_Resume(exception_object);
}

void ME_Model::perform_OWLQN(int *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>, double a4@<D0>)
{
  const void *v7;
  uint64_t v8;
  unint64_t v10;
  double v11;
  double v12;
  uint64_t i;
  uint64_t j;
  unsigned int v15;
  double *v16;
  unint64_t v17;
  double *v18;
  double *v19;
  double v20;
  double v21;
  double v22;
  _BYTE *v23;
  unint64_t v24;
  double v25;
  double *v26;
  double v27;
  double v28;
  double *v29;
  unint64_t v30;
  double *v31;
  double v32;
  double *v33;
  unint64_t v34;
  double v35;
  double *v36;
  double v37;
  double v38;
  double v39;
  double *v40;
  unint64_t v41;
  double *v42;
  double v43;
  double *v44;
  double *v45;
  unint64_t v46;
  double *v47;
  unint64_t v48;
  double *v49;
  double *v50;
  double v51;
  double v52;
  double v53;
  uint64_t v54;
  void **v55;
  double *v56;
  unint64_t v57;
  double *v58;
  double *v59;
  double v60;
  double v61;
  double v62;
  void **v63;
  double *v64;
  uint64_t v65;
  unint64_t v66;
  double *v67;
  double v68;
  double v69;
  double v70;
  double v71;
  uint64_t k;
  void *v73;
  uint64_t m;
  void *v75;
  void *v76;
  _BYTE *v77;
  void *v78;
  _BYTE *v79;
  void *__p;
  _BYTE *v81;
  void *v82;
  _BYTE *v83;
  uint64_t v84;
  void *v85;
  _BYTE *v86;
  void *v87;
  _BYTE *v88;
  void *v89;
  _BYTE *v90;
  uint64_t v91;
  double v92[10];
  char v93[240];
  char v94[240];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v7 = *(const void **)a2;
  v8 = *(_QWORD *)(a2 + 8);
  v10 = (v8 - (uint64_t)v7) >> 3;
  v89 = 0;
  v90 = 0;
  v91 = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v89, v7, v8, v10);
  Vec::Vec((Vec *)&v87, v10, 0.0);
  Vec::Vec((Vec *)&v85, v10, 0.0);
  ME_Model::regularized_func_grad((ME_Model *)a1, a4, (double **)&v89, (double **)&v87);
  v12 = v11;
  for (i = 0; i != 240; i += 24)
    Vec::Vec((Vec *)&v94[i], 0, 0.0);
  for (j = 0; j != 240; j += 24)
    Vec::Vec((Vec *)&v93[j], 0, 0.0);
  if (OWLQN_MAX_ITER >= 1)
  {
    v15 = 0;
    while (1)
    {
      v82 = 0;
      v83 = 0;
      v84 = 0;
      std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v82, v87, (uint64_t)v88, (v88 - (_BYTE *)v87) >> 3);
      v16 = (double *)v89;
      if (v90 != v89)
        break;
LABEL_23:
      if (a1[100] >= 1)
        ME_Model::heldout_likelihood((ME_Model *)a1);
      v23 = v82;
      if (v83 == v82)
      {
        v25 = 0.0;
      }
      else
      {
        v24 = (v83 - (_BYTE *)v82) >> 3;
        if (v24 <= 1)
          v24 = 1;
        v25 = 0.0;
        v26 = (double *)v82;
        do
        {
          v27 = *v26++;
          v25 = v25 + v27 * v27;
          --v24;
        }
        while (v24);
      }
      v28 = sqrt(v25);
      if (v28 >= 0.0001)
      {
        approximate_Hg((const Vec *)&v82, (const Vec *)v94, (const Vec *)v93, v92, v15, (double **)&v78);
        Vec::Vec((Vec *)&__p, (v79 - (_BYTE *)v78) >> 3, 0.0);
        v29 = (double *)v78;
        if (v79 != v78)
        {
          v30 = (v79 - (_BYTE *)v78) >> 3;
          v31 = (double *)__p;
          if (v30 <= 1)
            v30 = 1;
          do
          {
            v32 = *v29++;
            *v31++ = -v32;
            --v30;
          }
          while (v30);
        }
        std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>((char *)&v85, (char *)__p, (uint64_t)v81, (v81 - (_BYTE *)__p) >> 3);
        if (__p)
        {
          v81 = __p;
          operator delete(__p);
        }
        if (v78)
        {
          v79 = v78;
          operator delete(v78);
        }
        v33 = (double *)v85;
        if (v86 == v85)
          goto LABEL_47;
        v34 = (v86 - (_BYTE *)v85) >> 3;
        if (v34 <= 1)
          v34 = 1;
        v35 = 0.0;
        v36 = (double *)v82;
        do
        {
          v37 = *v33++;
          v38 = v37;
          v39 = *v36++;
          v35 = v35 + v38 * v39;
          --v34;
        }
        while (v34);
        if (v35 >= 0.0)
        {
LABEL_47:
          Vec::Vec((Vec *)&__p, (v83 - (_BYTE *)v82) >> 3, 0.0);
          v40 = (double *)v82;
          if (v83 != v82)
          {
            v41 = (v83 - (_BYTE *)v82) >> 3;
            v42 = (double *)__p;
            if (v41 <= 1)
              v41 = 1;
            do
            {
              v43 = *v40++;
              *v42++ = -v43;
              --v41;
            }
            while (v41);
          }
          v44 = (double *)v85;
          v45 = (double *)__p;
          if (v86 != v85)
          {
            v46 = (v86 - (_BYTE *)v85) >> 3;
            if (v46 <= 1)
              v46 = 1;
            do
            {
              if (*v44 * *v45 <= 0.0)
                *v44 = 0.0;
              ++v45;
              ++v44;
              --v46;
            }
            while (v46);
            v45 = (double *)__p;
          }
          if (v45)
          {
            v81 = v45;
            operator delete(v45);
          }
        }
        Vec::Vec((Vec *)&__p, v10, 0.0);
        Vec::Vec((Vec *)&v78, v10, 0.0);
        v12 = ME_Model::constrained_line_search((ME_Model *)a1, a4, (const Vec *)&v89, (double **)&v82, v12, (const Vec *)&v85, (Vec *)&__p, (double **)&v78);
        Vec::Vec((Vec *)&v76, (v81 - (_BYTE *)__p) >> 3, 0.0);
        v47 = (double *)__p;
        if (v81 != __p)
        {
          v48 = (v81 - (_BYTE *)__p) >> 3;
          v49 = (double *)v89;
          v50 = (double *)v76;
          if (v48 <= 1)
            v48 = 1;
          do
          {
            v51 = *v47++;
            v52 = v51;
            v53 = *v49++;
            *v50++ = v52 - v53;
            --v48;
          }
          while (v48);
        }
        v54 = v15 % 0xA;
        v55 = (void **)&v94[24 * v54];
        if (v55 != &v76)
          std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>(&v94[24 * v54], (char *)v76, (uint64_t)v77, (v77 - (_BYTE *)v76) >> 3);
        if (v76)
        {
          v77 = v76;
          operator delete(v76);
        }
        Vec::Vec((Vec *)&v76, (v79 - (_BYTE *)v78) >> 3, 0.0);
        v56 = (double *)v78;
        if (v79 != v78)
        {
          v57 = (v79 - (_BYTE *)v78) >> 3;
          v58 = (double *)v87;
          v59 = (double *)v76;
          if (v57 <= 1)
            v57 = 1;
          do
          {
            v60 = *v56++;
            v61 = v60;
            v62 = *v58++;
            *v59++ = v61 - v62;
            --v57;
          }
          while (v57);
        }
        v63 = (void **)&v93[24 * v54];
        if (v63 != &v76)
          std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>(&v93[24 * v54], (char *)v76, (uint64_t)v77, (v77 - (_BYTE *)v76) >> 3);
        if (v76)
        {
          v77 = v76;
          operator delete(v76);
        }
        v64 = (double *)*v63;
        v65 = (_BYTE *)v63[1] - (_BYTE *)*v63;
        if (v65)
        {
          v66 = v65 >> 3;
          v67 = (double *)*v55;
          if (v66 <= 1)
            v66 = 1;
          v68 = 0.0;
          do
          {
            v69 = *v64++;
            v70 = v69;
            v71 = *v67++;
            v68 = v68 + v70 * v71;
            --v66;
          }
          while (v66);
        }
        else
        {
          v68 = 0.0;
        }
        v92[v54] = 1.0 / v68;
        std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>((char *)&v89, (char *)__p, (uint64_t)v81, (v81 - (_BYTE *)__p) >> 3);
        std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>((char *)&v87, (char *)v78, (uint64_t)v79, (v79 - (_BYTE *)v78) >> 3);
        if (v78)
        {
          v79 = v78;
          operator delete(v78);
        }
        if (__p)
        {
          v81 = __p;
          operator delete(__p);
        }
        v23 = v82;
      }
      if (v23)
      {
        v83 = v23;
        operator delete(v23);
      }
      if (v28 >= 0.0001 && (int)++v15 < OWLQN_MAX_ITER)
        continue;
      goto LABEL_92;
    }
    v17 = (v90 - (_BYTE *)v89) >> 3;
    v18 = (double *)v87;
    v19 = (double *)v82;
    if (v17 <= 1)
      v17 = 1;
    while (1)
    {
      if (*v16 == 0.0)
      {
        v22 = *v18 - a4;
        if (v22 > 0.0)
        {
          *v19 = v22;
          goto LABEL_22;
        }
        v21 = *v18 + a4;
        if (v21 >= 0.0)
        {
          *v19 = 0.0;
          goto LABEL_22;
        }
      }
      else
      {
        if (*v16 >= 0.0)
          v20 = 0.0;
        else
          v20 = -1.0;
        if (*v16 > 0.0)
          v20 = 1.0;
        v21 = *v19 + a4 * v20;
      }
      *v19 = v21;
LABEL_22:
      ++v19;
      ++v18;
      ++v16;
      if (!--v17)
        goto LABEL_23;
    }
  }
LABEL_92:
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(a3, v89, (uint64_t)v90, (v90 - (_BYTE *)v89) >> 3);
  for (k = 0; k != -240; k -= 24)
  {
    v73 = *(void **)&v93[k + 216];
    if (v73)
    {
      *(_QWORD *)&v93[k + 224] = v73;
      operator delete(v73);
    }
  }
  for (m = 0; m != -240; m -= 24)
  {
    v75 = *(void **)&v94[m + 216];
    if (v75)
    {
      *(_QWORD *)&v94[m + 224] = v75;
      operator delete(v75);
    }
  }
  if (v85)
  {
    v86 = v85;
    operator delete(v85);
  }
  if (v87)
  {
    v88 = v87;
    operator delete(v87);
  }
  if (v89)
  {
    v90 = v89;
    operator delete(v89);
  }
}

void sub_1A36D2368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, void *a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,void *__p,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,void *a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;

  v72 = 0;
  while (1)
  {
    v73 = *(void **)(&a41 + v72 + 216);
    if (v73)
    {
      *(_QWORD *)(&a41 + v72 + 224) = v73;
      operator delete(v73);
    }
    v72 -= 24;
    if (v72 == -240)
    {
      v74 = 0;
      while (1)
      {
        v75 = *(void **)(&a71 + v74 + 216);
        if (v75)
        {
          *(_QWORD *)(&a71 + v74 + 224) = v75;
          operator delete(v75);
        }
        v74 -= 24;
        if (v74 == -240)
        {
          if (__p)
            operator delete(__p);
          if (a25)
            operator delete(a25);
          if (a28)
            operator delete(a28);
          _Unwind_Resume(a1);
        }
      }
    }
  }
}

void sub_1A36D24BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  uint64_t v41;
  void *v42;

  for (; v41; v41 -= 24)
  {
    v42 = *(void **)(&a41 + v41 - 24);
    if (v42)
    {
      *(_QWORD *)(&a41 + v41 - 16) = v42;
      operator delete(v42);
    }
  }
  JUMPOUT(0x1A36D245CLL);
}

void sub_1A36D24E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a71;
  uint64_t v71;
  void *v72;

  for (; v71; v71 -= 24)
  {
    v72 = *(void **)(&a71 + v71 - 24);
    if (v72)
    {
      *(_QWORD *)(&a71 + v71 - 16) = v72;
      operator delete(v72);
    }
  }
  JUMPOUT(0x1A36D2484);
}

void Vec::Vec(Vec *this, unint64_t a2, double a3)
{
  double v3;

  v3 = a3;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  *(_QWORD *)this = 0;
  std::vector<double>::resize((uint64_t)this, a2, &v3);
}

void sub_1A36D2550(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void std::vector<double>::resize(uint64_t a1, unint64_t a2, _QWORD *a3)
{
  unint64_t v3;

  v3 = (uint64_t)(*(_QWORD *)(a1 + 8) - *(_QWORD *)a1) >> 3;
  if (a2 <= v3)
  {
    if (a2 < v3)
      *(_QWORD *)(a1 + 8) = *(_QWORD *)a1 + 8 * a2;
  }
  else
  {
    std::vector<double>::__append((void **)a1, a2 - v3, a3);
  }
}

void std::vector<double>::__append(void **a1, unint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  _QWORD *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  uint64_t v16;
  _QWORD *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  char *v21;
  char *v22;
  char *v23;
  char *i;
  uint64_t v25;

  v8 = a1[2];
  v6 = (uint64_t)(a1 + 2);
  v7 = v8;
  v9 = *(_QWORD **)(v6 - 8);
  if (a2 <= (v8 - (_BYTE *)v9) >> 3)
  {
    if (a2)
    {
      v16 = 8 * a2;
      v17 = &v9[a2];
      do
      {
        *v9++ = *a3;
        v16 -= 8;
      }
      while (v16);
      v9 = v17;
    }
    a1[1] = v9;
  }
  else
  {
    v10 = (char *)v9 - (_BYTE *)*a1;
    v11 = a2 + (v10 >> 3);
    if (v11 >> 61)
      std::vector<double>::__throw_length_error[abi:ne180100]();
    v12 = v10 >> 3;
    v13 = v7 - (_BYTE *)*a1;
    if (v13 >> 2 > v11)
      v11 = v13 >> 2;
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8)
      v14 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v14 = v11;
    if (v14)
      v15 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v6, v14);
    else
      v15 = 0;
    v18 = &v15[8 * v12];
    v19 = &v18[8 * a2];
    v20 = 8 * a2;
    v21 = v18;
    do
    {
      *(_QWORD *)v21 = *a3;
      v21 += 8;
      v20 -= 8;
    }
    while (v20);
    v22 = &v15[8 * v14];
    v23 = (char *)*a1;
    for (i = (char *)a1[1]; i != v23; i -= 8)
    {
      v25 = *((_QWORD *)i - 1);
      *((_QWORD *)v18 - 1) = v25;
      v18 -= 8;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = v22;
    if (v23)
      operator delete(v23);
  }
}

void sub_1A36D2AA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27,char a28,_QWORD *a29)
{
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  if (a27 < 0)
    operator delete(__p);
  std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::destroy((uint64_t)&a28, a29);

  _Unwind_Resume(a1);
}

uint64_t std::variant<BOOL,std::string>::operator=[abi:ne180100]<BOOL,0,BOOL,0ul,0>(uint64_t a1, _BYTE *a2)
{
  if (*(_DWORD *)(a1 + 24))
    std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__emplace[abi:ne180100]<0ul,BOOL>(a1, a2);
  else
    *(_BYTE *)a1 = *a2;
  return a1;
}

void sub_1A36D2BD0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A36D2E44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16, uint64_t a17, uint64_t a18, char a19, _QWORD *a20)
{
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  std::__tree<std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>>>::destroy((uint64_t)&a19, a20);
  _Unwind_Resume(a1);
}

_DWORD *std::variant<language_modeling::v1::SessionType,std::string>::operator=[abi:ne180100]<language_modeling::v1::SessionType,0,language_modeling::v1::SessionType,0ul,0>(_DWORD *a1, _DWORD *a2)
{
  if (a1[6])
    std::__variant_detail::__assignment<std::__variant_detail::__traits<language_modeling::v1::SessionType,std::string>>::__emplace[abi:ne180100]<0ul,language_modeling::v1::SessionType>(a1, a2);
  else
    *a1 = *a2;
  return a1;
}

void sub_1A36D2F8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  v2 = v1;

  _Unwind_Resume(a1);
}

void makeContext(NSArray *a1@<X0>, language_modeling::v1::LinguisticContext *a2@<X8>)
{
  NSArray *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  char *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  void *__p[2];
  char v15;
  int v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  language_modeling::v1::LinguisticContext::LinguisticContext(a2);
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  v16 = 1;
  MEMORY[0x1A859283C](a2, __p);
  if (v15 < 0)
    operator delete(__p[0]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v3;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v17, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7));
        v9 = (char *)objc_msgSend(v8, "UTF8String", (_QWORD)v10);
        if (v9)
        {
          std::string::basic_string[abi:ne180100]<0>(__p, v9);
          v16 = 0;
          MEMORY[0x1A859283C](a2, __p);
          if (v15 < 0)
            operator delete(__p[0]);
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v17, 16);
    }
    while (v5);
  }

}

void sub_1A36D3128(_Unwind_Exception *a1)
{
  language_modeling::v1::LinguisticContext *v1;
  void *v2;
  void *v3;

  language_modeling::v1::LinguisticContext::~LinguisticContext(v1);
  _Unwind_Resume(a1);
}

void sub_1A36D3268(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  void *v16;
  void *v17;

  if (a16 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

id wordSequenceForString(NSString *a1, NLTokenizer *a2)
{
  NSString *v3;
  NLTokenizer *v4;
  void *v5;
  uint64_t v6;
  NSString *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  void *v15;
  NSString *v16;
  id v17;

  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLTokenizer setString:](v4, "setString:", v3);
  v6 = -[NSString length](v3, "length");
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = ___ZL21wordSequenceForStringP8NSStringP11NLTokenizer_block_invoke;
  v15 = &unk_1E4A3B280;
  v7 = v3;
  v16 = v7;
  v8 = v5;
  v17 = v8;
  -[NLTokenizer enumerateTokensInRange:usingBlock:](v4, "enumerateTokensInRange:usingBlock:", 0, v6, &v12);
  -[NLTokenizer setString:](v4, "setString:", &stru_1E4A3BA10, v12, v13, v14, v15);
  v9 = v17;
  v10 = v8;

  return v10;
}

void sub_1A36D33A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1A36D35A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1A36D376C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, char a15)
{
  void *v15;
  void *v16;

  if (a14 < 0)
    operator delete(__p);
  language_modeling::v1::LinguisticContext::~LinguisticContext((language_modeling::v1::LinguisticContext *)&a15);

  _Unwind_Resume(a1);
}

void sub_1A36D3870(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A36D395C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  void *v16;
  void *v17;

  if (a16 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_1A36D3A60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  void *v16;
  void *v17;

  if (a16 < 0)
    operator delete(__p);

  _Unwind_Resume(a1);
}

void sub_1A36D3AD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void ___ZL21wordSequenceForStringP8NSStringP11NLTokenizer_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:");

}

void sub_1A36D3B80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::variant<BOOL,std::string>>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::variant<BOOL,std::string>>,0>(uint64_t a1)
{
  std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,std::string>,(std::__variant_detail::_Trait)1>::~__dtor(a1 + 24);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

uint64_t std::__variant_detail::__dtor<std::__variant_detail::__traits<BOOL,std::string>,(std::__variant_detail::_Trait)1>::~__dtor(uint64_t a1)
{
  uint64_t v2;
  char v4;

  v2 = *(unsigned int *)(a1 + 24);
  if ((_DWORD)v2 != -1)
    ((void (*)(char *, uint64_t))off_1E4A3B2A0[v2])(&v4, a1);
  *(_DWORD *)(a1 + 24) = -1;
  return a1;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJbNS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSF_1EJbSD_EEEEEEDcSH_DpT0_(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) < 0)
    operator delete(*(void **)a2);
}

_OWORD *std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t **a1, void **a2, uint64_t a3, _OWORD **a4)
{
  void **v6;
  _OWORD *v7;
  uint64_t **v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD v12[2];
  char v13;
  uint64_t v14;

  v6 = (void **)std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::__find_equal<std::string>((uint64_t)a1, &v14, a2);
  v7 = *v6;
  if (!*v6)
  {
    v8 = (uint64_t **)v6;
    v7 = operator new(0x58uLL);
    v12[1] = a1 + 1;
    v9 = *a4;
    v10 = *((_QWORD *)*a4 + 2);
    v7[2] = **a4;
    *((_QWORD *)v7 + 6) = v10;
    *v9 = 0;
    v9[1] = 0;
    v9[2] = 0;
    *((_BYTE *)v7 + 56) = 0;
    *((_DWORD *)v7 + 20) = 0;
    v13 = 1;
    std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::__insert_node_at(a1, v14, v8, (uint64_t *)v7);
    v12[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::variant<BOOL,std::string>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::variant<BOOL,std::string>>,void *>>>>::reset[abi:ne180100]((uint64_t)v12, 0);
  }
  return v7;
}

_QWORD *std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::__find_equal<std::string>(uint64_t a1, _QWORD *a2, void **a3)
{
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v7;
  _QWORD *v8;

  v5 = (_QWORD *)(a1 + 8);
  v4 = *(_QWORD **)(a1 + 8);
  if (v4)
  {
    do
    {
      while (1)
      {
        v7 = v4;
        v8 = v4 + 4;
        if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(a3, (void **)v4 + 4) & 0x80) == 0)
          break;
        v4 = (_QWORD *)*v7;
        v5 = v7;
        if (!*v7)
          goto LABEL_9;
      }
      if ((std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(v8, a3) & 0x80) == 0)
        break;
      v5 = v7 + 1;
      v4 = (_QWORD *)v7[1];
    }
    while (v4);
  }
  else
  {
    v7 = (_QWORD *)(a1 + 8);
  }
LABEL_9:
  *a2 = v7;
  return v5;
}

uint64_t *std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t *result;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t std::operator<=>[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(_QWORD *a1, void **a2)
{
  size_t v2;
  size_t v3;
  int v4;
  void *v5;
  size_t v6;

  v2 = *((unsigned __int8 *)a1 + 23);
  v3 = a1[1];
  if ((v2 & 0x80u) != 0)
  {
    a1 = (_QWORD *)*a1;
    v2 = v3;
  }
  v4 = *((char *)a2 + 23);
  if (v4 >= 0)
    v5 = a2;
  else
    v5 = *a2;
  if (v4 >= 0)
    v6 = *((unsigned __int8 *)a2 + 23);
  else
    v6 = (size_t)a2[1];
  return std::operator<=>[abi:ne180100]<char,std::char_traits<char>>(a1, v2, v5, v6);
}

uint64_t std::operator<=>[abi:ne180100]<char,std::char_traits<char>>(const void *a1, size_t a2, void *__s2, size_t a4)
{
  size_t v7;
  int v8;

  if (a4 >= a2)
    v7 = a2;
  else
    v7 = a4;
  v8 = memcmp(a1, __s2, v7);
  if (v8)
  {
    if ((v8 & 0x80000000) == 0)
      return 1;
  }
  else
  {
    if (a2 == a4)
      return 0;
    if (a2 >= a4)
      return 1;
  }
  return 255;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24))
        return result;
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v13 = v2[1];
          *v3 = v13;
          if (v13)
            *(_QWORD *)(v13 + 16) = v3;
          v2[2] = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          v11 = a2[1];
          *v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        v12 = *v2;
        v3[1] = *v2;
        if (v12)
          *(_QWORD *)(v12 + 16) = v3;
        v2[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
        *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::variant<BOOL,std::string>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::variant<BOOL,std::string>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::variant<BOOL,std::string>>,0>((uint64_t)v2 + 32);
    operator delete(v2);
  }
}

void std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,std::string&>(uint64_t a1, std::string *this, std::string *__str)
{
  uint64_t v3[2];

  if (*(_DWORD *)(a1 + 24) == 1)
  {
    std::string::operator=(this, __str);
  }
  else
  {
    v3[0] = a1;
    v3[1] = (uint64_t)__str;
    std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,std::string&>(std::__variant_detail::__alt<1ul,std::string> &,std::string&)::{unnamed type#1}::operator()[abi:ne180100](v3);
  }
}

void std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,std::string&>(std::__variant_detail::__alt<1ul,std::string> &,std::string&)::{unnamed type#1}::operator()[abi:ne180100](uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  std::string __p;

  v2 = *a1;
  v1 = a1[1];
  if (*(char *)(v1 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)v1, *(_QWORD *)(v1 + 8));
  }
  else
  {
    v3 = *(_OWORD *)v1;
    __p.__r_.__value_.__r.__words[2] = *(_QWORD *)(v1 + 16);
    *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v3;
  }
  std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__emplace[abi:ne180100]<1ul,std::string>(v2, (__int128 *)&__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
}

void sub_1A36D414C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14)
{
  if (a14 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__emplace[abi:ne180100]<1ul,std::string>(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  __int128 v5;
  char v7;

  v4 = *(unsigned int *)(a1 + 24);
  if ((_DWORD)v4 != -1)
    ((void (*)(char *, uint64_t))off_1E4A3B2A0[v4])(&v7, a1);
  *(_DWORD *)(a1 + 24) = -1;
  v5 = *a2;
  *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
  *(_OWORD *)a1 = v5;
  *((_QWORD *)a2 + 1) = 0;
  *((_QWORD *)a2 + 2) = 0;
  *(_QWORD *)a2 = 0;
  *(_DWORD *)(a1 + 24) = 1;
  return a1;
}

uint64_t std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__emplace[abi:ne180100]<0ul,BOOL>(uint64_t a1, _BYTE *a2)
{
  uint64_t v4;
  char v6;

  v4 = *(unsigned int *)(a1 + 24);
  if ((_DWORD)v4 != -1)
    ((void (*)(char *, uint64_t))off_1E4A3B2A0[v4])(&v6, a1);
  *(_BYTE *)a1 = *a2;
  *(_DWORD *)(a1 + 24) = 0;
  return a1;
}

void std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,char const*&>(uint64_t a1, std::string *this, const std::string::value_type **a3)
{
  _QWORD v3[2];

  if (*(_DWORD *)(a1 + 24) == 1)
  {
    std::string::__assign_external(this, *a3);
  }
  else
  {
    v3[0] = a1;
    v3[1] = a3;
    std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,char const*&>(std::__variant_detail::__alt<1ul,std::string> &,char const*&)::{unnamed type#1}::operator()[abi:ne180100]((uint64_t)v3);
  }
}

void std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,char const*&>(std::__variant_detail::__alt<1ul,std::string> &,char const*&)::{unnamed type#1}::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  void *__p[2];
  char v3;

  v1 = *(_QWORD *)a1;
  std::string::basic_string[abi:ne180100]<0>(__p, **(char ***)(a1 + 8));
  std::__variant_detail::__assignment<std::__variant_detail::__traits<BOOL,std::string>>::__emplace[abi:ne180100]<1ul,std::string>(v1, (__int128 *)__p);
  if (v3 < 0)
    operator delete(__p[0]);
}

void sub_1A36D42D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  unint64_t v6;
  std::string *v7;
  std::string::size_type size;
  unint64_t v9;
  unint64_t v10;

  LODWORD(v6) = SHIBYTE(this->__r_.__value_.__r.__words[2]);
  if ((v6 & 0x80000000) != 0)
  {
    v10 = this->__r_.__value_.__r.__words[2];
    v9 = (v10 & 0x7FFFFFFFFFFFFFFFLL) - 1;
    if (v9 < __n)
    {
      size = this->__r_.__value_.__l.__size_;
      goto LABEL_6;
    }
    v6 = HIBYTE(v10);
    v7 = (std::string *)this->__r_.__value_.__r.__words[0];
  }
  else
  {
    v7 = this;
    if (__n > 0x16)
    {
      size = HIBYTE(this->__r_.__value_.__r.__words[2]);
      v9 = 22;
LABEL_6:
      std::string::__grow_by_and_replace(this, v9, __n - v9, size, 0, size, __n, __s);
      return this;
    }
  }
  if (__n)
  {
    memmove(v7, __s, __n);
    LOBYTE(v6) = *((_BYTE *)&this->__r_.__value_.__s + 23);
  }
  if ((v6 & 0x80) != 0)
    this->__r_.__value_.__l.__size_ = __n;
  else
    *((_BYTE *)&this->__r_.__value_.__s + 23) = __n & 0x7F;
  v7->__r_.__value_.__s.__data_[__n] = 0;
  return this;
}

std::string *__cdecl std::string::__assign_external(std::string *this, const std::string::value_type *__s)
{
  size_t v4;

  v4 = strlen(__s);
  return std::string::__assign_external(this, __s, v4);
}

void std::__tree<std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>>>::destroy(a1, *a2);
    std::__tree<std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>>>::destroy(a1, a2[1]);
    std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::variant<language_modeling::v1::SessionType,std::string>>,0>((uint64_t)(a2 + 4));
    operator delete(a2);
  }
}

void std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::variant<language_modeling::v1::SessionType,std::string>>,0>(uint64_t a1)
{
  std::__variant_detail::__dtor<std::__variant_detail::__traits<language_modeling::v1::SessionType,std::string>,(std::__variant_detail::_Trait)1>::~__dtor(a1 + 24);
  if (*(char *)(a1 + 23) < 0)
    operator delete(*(void **)a1);
}

uint64_t std::__variant_detail::__dtor<std::__variant_detail::__traits<language_modeling::v1::SessionType,std::string>,(std::__variant_detail::_Trait)1>::~__dtor(uint64_t a1)
{
  uint64_t v2;
  char v4;

  v2 = *(unsigned int *)(a1 + 24);
  if ((_DWORD)v2 != -1)
    ((void (*)(char *, uint64_t))off_1E4A3B2B0[v2])(&v4, a1);
  *(_DWORD *)(a1 + 24) = -1;
  return a1;
}

void _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm1EEE10__dispatchB8ne180100IOZNS0_6__dtorINS0_8__traitsIJN17language_modeling2v111SessionTypeENS_12basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEEEEELNS0_6_TraitE1EE9__destroyB8ne180100EvEUlRT_E_JRNS0_6__baseILSI_1EJSA_SG_EEEEEEDcSK_DpT0_(uint64_t a1, uint64_t a2)
{
  if (*(char *)(a2 + 23) < 0)
    operator delete(*(void **)a2);
}

_OWORD *std::__tree<std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(uint64_t **a1, void **a2, uint64_t a3, _OWORD **a4)
{
  void **v6;
  _OWORD *v7;
  uint64_t **v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD v12[2];
  char v13;
  uint64_t v14;

  v6 = (void **)std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::__find_equal<std::string>((uint64_t)a1, &v14, a2);
  v7 = *v6;
  if (!*v6)
  {
    v8 = (uint64_t **)v6;
    v7 = operator new(0x58uLL);
    v12[1] = a1 + 1;
    v9 = *a4;
    v10 = *((_QWORD *)*a4 + 2);
    v7[2] = **a4;
    *((_QWORD *)v7 + 6) = v10;
    v9[1] = 0;
    v9[2] = 0;
    *v9 = 0;
    *((_DWORD *)v7 + 14) = 0;
    *((_DWORD *)v7 + 20) = 0;
    v13 = 1;
    std::__tree<std::__value_type<std::string,std::variant<BOOL,std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::variant<BOOL,std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::variant<BOOL,std::string>>>>::__insert_node_at(a1, v14, v8, (uint64_t *)v7);
    v12[0] = 0;
    std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>,void *>>>>::reset[abi:ne180100]((uint64_t)v12, 0);
  }
  return v7;
}

void std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::variant<language_modeling::v1::SessionType,std::string>>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<std::string const,std::variant<language_modeling::v1::SessionType,std::string>>,0>((uint64_t)v2 + 32);
    operator delete(v2);
  }
}

_DWORD *std::__variant_detail::__assignment<std::__variant_detail::__traits<language_modeling::v1::SessionType,std::string>>::__emplace[abi:ne180100]<0ul,language_modeling::v1::SessionType>(_DWORD *a1, _DWORD *a2)
{
  uint64_t v4;
  char v6;

  v4 = a1[6];
  if ((_DWORD)v4 != -1)
    ((void (*)(char *, _DWORD *))off_1E4A3B2B0[v4])(&v6, a1);
  *a1 = *a2;
  a1[6] = 0;
  return a1;
}

void std::__variant_detail::__assignment<std::__variant_detail::__traits<language_modeling::v1::SessionType,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,char const*&>(uint64_t a1, std::string *this, const std::string::value_type **a3)
{
  _QWORD v3[2];

  if (*(_DWORD *)(a1 + 24) == 1)
  {
    std::string::__assign_external(this, *a3);
  }
  else
  {
    v3[0] = a1;
    v3[1] = a3;
    std::__variant_detail::__assignment<std::__variant_detail::__traits<language_modeling::v1::SessionType,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,char const*&>(std::__variant_detail::__alt<1ul,std::string> &,char const*&)::{unnamed type#1}::operator()[abi:ne180100]((uint64_t)v3);
  }
}

void std::__variant_detail::__assignment<std::__variant_detail::__traits<language_modeling::v1::SessionType,std::string>>::__assign_alt[abi:ne180100]<1ul,std::string,char const*&>(std::__variant_detail::__alt<1ul,std::string> &,char const*&)::{unnamed type#1}::operator()[abi:ne180100](uint64_t a1)
{
  uint64_t v1;
  void *__p[2];
  char v3;

  v1 = *(_QWORD *)a1;
  std::string::basic_string[abi:ne180100]<0>(__p, **(char ***)(a1 + 8));
  std::__variant_detail::__assignment<std::__variant_detail::__traits<language_modeling::v1::SessionType,std::string>>::__emplace[abi:ne180100]<1ul,std::string>(v1, (__int128 *)__p);
  if (v3 < 0)
    operator delete(__p[0]);
}

void sub_1A36D46D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t std::__variant_detail::__assignment<std::__variant_detail::__traits<language_modeling::v1::SessionType,std::string>>::__emplace[abi:ne180100]<1ul,std::string>(uint64_t a1, __int128 *a2)
{
  uint64_t v4;
  __int128 v5;
  char v7;

  v4 = *(unsigned int *)(a1 + 24);
  if ((_DWORD)v4 != -1)
    ((void (*)(char *, uint64_t))off_1E4A3B2B0[v4])(&v7, a1);
  *(_DWORD *)(a1 + 24) = -1;
  v5 = *a2;
  *(_QWORD *)(a1 + 16) = *((_QWORD *)a2 + 2);
  *(_OWORD *)a1 = v5;
  *((_QWORD *)a2 + 1) = 0;
  *((_QWORD *)a2 + 2) = 0;
  *(_QWORD *)a2 = 0;
  *(_DWORD *)(a1 + 24) = 1;
  return a1;
}

language_modeling::v1::LanguageModelSession *std::unique_ptr<language_modeling::v1::LanguageModelSession>::reset[abi:ne180100](language_modeling::v1::LanguageModelSession **a1, language_modeling::v1::LanguageModelSession *a2)
{
  language_modeling::v1::LanguageModelSession *result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    language_modeling::v1::LanguageModelSession::~LanguageModelSession(result);
    JUMPOUT(0x1A8592B54);
  }
  return result;
}

void sub_1A36D4960(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_1A36D545C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  uint64_t v55;

  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose((const void *)(v55 - 256), 8);
  _Block_object_dispose((const void *)(v55 - 224), 8);
  _Unwind_Resume(a1);
}

uint64_t copySampleDataEnumerator(void *a1, _BYTE *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "nextInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "instanceDictionary");
  }
  else
  {
    v5 = 0;
    *a2 = 1;
  }

  return v5;
}

uint64_t rangesMatch(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  BOOL v5;
  unint64_t v6;
  unint64_t v7;
  _BOOL4 v9;
  BOOL v10;
  unsigned int v11;
  _BOOL4 v12;

  v5 = a1 == a3 && a2 == a4;
  if (a3 >= a1 && !v5)
  {
    v6 = a3 + a4;
    v7 = a1 + a2;
    if (a3 + a4 > a1 + a2)
      goto LABEL_14;
    return 1;
  }
  if (v5)
    return 1;
  v7 = a1 + a2;
  v6 = a3 + a4;
LABEL_14:
  v9 = a3 > a1;
  v10 = a3 < v7 && v6 >= v7;
  v11 = v10;
  if (v10)
    v9 = 1;
  v12 = v6 > a1;
  if (v9)
    return v11;
  else
    return v12;
}

id mostRecentEmbedding(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "sortedArrayUsingComparator:", &__block_literal_global_290);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "count"))
  {
    objc_msgSend(v1, "firstObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_1A36D88F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

unint64_t maxTokensFromBatchComponents(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;

  v5 = a1;
  v6 = a3;
  v7 = 0;
  if (v5)
  {
    if (a2)
    {
      v8 = objc_msgSend(a2, "count");
      v9 = objc_msgSend(v5, "count");
      v7 = 0;
      if (v6)
      {
        if (v8 == v9)
        {
          v10 = objc_msgSend(v6, "count");
          if (v10 == objc_msgSend(v5, "count") && objc_msgSend(v5, "count"))
          {
            v7 = 0;
            v11 = 0;
            do
            {
              objc_msgSend(v5, "objectAtIndex:", v11);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "objectAtIndex:", v11);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v12, "count");
              v15 = objc_msgSend(v13, "count");
              if (v14 >= v15)
                v16 = v15;
              else
                v16 = v14;
              if (v16 > v7)
                v7 = v16;

              ++v11;
            }
            while (v11 < objc_msgSend(v5, "count"));
          }
          else
          {
            v7 = 0;
          }
        }
      }
    }
  }

  return v7;
}

void sub_1A36DB1C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A36DB5E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A36DBA74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __mostRecentEmbedding_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "revision");
  v6 = objc_msgSend(v4, "revision");

  if (v5 > v6)
    return -1;
  else
    return v5 < v6;
}

id NLGetLogCategory(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v1 = a1;
  v2 = v1;
  if (v1 && objc_msgSend(v1, "conformsToProtocol:", &unk_1EE6C7C28))
  {
    objc_msgSend((id)objc_opt_class(), "logCategory");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[NLLogCategory defaultCategory](NLLogCategory, "defaultCategory");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;

  return v4;
}

__CFString *NLGetLogIdentifier(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  __CFString *v5;

  v1 = a1;
  v2 = v1;
  if (v1
    && objc_msgSend(v1, "conformsToProtocol:", &unk_1EE6C7C28)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v2, "logIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@] "), v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = &stru_1E4A3BA10;
  }

  return v5;
}

__CFString *NLBooleanToString(int a1)
{
  if (a1)
    return CFSTR("YES");
  else
    return CFSTR("NO");
}

void ME_Model::backtracking_line_search(ME_Model *this, const Vec *a2, double **a3, double a4, const Vec *a5, Vec *a6, double **a7)
{
  uint64_t v14;
  uint64_t v15;
  double v16;
  double *v17;
  uint64_t v18;
  unint64_t v19;
  double *v20;
  double v21;
  double *v22;
  char *v23;
  uint64_t v24;
  unint64_t v25;
  double *v26;
  double *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  unint64_t v32;
  double *v33;
  double v34;
  double *v35;
  double v36;
  double v37;
  double v38;
  void *v39[3];
  void *__p;
  char *v41;

  v15 = *(_QWORD *)a5;
  v14 = *((_QWORD *)a5 + 1);
  v16 = 2.0;
  do
  {
    v16 = v16 * 0.5;
    Vec::Vec((Vec *)v39, (v14 - v15) >> 3, 0.0);
    v17 = *(double **)a5;
    v18 = *((_QWORD *)a5 + 1) - *(_QWORD *)a5;
    if (v18)
    {
      v19 = v18 >> 3;
      v20 = (double *)v39[0];
      if (v19 <= 1)
        v19 = 1;
      do
      {
        v21 = *v17++;
        *v20++ = v16 * v21;
        --v19;
      }
      while (v19);
    }
    Vec::Vec((Vec *)&__p, (uint64_t)(*((_QWORD *)a2 + 1) - *(_QWORD *)a2) >> 3, 0.0);
    v22 = *(double **)a2;
    v23 = (char *)__p;
    v24 = *((_QWORD *)a2 + 1) - *(_QWORD *)a2;
    if (v24)
    {
      v25 = v24 >> 3;
      v26 = (double *)v39[0];
      if (v25 <= 1)
        v25 = 1;
      v27 = (double *)__p;
      do
      {
        v28 = *v22++;
        v29 = v28;
        v30 = *v26++;
        *v27++ = v29 + v30;
        --v25;
      }
      while (v25);
    }
    if (&__p != (void **)a6)
    {
      std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>((char *)a6, v23, (uint64_t)v41, (v41 - v23) >> 3);
      v23 = (char *)__p;
    }
    if (v23)
    {
      v41 = v23;
      operator delete(v23);
    }
    if (v39[0])
    {
      v39[1] = v39[0];
      operator delete(v39[0]);
    }
    v31 = ME_Model::FunctionGradient(this, (uint64_t)a6, a7);
    v15 = *(_QWORD *)a5;
    v14 = *((_QWORD *)a5 + 1);
    if (v14 == *(_QWORD *)a5)
    {
      v34 = 0.0;
    }
    else
    {
      v32 = (v14 - *(_QWORD *)a5) >> 3;
      v33 = *a3;
      if (v32 <= 1)
        v32 = 1;
      v34 = 0.0;
      v35 = *(double **)a5;
      do
      {
        v36 = *v35++;
        v37 = v36;
        v38 = *v33++;
        v34 = v34 + v37 * v38;
        --v32;
      }
      while (v32);
    }
  }
  while (v31 > a4 + v16 * 0.1 * v34);
}

void sub_1A36DF214(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, uint64_t a11, void *__p, uint64_t a13)
{
  if (__p)
    operator delete(__p);
  if (a9)
    operator delete(a9);
  _Unwind_Resume(exception_object);
}

void approximate_Hg(const Vec *a1@<X1>, const Vec *a2@<X2>, const Vec *a3@<X3>, const double *a4@<X4>, int a5@<W0>, double **a6@<X8>)
{
  uint64_t v10;
  int v11;
  int v12;
  double *v13;
  double v14;
  uint64_t v15;
  unint64_t v16;
  double *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double **v22;
  double *v23;
  uint64_t v24;
  unint64_t v25;
  double *v26;
  double v27;
  double *v28;
  uint64_t v29;
  unint64_t v30;
  double *v31;
  double v32;
  double *v34;
  uint64_t v35;
  unint64_t v36;
  double v37;
  double v38;
  double *v39;
  uint64_t v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  double *v45;
  double v46;
  uint64_t v47;
  unint64_t v48;
  double *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double **v54;
  double v55;
  double *v56;
  uint64_t v57;
  unint64_t v58;
  double *v59;
  double v60;
  double *v61;
  uint64_t v62;
  unint64_t v63;
  double *v64;
  double v65;
  unsigned int v66;
  int v68;
  void *__p;
  void *v70;
  _QWORD v71[12];

  v71[10] = *MEMORY[0x1E0C80C00];
  v66 = a5 - 1;
  if (a5 >= 11)
    v10 = 9;
  else
    v10 = (a5 - 1);
  if (a5 >= 11)
    v11 = a5 - 10;
  else
    v11 = 0;
  *a6 = 0;
  a6[1] = 0;
  a6[2] = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(a6, *(const void **)a1, *((_QWORD *)a1 + 1), (uint64_t)(*((_QWORD *)a1 + 1) - *(_QWORD *)a1) >> 3);
  v68 = v10;
  if ((v10 & 0x80000000) == 0)
  {
    do
    {
      v12 = (v11 + (int)v10) % 10;
      v13 = (double *)*((_QWORD *)a2 + 3 * v12);
      v14 = 0.0;
      v15 = *((_QWORD *)a2 + 3 * v12 + 1) - (_QWORD)v13;
      if (v15)
      {
        v16 = v15 >> 3;
        v17 = *a6;
        if (v16 <= 1)
          v16 = 1;
        do
        {
          v18 = *v13++;
          v19 = v18;
          v20 = *v17++;
          v14 = v14 + v19 * v20;
          --v16;
        }
        while (v16);
      }
      v21 = a4[v12];
      *(double *)&v71[v10] = v21 * v14;
      v22 = (double **)((char *)a3 + 24 * v12);
      Vec::Vec((Vec *)&__p, v22[1] - *v22, 0.0);
      v23 = *v22;
      v24 = (char *)v22[1] - (char *)*v22;
      if (v24)
      {
        v25 = v24 >> 3;
        v26 = (double *)__p;
        if (v25 <= 1)
          v25 = 1;
        do
        {
          v27 = *v23++;
          *v26++ = v27 * -(v21 * v14);
          --v25;
        }
        while (v25);
      }
      v28 = *a6;
      v29 = (char *)a6[1] - (char *)*a6;
      if (v29)
      {
        v30 = v29 >> 3;
        v31 = (double *)__p;
        if (v30 <= 1)
          v30 = 1;
        do
        {
          v32 = *v31++;
          *v28 = v32 + *v28;
          ++v28;
          --v30;
        }
        while (v30);
      }
      if (__p)
      {
        v70 = __p;
        operator delete(__p);
      }
    }
    while (v10-- > 0);
  }
  if (a5 > 0)
  {
    v34 = (double *)*((_QWORD *)a3 + 3 * (v66 % 0xA));
    v35 = *((_QWORD *)a3 + 3 * (v66 % 0xA) + 1) - (_QWORD)v34;
    if (v35)
    {
      v36 = v35 >> 3;
      if (v36 <= 1)
        v36 = 1;
      v37 = 0.0;
      do
      {
        v38 = *v34++;
        v37 = v37 + v38 * v38;
        --v36;
      }
      while (v36);
    }
    else
    {
      v37 = 0.0;
    }
    v39 = *a6;
    v40 = (char *)a6[1] - (char *)*a6;
    if (v40)
    {
      v41 = 1.0 / a4[v66 % 0xA] / v37;
      v42 = v40 >> 3;
      if ((unint64_t)(v40 >> 3) <= 1)
        v42 = 1;
      do
      {
        *v39 = v41 * *v39;
        ++v39;
        --v42;
      }
      while (v42);
    }
  }
  if ((v68 & 0x80000000) == 0)
  {
    v43 = 0;
    do
    {
      v44 = (v11 + (int)v43) % 10;
      v45 = (double *)*((_QWORD *)a3 + 3 * v44);
      v46 = 0.0;
      v47 = *((_QWORD *)a3 + 3 * v44 + 1) - (_QWORD)v45;
      if (v47)
      {
        v48 = v47 >> 3;
        v49 = *a6;
        if (v48 <= 1)
          v48 = 1;
        do
        {
          v50 = *v45++;
          v51 = v50;
          v52 = *v49++;
          v46 = v46 + v51 * v52;
          --v48;
        }
        while (v48);
      }
      v53 = a4[v44];
      v54 = (double **)((char *)a2 + 24 * v44);
      v55 = *(double *)&v71[v43];
      Vec::Vec((Vec *)&__p, v54[1] - *v54, 0.0);
      v56 = *v54;
      v57 = (char *)v54[1] - (char *)*v54;
      if (v57)
      {
        v58 = v57 >> 3;
        v59 = (double *)__p;
        if (v58 <= 1)
          v58 = 1;
        do
        {
          v60 = *v56++;
          *v59++ = (v55 - v53 * v46) * v60;
          --v58;
        }
        while (v58);
      }
      v61 = *a6;
      v62 = (char *)a6[1] - (char *)*a6;
      if (v62)
      {
        v63 = v62 >> 3;
        v64 = (double *)__p;
        if (v63 <= 1)
          v63 = 1;
        do
        {
          v65 = *v64++;
          *v61 = v65 + *v61;
          ++v61;
          --v63;
        }
        while (v63);
      }
      if (__p)
      {
        v70 = __p;
        operator delete(__p);
      }
      ++v43;
    }
    while (v43 != v68 + 1);
  }
}

void sub_1A36DF5F8(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void ME_Model::perform_LBFGS(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  const void *v6;
  uint64_t v7;
  unint64_t v9;
  double v10;
  uint64_t i;
  uint64_t j;
  int v13;
  uint64_t v14;
  double v15;
  int v16;
  double v18;
  float v19;
  double *v20;
  unint64_t v21;
  double v22;
  double v23;
  double *v24;
  unint64_t v25;
  char *v26;
  double v27;
  double v28;
  char *v29;
  unint64_t v30;
  double *v31;
  double *v32;
  double v33;
  double v34;
  double v35;
  uint64_t v36;
  void **v37;
  double *v38;
  unint64_t v39;
  double *v40;
  double *v41;
  double v42;
  double v43;
  double v44;
  void **v45;
  double *v46;
  uint64_t v47;
  unint64_t v48;
  double *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  uint64_t k;
  void *v55;
  uint64_t m;
  void *v57;
  void *v59;
  _BYTE *v60;
  void *__p;
  _BYTE *v62;
  void *v63[3];
  void *v64;
  _BYTE *v65;
  void *v66;
  _BYTE *v67;
  uint64_t v68;
  char __str[8];
  char *v70;
  double v71[10];
  char v72[240];
  char v73[240];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v6 = *(const void **)a2;
  v7 = *(_QWORD *)(a2 + 8);
  v9 = (v7 - (uint64_t)v6) >> 3;
  v66 = 0;
  v67 = 0;
  v68 = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(&v66, v6, v7, v9);
  Vec::Vec((Vec *)&v64, v9, 0.0);
  Vec::Vec((Vec *)v63, v9, 0.0);
  v10 = ME_Model::FunctionGradient((ME_Model *)a1, (uint64_t)&v66, (double **)&v64);
  for (i = 0; i != 240; i += 24)
    Vec::Vec((Vec *)&v73[i], 0, 0.0);
  for (j = 0; j != 240; j += 24)
    Vec::Vec((Vec *)&v72[j], 0, 0.0);
  if (LBFGS_MAX_ITER >= 1)
  {
    v13 = 0;
    v14 = 1;
    v15 = 1.0;
    do
    {
      v16 = *(_DWORD *)(a1 + 24);
      if (v16 >= 1 && (int)v14 > v16)
        break;
      if (a3)
      {
        if ((v13 & 1) == 0)
        {
          v18 = *(double *)(a1 + 384);
          if (v18 < v15 && (v18 > 0.0 || v15 > 0.05))
          {
            snprintf(__str, 0x100uLL, "Iteration %d training accuracy %.6f", v14, 1.0 - v18);
            v19 = 1.0 - *(double *)(a1 + 384);
            (*(void (**)(uint64_t, char *, uint64_t, float))(a3 + 16))(a3, __str, v14, v19);
            v15 = *(double *)(a1 + 384);
            v14 = (v14 + 1);
          }
        }
      }
      v20 = (double *)v64;
      if (v65 == v64)
      {
        v22 = 0.0;
      }
      else
      {
        v21 = (v65 - (_BYTE *)v64) >> 3;
        if (v21 <= 1)
          v21 = 1;
        v22 = 0.0;
        do
        {
          v23 = *v20++;
          v22 = v22 + v23 * v23;
          --v21;
        }
        while (v21);
      }
      if (sqrt(v22) < 0.0001)
        break;
      approximate_Hg((const Vec *)&v64, (const Vec *)v73, (const Vec *)v72, v71, v13, (double **)&__p);
      Vec::Vec((Vec *)__str, (v62 - (_BYTE *)__p) >> 3, 0.0);
      v24 = (double *)__p;
      if (v62 != __p)
      {
        v25 = (v62 - (_BYTE *)__p) >> 3;
        v26 = *(char **)__str;
        if (v25 <= 1)
          v25 = 1;
        do
        {
          v27 = *v24++;
          *(double *)v26 = -v27;
          v26 += 8;
          --v25;
        }
        while (v25);
      }
      std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>((char *)v63, *(char **)__str, (uint64_t)v70, (uint64_t)&v70[-*(_QWORD *)__str] >> 3);
      if (*(_QWORD *)__str)
      {
        v70 = *(char **)__str;
        operator delete(*(void **)__str);
      }
      if (__p)
      {
        v62 = __p;
        operator delete(__p);
      }
      Vec::Vec((Vec *)__str, v9, 0.0);
      Vec::Vec((Vec *)&__p, v9, 0.0);
      ME_Model::backtracking_line_search((ME_Model *)a1, (const Vec *)&v66, (double **)&v64, v10, (const Vec *)v63, (Vec *)__str, (double **)&__p);
      v10 = v28;
      Vec::Vec((Vec *)&v59, (uint64_t)&v70[-*(_QWORD *)__str] >> 3, 0.0);
      v29 = *(char **)__str;
      if (v70 != *(char **)__str)
      {
        v30 = (uint64_t)&v70[-*(_QWORD *)__str] >> 3;
        v31 = (double *)v66;
        v32 = (double *)v59;
        if (v30 <= 1)
          v30 = 1;
        do
        {
          v33 = *(double *)v29;
          v29 += 8;
          v34 = v33;
          v35 = *v31++;
          *v32++ = v34 - v35;
          --v30;
        }
        while (v30);
      }
      v36 = v13 % 0xAu;
      v37 = (void **)&v73[24 * v36];
      if (v37 != &v59)
        std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>(&v73[24 * v36], (char *)v59, (uint64_t)v60, (v60 - (_BYTE *)v59) >> 3);
      if (v59)
      {
        v60 = v59;
        operator delete(v59);
      }
      Vec::Vec((Vec *)&v59, (v62 - (_BYTE *)__p) >> 3, 0.0);
      v38 = (double *)__p;
      if (v62 != __p)
      {
        v39 = (v62 - (_BYTE *)__p) >> 3;
        v40 = (double *)v64;
        v41 = (double *)v59;
        if (v39 <= 1)
          v39 = 1;
        do
        {
          v42 = *v38++;
          v43 = v42;
          v44 = *v40++;
          *v41++ = v43 - v44;
          --v39;
        }
        while (v39);
      }
      v45 = (void **)&v72[24 * v36];
      if (v45 != &v59)
        std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>(&v72[24 * v36], (char *)v59, (uint64_t)v60, (v60 - (_BYTE *)v59) >> 3);
      if (v59)
      {
        v60 = v59;
        operator delete(v59);
      }
      v46 = (double *)*v45;
      v47 = (_BYTE *)v45[1] - (_BYTE *)*v45;
      if (v47)
      {
        v48 = v47 >> 3;
        v49 = (double *)*v37;
        if (v48 <= 1)
          v48 = 1;
        v50 = 0.0;
        do
        {
          v51 = *v46++;
          v52 = v51;
          v53 = *v49++;
          v50 = v50 + v52 * v53;
          --v48;
        }
        while (v48);
      }
      else
      {
        v50 = 0.0;
      }
      v71[v36] = 1.0 / v50;
      std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>((char *)&v66, *(char **)__str, (uint64_t)v70, (uint64_t)&v70[-*(_QWORD *)__str] >> 3);
      std::vector<double>::__assign_with_size[abi:ne180100]<double *,double *>((char *)&v64, (char *)__p, (uint64_t)v62, (v62 - (_BYTE *)__p) >> 3);
      if (__p)
      {
        v62 = __p;
        operator delete(__p);
      }
      if (*(_QWORD *)__str)
      {
        v70 = *(char **)__str;
        operator delete(*(void **)__str);
      }
      ++v13;
    }
    while (v13 < LBFGS_MAX_ITER);
  }
  *a4 = 0;
  a4[1] = 0;
  a4[2] = 0;
  std::vector<double>::__init_with_size[abi:ne180100]<double *,double *>(a4, v66, (uint64_t)v67, (v67 - (_BYTE *)v66) >> 3);
  for (k = 0; k != -240; k -= 24)
  {
    v55 = *(void **)&v72[k + 216];
    if (v55)
    {
      *(_QWORD *)&v72[k + 224] = v55;
      operator delete(v55);
    }
  }
  for (m = 0; m != -240; m -= 24)
  {
    v57 = *(void **)&v73[m + 216];
    if (v57)
    {
      *(_QWORD *)&v73[m + 224] = v57;
      operator delete(v57);
    }
  }
  if (v63[0])
  {
    v63[1] = v63[0];
    operator delete(v63[0]);
  }
  if (v64)
  {
    v65 = v64;
    operator delete(v64);
  }
  if (v66)
  {
    v67 = v66;
    operator delete(v66);
  }
}

void sub_1A36DFB74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, void *__p, uint64_t a19, uint64_t a20,void *a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  void *v73;

  v70 = 0;
  while (1)
  {
    v71 = *(void **)(&a69 + v70 + 216);
    if (v71)
    {
      *(_QWORD *)(&a69 + v70 + 224) = v71;
      operator delete(v71);
    }
    v70 -= 24;
    if (v70 == -240)
    {
      v72 = 0;
      while (1)
      {
        v73 = *(void **)((char *)&STACK[0x2D0] + v72 + 216);
        if (v73)
        {
          *(unint64_t *)((char *)&STACK[0x2D0] + v72 + 224) = (unint64_t)v73;
          operator delete(v73);
        }
        v72 -= 24;
        if (v72 == -240)
        {
          if (__p)
            operator delete(__p);
          if (a21)
            operator delete(a21);
          if (a24)
            operator delete(a24);
          _Unwind_Resume(a1);
        }
      }
    }
  }
}

void sub_1A36DFCAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a69;
  uint64_t v69;
  void *v70;

  for (; v69; v69 -= 24)
  {
    v70 = *(void **)(&a69 + v69 - 24);
    if (v70)
    {
      *(_QWORD *)(&a69 + v69 - 16) = v70;
      operator delete(v70);
    }
  }
  JUMPOUT(0x1A36DFC4CLL);
}

void sub_1A36DFCD8()
{
  uint64_t v0;
  void *v1;

  for (; v0; v0 -= 24)
  {
    v1 = *(void **)((char *)&STACK[0x2D0] + v0 - 24);
    if (v1)
    {
      *(unint64_t *)((char *)&STACK[0x2D0] + v0 - 16) = (unint64_t)v1;
      operator delete(v1);
    }
  }
  JUMPOUT(0x1A36DFC74);
}

void requestContextualEmbeddingAssetsForEmbedding(void *a1)
{
  id v1;
  _QWORD v2[4];
  id v3;

  v1 = a1;
  if ((objc_msgSend(v1, "hasAvailableAssets") & 1) == 0)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __requestContextualEmbeddingAssetsForEmbedding_block_invoke;
    v2[3] = &unk_1E4A3B548;
    v3 = v1;
    objc_msgSend(v3, "requestEmbeddingAssetsWithCompletionHandler:", v2);

  }
}

void sub_1A36E0EE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  char a65;
  uint64_t v65;

  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a53, 8);
  _Block_object_dispose(&a57, 8);
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&a65, 8);
  _Block_object_dispose((const void *)(v65 - 208), 8);
  _Block_object_dispose((const void *)(v65 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t copySampleDataEnumerator_0(void *a1, _BYTE *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "nextInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "instanceDictionary");
  }
  else
  {
    v5 = 0;
    *a2 = 1;
  }

  return v5;
}

void __requestContextualEmbeddingAssetsForEmbedding_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  switch(a2)
  {
    case 2:
      v6 = v5;
      NSLog(CFSTR("Failed to load assets for contextual embedding %@: %@"), *(_QWORD *)(a1 + 32), v5);
      goto LABEL_7;
    case 1:
      v6 = v5;
      NSLog(CFSTR("Assets not available for contextual embedding %@"), *(_QWORD *)(a1 + 32));
      goto LABEL_7;
    case 0:
      v6 = v5;
      NSLog(CFSTR("Assets are now available for contextual embedding %@"), *(_QWORD *)(a1 + 32));
LABEL_7:
      v5 = v6;
      break;
  }

}

id _parameterValuesForHyperTuneValues(void *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  id v10;
  unint64_t v11;
  void *v12;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = a1;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v16;
    v6 = 0x1E0CB3000uLL;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v16 != v5)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v2, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
          if (objc_msgSend(v10, "count") == 1)
          {
            objc_msgSend(v10, "firstObject");
            v11 = v6;
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setObject:forKey:", v12, v8);

            v6 = v11;
          }
          else
          {
            objc_msgSend(v14, "setObject:forKey:", v10, v8);
          }

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v14, "setObject:forKey:", v9, v8);
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v4);
  }

  return v14;
}

uint64_t createMRLModelFromTrainingDataSet(void *a1, int a2, uint64_t a3, void *a4)
{
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  unint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _QWORD *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  double Current;
  void *v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  NLNumberGenerator *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  void *v49;
  unint64_t v51;
  uint64_t v52;
  float ***v53;
  NLNumberGenerator *v54;
  NSString *v55;
  NSString *v56;
  id v57;
  void *v58;
  void *v59;
  unint64_t v60;
  unint64_t v61;
  int *v62;
  int *v63;
  float *v64;
  float *v65;
  uint64_t v66;
  _QWORD v67[3];

  v67[1] = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v57 = a4;
  v65 = 0;
  v63 = 0;
  v64 = 0;
  v62 = 0;
  if (a2)
    v8 = 6;
  else
    v8 = 4;
  v61 = objc_msgSend(v7, "numberOfTrainingInstances");
  v60 = objc_msgSend(v7, "numberOfValidationInstances");
  objc_msgSend(v7, "numberOfLabels");
  objc_msgSend(v7, "numberOfVocabularyEntries");
  v54 = objc_alloc_init(NLNumberGenerator);
  objc_msgSend(v7, "labelMap");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "vocabularyMap");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v56 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v55 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (v61)
  {
    v9 = 0;
    v10 = 0;
    v11 = a3;
    do
    {
      objc_msgSend(v7, "trainingInstanceAtIndex:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
      {
        objc_msgSend(v12, "formattedLineWithLabelMap:vocabularyMap:", v58, v59);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v14)
        {
          -[NSString appendFormat:](v56, "appendFormat:", CFSTR("%@\n"), v14);
          v16 = v11 / v61;
          if (v11 / v61 > v10)
            reportInstanceCompletionToTrainer(v57, v11 / v61, a3, 2);
        }
        else
        {
          v16 = v10;
        }

        v10 = v16;
      }

      ++v9;
      v11 += a3;
    }
    while (v9 < v61);
  }
  if (v60)
  {
    for (i = 0; i < v60; ++i)
    {
      objc_msgSend(v7, "validationInstanceAtIndex:", i);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
      {
        objc_msgSend(v18, "formattedLineWithLabelMap:vocabularyMap:", v58, v59);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v20;
        if (v20)
          -[NSString appendFormat:](v55, "appendFormat:", CFSTR("%@\n"), v20);

      }
    }
  }
  prepareData(v56, (const float **)&v65, (const int **)&v63, &v61);
  v22 = (_QWORD *)prepareInputVectors(v65, v61);
  v23 = prepareOutputLabels(v63, v61);
  prepareData(v55, (const float **)&v64, (const int **)&v62, &v60);
  v53 = (float ***)prepareInputVectors(v64, v60);
  v52 = prepareOutputLabels(v62, v60);
  if (v61)
  {
    v24 = v61 / 5;
    if (v61 / 5 <= 6)
      v24 = 6;
    if (v61 >= 0x64)
      v24 = 100;
    if (v24 >= v61)
      v25 = v61;
    else
      v25 = v24;
    v26 = v61 / v25;
    if (v61 / v25 <= 0x1E)
      v26 = 30;
    v51 = v26;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Starting RNN training with %llu samples"), a3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "logMessage:", v27);

    Current = CFAbsoluteTimeGetCurrent();
    v66 = *MEMORY[0x1E0D50588];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v67[0] = v29;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, &v66, 1);
    v30 = MRLModelCompile();

    MRLModelSetMaxSequenceLength();
    if (v30)
    {
      v31 = 0;
      while (1)
      {
        if (v31)
          MRLModelInitEpoch();
        v32 = v61;
        v33 = v54;
        if (v32 >= 2)
        {
          v34 = v32 - 1;
          do
          {
            v35 = -[NLNumberGenerator numberInRange:](v33, "numberInRange:", 0, v34 + 1);
            if (v34 != v35)
            {
              v36 = v22[v34];
              v22[v34] = v22[v35];
              v22[v35] = v36;
              v37 = *(_QWORD *)(v23 + 8 * v34);
              *(_QWORD *)(v23 + 8 * v34) = *(_QWORD *)(v23 + 8 * v35);
              *(_QWORD *)(v23 + 8 * v35) = v37;
            }
          }
          while (v34-- > 1);
        }

        v39 = 0;
        v40 = v51;
        do
        {
          v41 = v39 + v25;
          MRLModelTrainBatch();
          if (v41 >= v61)
            v39 = 0;
          else
            v39 = v41;
          --v40;
        }
        while (v40);
        v42 = (void *)MRLModelEvaluate();
        objc_msgSend(v42, "objectForKey:", *MEMORY[0x1E0D50578]);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v44 = v43;
        if (v43)
        {
          objc_msgSend(v43, "doubleValue");
          v46 = v45 / -100.0 + 1.0;
        }
        else
        {
          v46 = 0.0;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Iteration %llu validation accuracy %.6f"), v31 + 1, *(_QWORD *)&v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "logMessage:", v47);

        CFRelease(v42);
        if (objc_msgSend(v57, "shouldStop"))
          break;

        if (v31++ >= 9)
          goto LABEL_53;
      }
      releaseMRLModel(v30);

      v30 = 0;
    }
LABEL_53:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Finished RNN training in %.2f seconds"), CFAbsoluteTimeGetCurrent() - Current);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "logMessage:", v49);

    freeInputVectors(v22, v61);
    MEMORY[0x1A8592B3C](v23, 0x50C80EE9192B6);
    freeData((uint64_t)v65, v63);
    freeInputVectors(v53, v60);
    MEMORY[0x1A8592B3C](v52, 0x50C80EE9192B6);
    freeData((uint64_t)v64, v62);
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

void sub_1A36EC1C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22)
{
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

void prepareData(NSString *a1, const float **a2, const int **a3, unint64_t *a4)
{
  NSString *v7;
  uint64_t v8;
  const float *v9;
  const int *v10;
  _QWORD v11[7];
  _QWORD v12[5];
  _QWORD v13[4];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v7 = a1;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v8 = MEMORY[0x1E0C809B0];
  v13[3] = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = ___ZL11prepareDataP8NSStringPPKfPPKiPm_block_invoke;
  v12[3] = &unk_1E4A3B7E0;
  v12[4] = &v14;
  -[NSString enumerateLinesUsingBlock:](v7, "enumerateLinesUsingBlock:", v12);
  v9 = (const float *)operator new[]();
  v10 = (const int *)operator new[]();
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = ___ZL11prepareDataP8NSStringPPKfPPKiPm_block_invoke_2;
  v11[3] = &unk_1E4A3B808;
  v11[4] = v13;
  v11[5] = v9;
  v11[6] = v10;
  -[NSString enumerateLinesUsingBlock:](v7, "enumerateLinesUsingBlock:", v11);
  if (a2)
    *a2 = v9;
  if (a3)
    *a3 = v10;
  if (a4)
    *a4 = v15[3];
  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v14, 8);

}

void sub_1A36EC454(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  void *v13;
  uint64_t v14;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 112), 8);

  _Unwind_Resume(a1);
}

uint64_t prepareInputVectors(const float *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64x2_t v8;
  int64x2_t v9;
  int64x2_t v11;
  int64x2_t v12;

  v4 = operator new[]();
  if (a2)
  {
    v5 = 0;
    v12 = vdupq_n_s64((unint64_t)a1);
    v11 = vdupq_n_s64(2uLL);
    do
    {
      v6 = operator new[]();
      v7 = 0;
      *(_QWORD *)(v4 + 8 * v5) = v6;
      v8 = vdupq_n_s64((32 * v5));
      v9 = (int64x2_t)xmmword_1A36F7930;
      do
      {
        *(int64x2_t *)(v6 + v7) = vaddq_s64(v12, vshlq_n_s64(vaddq_s64(v9, v8), 2uLL));
        v9 = vaddq_s64(v9, v11);
        v7 += 16;
      }
      while (v7 != 256);
      ++v5;
    }
    while (v5 != a2);
  }
  return v4;
}

uint64_t prepareOutputLabels(const int *a1, uint64_t a2)
{
  uint64_t result;
  unint64_t v5;
  uint64x2_t v6;
  int64x2_t v7;
  _QWORD *v8;
  int8x16_t v9;
  int64x2_t v10;
  int32x2_t v11;
  int8x16_t v12;

  result = operator new[]();
  if (a2)
  {
    v5 = (a2 + 1) & 0xFFFFFFFFFFFFFFFELL;
    v6 = (uint64x2_t)vdupq_n_s64(a2 - 1);
    v7 = (int64x2_t)xmmword_1A36F7930;
    v8 = (_QWORD *)(result + 8);
    v9 = (int8x16_t)vdupq_n_s64(0xFFFFFFE0uLL);
    v10 = vdupq_n_s64(2uLL);
    do
    {
      v11 = vmovn_s64((int64x2_t)vcgeq_u64(v6, (uint64x2_t)v7));
      v12 = vandq_s8((int8x16_t)vshlq_n_s64(v7, 5uLL), v9);
      if ((v11.i8[0] & 1) != 0)
        *(v8 - 1) = &a1[v12.i64[0]];
      if ((v11.i8[4] & 1) != 0)
        *v8 = &a1[v12.i64[1]];
      v7 = vaddq_s64(v7, v10);
      v8 += 2;
      v5 -= 2;
    }
    while (v5);
  }
  return result;
}

_QWORD *freeInputVectors(_QWORD *result, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  if (a2)
  {
    v2 = a2;
    v3 = result;
    do
    {
      if (*v3)
        MEMORY[0x1A8592B3C](*v3, 0xC0C80B8AA526DLL);
      ++v3;
      --v2;
    }
    while (v2);
LABEL_8:
    JUMPOUT(0x1A8592B3CLL);
  }
  if (result)
    goto LABEL_8;
  return result;
}

uint64_t freeData(uint64_t result, const int *a2)
{
  if (result)
    result = MEMORY[0x1A8592B3C](result, 0x1000C8052888210);
  if (a2)
    JUMPOUT(0x1A8592B3CLL);
  return result;
}

void ___ZL11prepareDataP8NSStringPPKfPPKiPm_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a2, "componentsSeparatedByString:", CFSTR("\t"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") == 2)
  {
    objc_msgSend(v7, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "componentsSeparatedByString:", CFSTR(" "));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "objectAtIndex:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(" "));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "count") == 32 && objc_msgSend(v6, "count") == 32)
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);

  }
}

void sub_1A36EC7E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void ___ZL11prepareDataP8NSStringPPKfPPKiPm_block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t i;
  void *v9;
  int v10;
  int v11;
  void *v12;
  int v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "componentsSeparatedByString:", CFSTR("\t"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 2)
  {
    objc_msgSend(v3, "objectAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR(" "));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "objectAtIndex:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(" "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "count") == 32 && objc_msgSend(v7, "count") == 32)
    {
      for (i = 0; i != 32; ++i)
      {
        objc_msgSend(v5, "objectAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "floatValue");
        v11 = v10;

        objc_msgSend(v7, "objectAtIndex:", i);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "intValue");

        *(_DWORD *)(a1[5] + (*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) << 7) + 4 * i) = v11;
        *(_DWORD *)(a1[6] + (*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) << 7) + 4 * i) = v13;
      }
      ++*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24);
    }

  }
}

void sub_1A36EC9AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void requestContextualEmbeddingAssetsForEmbedding_0(void *a1)
{
  id v1;
  _QWORD v2[4];
  id v3;

  v1 = a1;
  if ((objc_msgSend(v1, "hasAvailableAssets") & 1) == 0)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __requestContextualEmbeddingAssetsForEmbedding_block_invoke_0;
    v2[3] = &unk_1E4A3B548;
    v3 = v1;
    objc_msgSend(v3, "requestEmbeddingAssetsWithCompletionHandler:", v2);

  }
}

void sub_1A36EE9E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a72;
  uint64_t v72;

  _Block_object_dispose(&a72, 8);
  _Block_object_dispose((const void *)(v72 - 176), 8);
  _Unwind_Resume(a1);
}

void requestWordEmbeddingAssetsForLanguage(void *a1)
{
  id v1;
  id v2;
  _QWORD v3[4];
  id v4;

  v1 = a1;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __requestWordEmbeddingAssetsForLanguage_block_invoke;
  v3[3] = &unk_1E4A3B548;
  v4 = v1;
  v2 = v1;
  +[NLTagger requestAssetsForLanguage:tagScheme:completionHandler:](NLTagger, "requestAssetsForLanguage:tagScheme:completionHandler:", v2, CFSTR("WordEmbedding"), v3);

}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

CFMutableDictionaryRef copySampleDataEnumerator_1(void *a1, unint64_t a2, int a3, void *a4, void *a5, void *a6, void *a7, uint64_t a8, _BYTE *a9)
{
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const __CFDictionary *v22;
  CFMutableDictionaryRef i;
  id v24;
  __CFDictionary *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v40;
  uint64_t v41;
  id v42;
  void *value;
  id v44;
  void *v45;

  v16 = a1;
  v42 = a4;
  v17 = a5;
  v18 = a6;
  v44 = a7;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  value = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
    objc_msgSend(v16, "rewindAndShuffle:", a8);
  v20 = objc_msgSend(v16, "index");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu->%llu"), v20, a2 + v20 - 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "objectForKey:", v21);
  v22 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    for (i = CFDictionaryCreateMutableCopy(0, 0, v22); a2; --a2)
      v24 = (id)objc_msgSend(v16, "nextInstance");
LABEL_20:
    v36 = v42;
    goto LABEL_26;
  }
  v41 = v20;
  v40 = a2 + v20 - 1;
  if (objc_msgSend(v19, "count") < a2)
  {
    while (1)
    {
      objc_msgSend(v16, "nextInstance");
      v25 = (__CFDictionary *)objc_claimAutoreleasedReturnValue();
      i = v25;
      if (!v25)
        break;
      -[__CFDictionary tokens](v25, "tokens");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v17)
        normalizedQuoteTokens(v26);
      else
        formattedTokens(v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      -[__CFDictionary label](i, "label");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKey:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = objc_msgSend(v30, "unsignedIntegerValue");
      if (v30)
      {
        v32 = v31;
        if (v31)
        {
          if (objc_msgSend(v28, "count"))
          {
            objc_msgSend(v19, "addObject:", v28);
            -[__CFDictionary string](i, "string");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "addObject:", v33);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v32 - 1);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(value, "addObject:", v34);

            v22 = 0;
          }
        }
      }

      if (objc_msgSend(v19, "count") >= a2)
        goto LABEL_17;
    }
    *a9 = 1;
    goto LABEL_20;
  }
LABEL_17:
  if (v17)
  {
    objc_msgSend(v17, "vectorsForTokenizedSentences:untokenizedSentences:maxTokens:", v19, v45, 50);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v42;
  }
  else
  {
    v36 = v42;
    objc_msgSend(v42, "vectorsForTokenizedSentences:untokenizedSentences:maxTokens:", v19, v45, 50);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v35)
  {
    i = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
    CFDictionaryAddValue(i, (const void *)*MEMORY[0x1E0D50390], v35);
    CFDictionaryAddValue(i, (const void *)*MEMORY[0x1E0D50398], value);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", i);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu->%llu"), v41, v40);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setObject:forKey:", v37, v38);

    v22 = 0;
  }
  else
  {
    i = 0;
  }

LABEL_26:
  return i;
}

id normalizedQuoteTokens(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v6)
        objc_enumerationMutation(v3);
      v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v7);
      if ((unint64_t)objc_msgSend(v2, "count", (_QWORD)v13) > 0x27)
        break;
      v9 = v8;
      objc_msgSend(v9, "rangeOfString:", CFSTR("’"));
      if (v10)
      {
        objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("’"), CFSTR("'"));
        v11 = objc_claimAutoreleasedReturnValue();

        v9 = (id)v11;
      }
      objc_msgSend(v2, "addObject:", v9);

      if (v5 == ++v7)
      {
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v5)
          goto LABEL_3;
        break;
      }
    }
  }

  return v2;
}

id formattedTokens(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  id obj;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (formattedTokens_onceToken != -1)
    dispatch_once(&formattedTokens_onceToken, &__block_literal_global_9);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v1;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v29;
    v20 = *(_QWORD *)v29;
    do
    {
      v6 = 0;
      v21 = v4;
      do
      {
        if (*(_QWORD *)v29 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v6);
        if ((unint64_t)objc_msgSend(v2, "count", v20) <= 0x31)
        {
          objc_msgSend(v7, "rangeOfCharacterFromSet:", formattedTokens_alphanumericCharacterSet);
          if (v8)
          {
            v23 = v6;
            v26 = 0u;
            v27 = 0u;
            v24 = 0u;
            v25 = 0u;
            objc_msgSend(v7, "componentsSeparatedByCharactersInSet:", formattedTokens_internalSeparatorCharacterSet);
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            if (v10)
            {
              v11 = v10;
              v12 = *(_QWORD *)v25;
              do
              {
                for (i = 0; i != v11; ++i)
                {
                  if (*(_QWORD *)v25 != v12)
                    objc_enumerationMutation(v9);
                  v14 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
                  if ((unint64_t)objc_msgSend(v2, "count") <= 0x31)
                  {
                    objc_msgSend(v14, "rangeOfCharacterFromSet:", formattedTokens_alphanumericCharacterSet);
                    if (v15)
                    {
                      objc_msgSend(v14, "lowercaseString");
                      v16 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v16, "rangeOfString:", CFSTR("’"));
                      if (v17)
                      {
                        objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", CFSTR("’"), CFSTR("'"));
                        v18 = objc_claimAutoreleasedReturnValue();

                        v16 = (void *)v18;
                      }
                      objc_msgSend(v2, "addObject:", v16);

                    }
                  }
                }
                v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
              }
              while (v11);
            }

            v5 = v20;
            v4 = v21;
            v6 = v23;
          }
        }
        ++v6;
      }
      while (v6 != v4);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v4);
  }

  return v2;
}

void __requestContextualEmbeddingAssetsForEmbedding_block_invoke_0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  switch(a2)
  {
    case 2:
      v6 = v5;
      NSLog(CFSTR("Failed to load assets for contextual embedding %@: %@"), *(_QWORD *)(a1 + 32), v5);
      goto LABEL_7;
    case 1:
      v6 = v5;
      NSLog(CFSTR("Assets not available for contextual embedding %@"), *(_QWORD *)(a1 + 32));
      goto LABEL_7;
    case 0:
      v6 = v5;
      NSLog(CFSTR("Assets are now available for contextual embedding %@"), *(_QWORD *)(a1 + 32));
LABEL_7:
      v5 = v6;
      break;
  }

}

void __requestWordEmbeddingAssetsForLanguage_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v5 = a3;
  switch(a2)
  {
    case 2:
      v6 = v5;
      NSLog(CFSTR("Failed to load embedding assets for language %@: %@"), *(_QWORD *)(a1 + 32), v5);
      goto LABEL_7;
    case 1:
      v6 = v5;
      NSLog(CFSTR("Embedding assets not available for language %@"), *(_QWORD *)(a1 + 32));
      goto LABEL_7;
    case 0:
      v6 = v5;
      NSLog(CFSTR("Embedding assets are now available for language %@"), *(_QWORD *)(a1 + 32));
LABEL_7:
      v5 = v6;
      break;
  }

}

void __formattedTokens_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3500], "alphanumericCharacterSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)formattedTokens_alphanumericCharacterSet;
  formattedTokens_alphanumericCharacterSet = v0;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(".,;-_/"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)formattedTokens_internalSeparatorCharacterSet;
  formattedTokens_internalSeparatorCharacterSet = v2;

}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

uint64_t CEMStringContainsEmoji()
{
  return MEMORY[0x1E0D15DC0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98558](allocator, capacity, theDict);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x1E0C98798](allocator, localeIdentifier);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1E0C989A8](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x1E0C99208](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1E0C99220](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1;
  CFIndex v2;
  CFRange result;

  v1 = MEMORY[0x1E0C99230](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

void CFStringTokenizerSetString(CFStringTokenizerRef tokenizer, CFStringRef string, CFRange range)
{
  MEMORY[0x1E0C99240](tokenizer, string, range.location, range.length);
}

uint64_t CoreLMCopyConditionalProbabilities()
{
  return MEMORY[0x1E0D16FD8]();
}

uint64_t CoreLMCopyPredictions()
{
  return MEMORY[0x1E0D16FE0]();
}

uint64_t CoreLMCopyTokenIdsForText()
{
  return MEMORY[0x1E0D16FE8]();
}

uint64_t CoreLMCreate()
{
  return MEMORY[0x1E0D16FF8]();
}

uint64_t CoreLMCreateCopy()
{
  return MEMORY[0x1E0D17000]();
}

uint64_t CoreLMReset()
{
  return MEMORY[0x1E0D17018]();
}

uint64_t CoreLMUpdateWithContext()
{
  return MEMORY[0x1E0D17028]();
}

uint64_t HTTuneParameters()
{
  return MEMORY[0x1E0D50388]();
}

uint64_t LDEnumerateAssetDataItems()
{
  return MEMORY[0x1E0D43820]();
}

uint64_t LMLanguageModelAddTokenForString()
{
  return MEMORY[0x1E0D42C48]();
}

uint64_t LMLanguageModelApplyExponentialDecay()
{
  return MEMORY[0x1E0D42C58]();
}

uint64_t LMLanguageModelConditionalProbability()
{
  return MEMORY[0x1E0D42C60]();
}

uint64_t LMLanguageModelCreate()
{
  return MEMORY[0x1E0D42C78]();
}

uint64_t LMLanguageModelCreateStringForTokenID()
{
  return MEMORY[0x1E0D42C90]();
}

uint64_t LMLanguageModelDecrementUsageCount()
{
  return MEMORY[0x1E0D42C98]();
}

uint64_t LMLanguageModelEnumeratePredictionsWithBlock()
{
  return MEMORY[0x1E0D42CA8]();
}

uint64_t LMLanguageModelFlushDynamicData()
{
  return MEMORY[0x1E0D42CB0]();
}

uint64_t LMLanguageModelGetDynamicTokenIDRange()
{
  return MEMORY[0x1E0D42CB8]();
}

uint64_t LMLanguageModelGetTokenIDForUTF8String()
{
  return MEMORY[0x1E0D42CC8]();
}

uint64_t LMLanguageModelGetUsageCount()
{
  return MEMORY[0x1E0D42CD0]();
}

uint64_t LMLanguageModelIncrementUsageCount()
{
  return MEMORY[0x1E0D42CD8]();
}

uint64_t LMLanguageModelPerformMaintenance()
{
  return MEMORY[0x1E0D42CE8]();
}

uint64_t LMLanguageModelPrune()
{
  return MEMORY[0x1E0D42CF0]();
}

uint64_t LMLanguageModelRecordTokenUsageWithDifferentialPrivacy()
{
  return MEMORY[0x1E0D42CF8]();
}

uint64_t LMLanguageModelRelease()
{
  return MEMORY[0x1E0D42D00]();
}

uint64_t LMLanguageModelReset()
{
  return MEMORY[0x1E0D42D10]();
}

uint64_t LMLanguageModelSetLogLevel()
{
  return MEMORY[0x1E0D42D28]();
}

uint64_t LMLanguageModelShouldAdaptToTokenSequence()
{
  return MEMORY[0x1E0D42D30]();
}

uint64_t LMLanguageModelTokenSequenceIsBlocklisted()
{
  return MEMORY[0x1E0D42D48]();
}

uint64_t LXCursorCopyTraversedCharacters()
{
  return MEMORY[0x1E0D43538]();
}

uint64_t LXCursorCreateByAdvancing()
{
  return MEMORY[0x1E0D43540]();
}

uint64_t LXCursorEnumerateChildren()
{
  return MEMORY[0x1E0D43550]();
}

uint64_t LXCursorEnumerateEntries()
{
  return MEMORY[0x1E0D43558]();
}

uint64_t LXCursorEnumerateEntriesRecursively()
{
  return MEMORY[0x1E0D43560]();
}

uint64_t LXCursorHasChildren()
{
  return MEMORY[0x1E0D43570]();
}

uint64_t LXCursorHasEntries()
{
  return MEMORY[0x1E0D43578]();
}

uint64_t LXCursorPrefixProbability()
{
  return MEMORY[0x1E0D43598]();
}

uint64_t LXCursorTerminationProbability()
{
  return MEMORY[0x1E0D435A8]();
}

uint64_t LXEntryCopyString()
{
  return MEMORY[0x1E0D435C8]();
}

uint64_t LXEntryGetMetaFlags()
{
  return MEMORY[0x1E0D43600]();
}

uint64_t LXEntryGetProbability()
{
  return MEMORY[0x1E0D43618]();
}

uint64_t LXEntryGetTokenID()
{
  return MEMORY[0x1E0D43628]();
}

uint64_t LXLexiconCopyEntryForTokenID()
{
  return MEMORY[0x1E0D43678]();
}

uint64_t LXLexiconCreate()
{
  return MEMORY[0x1E0D43690]();
}

uint64_t LXLexiconCreateRootCursor()
{
  return MEMORY[0x1E0D436A0]();
}

uint64_t MLPModelTrainerCreate()
{
  return MEMORY[0x1E0D503A8]();
}

uint64_t MLPModelTrainerEvaluateModel()
{
  return MEMORY[0x1E0D503B0]();
}

uint64_t MLPModelTrainerTrainModel()
{
  return MEMORY[0x1E0D503F8]();
}

uint64_t MRLModelCompile()
{
  return MEMORY[0x1E0D50400]();
}

uint64_t MRLModelCopyQuantizedSerializedData()
{
  return MEMORY[0x1E0D50408]();
}

uint64_t MRLModelCreate()
{
  return MEMORY[0x1E0D50410]();
}

uint64_t MRLModelEvaluate()
{
  return MEMORY[0x1E0D50418]();
}

uint64_t MRLModelGetOutputSize()
{
  return MEMORY[0x1E0D50428]();
}

uint64_t MRLModelInitEpoch()
{
  return MEMORY[0x1E0D50430]();
}

uint64_t MRLModelRecognize()
{
  return MEMORY[0x1E0D50438]();
}

uint64_t MRLModelRelease()
{
  return MEMORY[0x1E0D50440]();
}

uint64_t MRLModelSetMaxSequenceLength()
{
  return MEMORY[0x1E0D50450]();
}

uint64_t MRLModelTrainBatch()
{
  return MEMORY[0x1E0D50468]();
}

uint64_t MRLNeuralNetworkCreate()
{
  return MEMORY[0x1E0D50498]();
}

uint64_t MRLNeuralNetworkGetOutput()
{
  return MEMORY[0x1E0D504A8]();
}

uint64_t MRLNeuralNetworkPredict()
{
  return MEMORY[0x1E0D504C0]();
}

uint64_t MRLNeuralNetworkSetInput()
{
  return MEMORY[0x1E0D504C8]();
}

uint64_t NLEmbeddingSubwordVocabCopyTextForTokenIds()
{
  return MEMORY[0x1E0D17040]();
}

uint64_t NLEmbeddingSubwordVocabCopyTokenIdsForText()
{
  return MEMORY[0x1E0D17048]();
}

uint64_t NLEmbeddingSubwordVocabCreate()
{
  return MEMORY[0x1E0D17050]();
}

uint64_t NLGazetteerCopyAvailableLabels()
{
  return MEMORY[0x1E0D17058]();
}

uint64_t NLGazetteerCopyCompressedModel()
{
  return MEMORY[0x1E0D17060]();
}

uint64_t NLGazetteerCopyLabel()
{
  return MEMORY[0x1E0D17068]();
}

uint64_t NLGazetteerCreate()
{
  return MEMORY[0x1E0D17070]();
}

uint64_t NLLanguageIdentifierConsumeString()
{
  return MEMORY[0x1E0D17080]();
}

uint64_t NLLanguageIdentifierCreate()
{
  return MEMORY[0x1E0D17088]();
}

uint64_t NLLanguageIdentifierGetTopHypotheses()
{
  return MEMORY[0x1E0D17090]();
}

uint64_t NLLanguageIdentifierGetTopHypothesis()
{
  return MEMORY[0x1E0D17098]();
}

uint64_t NLLanguageIdentifierGetTopLanguage()
{
  return MEMORY[0x1E0D170A0]();
}

uint64_t NLLanguageIdentifierRelease()
{
  return MEMORY[0x1E0D170A8]();
}

uint64_t NLLanguageIdentifierReset()
{
  return MEMORY[0x1E0D170B8]();
}

uint64_t NLLanguageIdentifierSetLanguageConstraints()
{
  return MEMORY[0x1E0D170C0]();
}

uint64_t NLLanguageIdentifierSetLanguageHints()
{
  return MEMORY[0x1E0D170C8]();
}

uint64_t NLModelContainerCopyContainerData()
{
  return MEMORY[0x1E0D170D8]();
}

uint64_t NLModelContainerCopyInfoDictionary()
{
  return MEMORY[0x1E0D170E0]();
}

uint64_t NLModelContainerCopyModelDataAtIndex()
{
  return MEMORY[0x1E0D170E8]();
}

uint64_t NLModelContainerCreate()
{
  return MEMORY[0x1E0D170F0]();
}

uint64_t NLModelContainerCreateWithContainerData()
{
  return MEMORY[0x1E0D170F8]();
}

uint64_t NLModelContainerGetModelDataCount()
{
  return MEMORY[0x1E0D17100]();
}

uint64_t NLModelContainerGetRevision()
{
  return MEMORY[0x1E0D17108]();
}

uint64_t NLModelContainerGetSubtype()
{
  return MEMORY[0x1E0D17110]();
}

uint64_t NLModelContainerGetType()
{
  return MEMORY[0x1E0D17118]();
}

uint64_t NLModelCopyContainer()
{
  return MEMORY[0x1E0D17120]();
}

uint64_t NLModelCopyPredictedLabels()
{
  return MEMORY[0x1E0D17128]();
}

uint64_t NLModelCopyPredictedLabelsAndProbabilities()
{
  return MEMORY[0x1E0D17130]();
}

uint64_t NLModelCreateWithContainer()
{
  return MEMORY[0x1E0D17138]();
}

uint64_t NLModelTrainerCreate()
{
  return MEMORY[0x1E0D17140]();
}

uint64_t NLModelTrainerTrainAndCopyContainer()
{
  return MEMORY[0x1E0D17148]();
}

uint64_t NLStringEmbeddingCopyCurrentVersion()
{
  return MEMORY[0x1E0D17168]();
}

uint64_t NLStringEmbeddingCopyData()
{
  return MEMORY[0x1E0D17170]();
}

uint64_t NLStringEmbeddingCopyDataForTokenizedBatch()
{
  return MEMORY[0x1E0D17178]();
}

uint64_t NLStringEmbeddingCopyModelLocale()
{
  return MEMORY[0x1E0D17180]();
}

uint64_t NLStringEmbeddingCopyNeighborsForVectorWithDistances()
{
  return MEMORY[0x1E0D17190]();
}

uint64_t NLStringEmbeddingCopyNeighborsWithDistances()
{
  return MEMORY[0x1E0D17198]();
}

uint64_t NLStringEmbeddingCopySupportedVersions()
{
  return MEMORY[0x1E0D171A0]();
}

uint64_t NLStringEmbeddingCopyTextForTokenIDs()
{
  return MEMORY[0x1E0D171A8]();
}

uint64_t NLStringEmbeddingCopyTokenIDsForText()
{
  return MEMORY[0x1E0D171B0]();
}

uint64_t NLStringEmbeddingCopyVector()
{
  return MEMORY[0x1E0D171B8]();
}

uint64_t NLStringEmbeddingCopyVersion()
{
  return MEMORY[0x1E0D171C0]();
}

uint64_t NLStringEmbeddingCreateWithOptions()
{
  return MEMORY[0x1E0D171C8]();
}

uint64_t NLStringEmbeddingFillTokenVectorsWithShape()
{
  return MEMORY[0x1E0D171D0]();
}

uint64_t NLStringEmbeddingFillWordVectors()
{
  return MEMORY[0x1E0D171D8]();
}

uint64_t NLStringEmbeddingGetDimension()
{
  return MEMORY[0x1E0D171E0]();
}

uint64_t NLStringEmbeddingGetDistance()
{
  return MEMORY[0x1E0D171E8]();
}

uint64_t NLStringEmbeddingGetVocabularySize()
{
  return MEMORY[0x1E0D171F0]();
}

uint64_t NLStringEmbeddingSaveCompressedModel()
{
  return MEMORY[0x1E0D171F8]();
}

uint64_t NLTaggerCopyAvailableTagSchemes()
{
  return MEMORY[0x1E0D17230]();
}

uint64_t NLTaggerCopyHypothesesAtIndex()
{
  return MEMORY[0x1E0D17238]();
}

uint64_t NLTaggerCopyTagAtIndex()
{
  return MEMORY[0x1E0D17240]();
}

uint64_t NLTaggerCopyTagForCurrentToken()
{
  return MEMORY[0x1E0D17248]();
}

uint64_t NLTaggerCreate()
{
  return MEMORY[0x1E0D17250]();
}

uint64_t NLTaggerEnumerateTokens()
{
  return MEMORY[0x1E0D17258]();
}

uint64_t NLTaggerGetTokenAtIndex()
{
  return MEMORY[0x1E0D17260]();
}

uint64_t NLTaggerSetGazetteers()
{
  return MEMORY[0x1E0D17268]();
}

uint64_t NLTaggerSetLocaleForRange()
{
  return MEMORY[0x1E0D17270]();
}

uint64_t NLTaggerSetString()
{
  return MEMORY[0x1E0D17278]();
}

uint64_t NLTokenizerCreate()
{
  return MEMORY[0x1E0D17298]();
}

uint64_t NLTokenizerGetNextToken()
{
  return MEMORY[0x1E0D172B0]();
}

uint64_t NLTokenizerGoToTokenAtIndex()
{
  return MEMORY[0x1E0D172B8]();
}

uint64_t NLTokenizerRelease()
{
  return MEMORY[0x1E0D172C8]();
}

uint64_t NLTokenizerSetLocale()
{
  return MEMORY[0x1E0D172D0]();
}

uint64_t NLTokenizerSetString()
{
  return MEMORY[0x1E0D172D8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB3400](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t language_modeling::v1::LanguageModel::deallocateInternalBuffers(language_modeling::v1::LanguageModel *this)
{
  return MEMORY[0x1E0D42EC0](this);
}

uint64_t language_modeling::v1::LanguageModel::init()
{
  return MEMORY[0x1E0D42EC8]();
}

uint64_t language_modeling::v1::LanguageModel::LanguageModel(language_modeling::v1::LanguageModel *this)
{
  return MEMORY[0x1E0D42ED8](this);
}

void language_modeling::v1::LanguageModel::~LanguageModel(language_modeling::v1::LanguageModel *this)
{
  MEMORY[0x1E0D42EE0](this);
}

uint64_t language_modeling::v1::LinguisticContext::push_back()
{
  return MEMORY[0x1E0D42F78]();
}

uint64_t language_modeling::v1::LinguisticContext::LinguisticContext(language_modeling::v1::LinguisticContext *this)
{
  return MEMORY[0x1E0D42F90](this);
}

void language_modeling::v1::LinguisticContext::~LinguisticContext(language_modeling::v1::LinguisticContext *this)
{
  MEMORY[0x1E0D42F98](this);
}

uint64_t language_modeling::v1::LanguageModelSession::adaptToToken()
{
  return MEMORY[0x1E0D42FD8]();
}

uint64_t language_modeling::v1::LanguageModelSession::unAdaptToToken()
{
  return MEMORY[0x1E0D42FF0]();
}

void language_modeling::v1::LanguageModelSession::~LanguageModelSession(language_modeling::v1::LanguageModelSession *this)
{
  MEMORY[0x1E0D43038](this);
}

uint64_t E5RT::E5Compiler::MakeCompiler()
{
  return MEMORY[0x1E0D1F578]();
}

uint64_t E5RT::E5Compiler::IsNewCompileRequired()
{
  return MEMORY[0x1E0D1F580]();
}

uint64_t E5RT::E5Compiler::Compile()
{
  return MEMORY[0x1E0D1F588]();
}

uint64_t E5RT::BufferObject::GetDataSpan(E5RT::BufferObject *this)
{
  return MEMORY[0x1E0D1F598](this);
}

uint64_t E5RT::ProgramLibrary::GetExportedFunctions(E5RT::ProgramLibrary *this)
{
  return MEMORY[0x1E0D1F5B0](this);
}

uint64_t E5RT::ExecutionStream::ResetStream(E5RT::ExecutionStream *this)
{
  return MEMORY[0x1E0D1F5C8](this);
}

uint64_t E5RT::ExecutionStream::EncodeOperation()
{
  return MEMORY[0x1E0D1F5D0]();
}

uint64_t E5RT::ExecutionStream::ExecuteStreamSync(E5RT::ExecutionStream *this)
{
  return MEMORY[0x1E0D1F5D8](this);
}

uint64_t E5RT::ExecutionStream::CreateExecutionStream(E5RT::ExecutionStream *this)
{
  return MEMORY[0x1E0D1F5E0](this);
}

uint64_t E5RT::E5CompilerOptions::SetMilEntryPoints()
{
  return MEMORY[0x1E0D1F5F0]();
}

uint64_t E5RT::E5CompilerOptions::SetPreferredCpuBackend()
{
  return MEMORY[0x1E0D1F608]();
}

uint64_t E5RT::E5CompilerOptions::SetComputeDeviceTypesAllowed()
{
  return MEMORY[0x1E0D1F610]();
}

uint64_t E5RT::E5CompilerOptions::Create(E5RT::E5CompilerOptions *this)
{
  return MEMORY[0x1E0D1F620](this);
}

uint64_t E5RT::E5CompilerConfigOptions::SetBundleCacheLocation()
{
  return MEMORY[0x1E0D1F630]();
}

uint64_t E5RT::E5CompilerConfigOptions::E5CompilerConfigOptions(E5RT::E5CompilerConfigOptions *this)
{
  return MEMORY[0x1E0D1F638](this);
}

void E5RT::E5CompilerConfigOptions::~E5CompilerConfigOptions(E5RT::E5CompilerConfigOptions *this)
{
  MEMORY[0x1E0D1F640](this);
}

uint64_t E5RT::ExecutionStreamOperation::CreatePreCompiledComputeOp()
{
  return MEMORY[0x1E0D1F660]();
}

uint64_t E5RT::PrecompiledComputeOpCreateOptions::Create()
{
  return MEMORY[0x1E0D1F678]();
}

uint64_t E5RT::IOPort::BindMemoryObject()
{
  return MEMORY[0x1E0D1F688]();
}

uint64_t language_modeling::v1::Prediction::contextSize(language_modeling::v1::Prediction *this)
{
  return MEMORY[0x1E0D43198](this);
}

uint64_t language_modeling::v1::Prediction::probability(language_modeling::v1::Prediction *this)
{
  return MEMORY[0x1E0D431A0](this);
}

uint64_t language_modeling::v1::Prediction::string(language_modeling::v1::Prediction *this)
{
  return MEMORY[0x1E0D431C0](this);
}

uint64_t language_modeling::v1::LanguageModel::makeSession()
{
  return MEMORY[0x1E0D431F8]();
}

uint64_t language_modeling::v1::LanguageModel::blocklistStatus()
{
  return MEMORY[0x1E0D43200]();
}

uint64_t language_modeling::v1::LanguageModelSession::enumeratePredictions()
{
  return MEMORY[0x1E0D43260]();
}

uint64_t language_modeling::v1::LanguageModelSession::conditionalProbability()
{
  return MEMORY[0x1E0D43270]();
}

uint64_t E5RT::TensorDataType::IsType<float>()
{
  return MEMORY[0x1E0D1F768]();
}

uint64_t E5RT::TensorDataType::IsType<int>()
{
  return MEMORY[0x1E0D1F770]();
}

uint64_t E5RT::TensorDescriptor::AllocateMemory()
{
  return MEMORY[0x1E0D1F778]();
}

uint64_t E5RT::TensorDescriptor::GetTensorShape(E5RT::TensorDescriptor *this)
{
  return MEMORY[0x1E0D1F788](this);
}

uint64_t E5RT::TensorDescriptor::GetTensorDataTypeRef(E5RT::TensorDescriptor *this)
{
  return MEMORY[0x1E0D1F798](this);
}

uint64_t E5RT::OperandDescriptor::TensorDescriptor(E5RT::OperandDescriptor *this)
{
  return MEMORY[0x1E0D1F7B0](this);
}

uint64_t E5RT::ExecutionStreamOperation::GetInputPorts(E5RT::ExecutionStreamOperation *this)
{
  return MEMORY[0x1E0D1F7D0](this);
}

uint64_t E5RT::ExecutionStreamOperation::GetOutputPorts(E5RT::ExecutionStreamOperation *this)
{
  return MEMORY[0x1E0D1F7D8](this);
}

uint64_t E5RT::IOPort::GetPortDescriptorRef(E5RT::IOPort *this)
{
  return MEMORY[0x1E0D1F7E8](this);
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x1E0DE4248](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x1E0DE4258](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4308](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

void std::string::__grow_by_and_replace(std::string *this, std::string::size_type __old_cap, std::string::size_type __delta_cap, std::string::size_type __old_sz, std::string::size_type __n_copy, std::string::size_type __n_del, std::string::size_type __n_add, const std::string::value_type *__p_new_stuff)
{
  MEMORY[0x1E0DE43F8](this, __old_cap, __delta_cap, __old_sz, __n_copy, __n_del, __n_add, __p_new_stuff);
}

std::string *__cdecl std::string::basic_string(std::string *this, const std::string *__str, std::string::size_type __pos, std::string::size_type __n, std::allocator<char> *__a)
{
  return (std::string *)MEMORY[0x1E0DE44C8](this, __str, __pos, __n, __a);
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x1E0DE44D8](this, __str);
}

uint64_t std::ostream::put()
{
  return MEMORY[0x1E0DE4698]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x1E0DE46A0]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x1E0DE46B0]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x1E0DE46B8]();
}

std::random_device *__cdecl std::random_device::random_device(std::random_device *this, const std::string *__token)
{
  return (std::random_device *)MEMORY[0x1E0DE4770](this, __token);
}

void std::random_device::~random_device(std::random_device *this)
{
  MEMORY[0x1E0DE4778](this);
}

std::random_device::result_type std::random_device::operator()(std::random_device *this)
{
  return MEMORY[0x1E0DE4780](this);
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE48F0](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
  MEMORY[0x1E0DE4900](this);
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x1E0DE4B98](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x1E0DE4C50](this);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x1E0DE4C80](this, *(_QWORD *)&__state);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, int __val)
{
  return (std::string *)MEMORY[0x1E0DE4D58](retstr, *(_QWORD *)&__val);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

uint64_t operator delete[]()
{
  return off_1E4A39B00();
}

void operator delete(void *__p)
{
  off_1E4A39B08(__p);
}

uint64_t operator delete()
{
  return off_1E4A39B10();
}

uint64_t operator new[]()
{
  return off_1E4A39B18();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E4A39B20(__sz);
}

uint64_t operator new()
{
  return off_1E4A39B28();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x1E0C833A0](a1, *(_QWORD *)&a2, a3);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

uint64_t maxent_add_training_sample()
{
  return MEMORY[0x1E0DDFE18]();
}

uint64_t maxent_classify()
{
  return MEMORY[0x1E0DDFE20]();
}

uint64_t maxent_get_class_label()
{
  return MEMORY[0x1E0DDFE28]();
}

uint64_t maxent_load_with_bytes()
{
  return MEMORY[0x1E0DDFE30]();
}

uint64_t maxent_model_create()
{
  return MEMORY[0x1E0DDFE38]();
}

uint64_t maxent_model_release()
{
  return MEMORY[0x1E0DDFE40]();
}

uint64_t maxent_sample_add_feature_with_value()
{
  return MEMORY[0x1E0DDFE48]();
}

uint64_t maxent_sample_create()
{
  return MEMORY[0x1E0DDFE50]();
}

uint64_t maxent_sample_get_label()
{
  return MEMORY[0x1E0DDFE58]();
}

uint64_t maxent_sample_release()
{
  return MEMORY[0x1E0DDFE60]();
}

uint64_t maxent_sample_set_label()
{
  return MEMORY[0x1E0DDFE68]();
}

uint64_t maxent_save_to_file()
{
  return MEMORY[0x1E0DDFE70]();
}

uint64_t maxent_train()
{
  return MEMORY[0x1E0DDFE78]();
}

uint64_t maxent_use_l2_regularizer()
{
  return MEMORY[0x1E0DDFE80]();
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x1E0C84070](__s, *(_QWORD *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

int puts(const char *a1)
{
  return MEMORY[0x1E0C84F60](a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B0](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1E0C855C0](__s1, __n);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85698](__str, __endptr, *(_QWORD *)&__base);
}

