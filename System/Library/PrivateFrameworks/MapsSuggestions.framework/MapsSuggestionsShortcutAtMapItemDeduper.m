@implementation MapsSuggestionsShortcutAtMapItemDeduper

- (MapsSuggestionsShortcutAtMapItemDeduper)initWithSacrificedTypes:(const void *)a3
{
  MapsSuggestionsShortcutAtMapItemDeduper *v4;
  MapsSuggestionsShortcutAtMapItemDeduper *v5;
  vector<MapsSuggestionsEntryType, std::allocator<MapsSuggestionsEntryType>> *p_types;
  char *v7;
  char *v8;
  int64_t v9;
  unint64_t v10;
  uint64_t value;
  int64_t *begin;
  uint64_t v13;
  unint64_t v14;
  int64_t *v15;
  int64_t **p_end;
  int64_t *end;
  unint64_t v18;
  char *v19;
  int64_t *v20;
  char *v21;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)MapsSuggestionsShortcutAtMapItemDeduper;
  v4 = -[MapsSuggestionsShortcutAtMapItemDeduper init](&v23, sel_init);
  v5 = v4;
  if (v4)
  {
    p_types = &v4->_types;
    if (&v4->_types != a3)
    {
      v7 = *(char **)a3;
      v8 = (char *)*((_QWORD *)a3 + 1);
      v9 = (int64_t)&v8[-*(_QWORD *)a3];
      v10 = v9 >> 3;
      value = (uint64_t)v4->_types.__end_cap_.__value_;
      begin = p_types->__begin_;
      if (v9 >> 3 > (unint64_t)((int64_t)(value - (unint64_t)p_types->__begin_) >> 3))
      {
        if (begin)
        {
          v4->_types.__end_ = begin;
          operator delete(begin);
          value = 0;
          p_types->__begin_ = 0;
          p_types->__end_ = 0;
          p_types->__end_cap_.__value_ = 0;
        }
        if (v9 < 0)
          goto LABEL_26;
        v13 = value >> 2;
        if (value >> 2 <= v10)
          v13 = v9 >> 3;
        v14 = (unint64_t)value >= 0x7FFFFFFFFFFFFFF8 ? 0x1FFFFFFFFFFFFFFFLL : v13;
        if (v14 >> 61)
LABEL_26:
          std::vector<MSg::_RollingWindowBudgetRule>::__throw_length_error[abi:ne180100]();
        v15 = (int64_t *)operator new(8 * v14);
        begin = v15;
        p_types->__begin_ = v15;
        p_types->__end_ = v15;
        p_types->__end_cap_.__value_ = &v15[v14];
        if (v8 != v7)
          memcpy(v15, v7, v9);
        p_end = &p_types->__end_;
        goto LABEL_24;
      }
      p_end = &v4->_types.__end_;
      end = v4->_types.__end_;
      v18 = end - begin;
      if (v18 >= v10)
      {
        if (v8 == v7)
        {
LABEL_24:
          *p_end = (int64_t *)((char *)begin + v9);
          return v5;
        }
        v20 = begin;
        v21 = v7;
      }
      else
      {
        v19 = &v7[8 * v18];
        if (end != begin)
        {
          memmove(begin, v7, (char *)end - (char *)begin);
          begin = *p_end;
        }
        v9 = v8 - v19;
        if (v8 == v19)
          goto LABEL_24;
        v20 = begin;
        v21 = v19;
      }
      memmove(v20, v21, v9);
      goto LABEL_24;
    }
  }
  return v5;
}

- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  const char *v11;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  vector<MapsSuggestionsEntryType, std::allocator<MapsSuggestionsEntryType>> *p_types;
  int64_t *end;
  int64_t *begin;
  int64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v32 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutAtMapItemDeduper.mm";
      v33 = 1024;
      v34 = 61;
      v35 = 2082;
      v36 = "-[MapsSuggestionsShortcutAtMapItemDeduper dedupeByEnrichingEntry:withEntry:]";
      v37 = 2082;
      v38 = "nil == (originalEntry)";
      v11 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an original suggestion entry";
LABEL_10:
      _os_log_impl(&dword_1A427D000, v10, OS_LOG_TYPE_ERROR, v11, buf, 0x26u);
    }
LABEL_11:
    v9 = 0;
LABEL_12:

    goto LABEL_13;
  }
  if (!v7)
  {
    GEOFindOrCreateLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v32 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutAtMapItemDeduper.mm";
      v33 = 1024;
      v34 = 62;
      v35 = 2082;
      v36 = "-[MapsSuggestionsShortcutAtMapItemDeduper dedupeByEnrichingEntry:withEntry:]";
      v37 = 2082;
      v38 = "nil == (entry)";
      v11 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a new suggestion entry";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if ((objc_msgSend(v6, "hasMultipleWaypointsLeft") & 1) == 0
    && (objc_msgSend(v8, "hasMultipleWaypointsLeft") & 1) == 0)
  {
    v13 = v6;
    v14 = v8;
    if (-[NSObject isShortcut](v13, "isShortcut")
      && (v10 = v13, v15 = v14, (-[NSObject isShortcut](v14, "isShortcut") & 1) == 0)
      || -[NSObject isShortcut](v14, "isShortcut")
      && (v10 = v14, v15 = v13, !-[NSObject isShortcut](v13, "isShortcut")))
    {
      p_types = &self->_types;
      begin = self->_types.__begin_;
      end = p_types->__end_;
      v20 = (char *)end - (char *)begin;
      if (end == begin)
      {
        v16 = v15;

      }
      else
      {
        if (v20 < 0)
          std::vector<MSg::_RollingWindowBudgetRule>::__throw_length_error[abi:ne180100]();
        v21 = (char *)operator new((char *)end - (char *)begin);
        v22 = v20 >> 3;
        memmove(v21, begin, v20);
        v16 = v15;
        v23 = 0;
        v24 = 8 * v22;
        while (1)
        {
          v25 = *(_QWORD *)&v21[v23];
          if (v25 == -[NSObject type](v16, "type"))
            break;
          v23 += 8;
          if (v24 == v23)
          {

            operator delete(v21);
            goto LABEL_31;
          }
        }

        operator delete(v21);
        -[NSObject geoMapItem](v13, "geoMapItem");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          -[NSObject geoMapItem](v14, "geoMapItem");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          if (v27)
          {
            -[NSObject geoMapItem](v13, "geoMapItem");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject geoMapItem](v14, "geoMapItem");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = MapsSuggestionsMapItemsAreEqual(v28, v29, 0, 0, 0);

            if ((v30 & 1) != 0)
            {
              if (v10 == v13)
              {
                v9 = 1;
                v10 = v13;
              }
              else
              {
                -[NSObject replaceByEntry:](v13, "replaceByEntry:", v10);
                v9 = 1;
              }
              goto LABEL_32;
            }
          }
        }
      }
    }
    else
    {

      v16 = 0;
      v10 = 0;
    }
LABEL_31:
    v9 = 0;
LABEL_32:

    goto LABEL_12;
  }
  v9 = 0;
LABEL_13:

  return v9;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (void).cxx_destruct
{
  vector<MapsSuggestionsEntryType, std::allocator<MapsSuggestionsEntryType>> *p_types;
  int64_t *begin;

  p_types = &self->_types;
  begin = self->_types.__begin_;
  if (begin)
  {
    p_types->__end_ = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
