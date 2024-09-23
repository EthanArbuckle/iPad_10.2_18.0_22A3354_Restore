@implementation MapsSuggestionsMutableSignalPack

- (BOOL)addFromEntry:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_opt_class();
    MapsSuggestionsCurrentBestLocation();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "coordinate");
    objc_msgSend(v5, "extractFromDestinationEntry:originCoordinate:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "mergeIntoSignalPack:", self);
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 136446978;
      v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPack+MapsSuggestionsEntry.m";
      v12 = 1024;
      v13 = 200;
      v14 = 2082;
      v15 = "-[MapsSuggestionsMutableSignalPack(MapsSuggestionsEntry) addFromEntry:]";
      v16 = 2082;
      v17 = "nil == (entry)";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", (uint8_t *)&v10, 0x26u);
    }

  }
  return v4 != 0;
}

- (BOOL)addFromMapItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_opt_class();
    MapsSuggestionsCurrentBestLocation();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "coordinate");
    objc_msgSend(v5, "extractFromDestinationMapItem:originCoordinate:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "mergeIntoSignalPack:", self);
  }
  else
  {
    GEOFindOrCreateLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 136446978;
      v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSignalPack+MapsSuggestionsEntry.m";
      v12 = 1024;
      v13 = 209;
      v14 = 2082;
      v15 = "-[MapsSuggestionsMutableSignalPack(MapsSuggestionsEntry) addFromMapItem:]";
      v16 = 2082;
      v17 = "nil == (mapItem)";
      _os_log_impl(&dword_1A427D000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a map item", (uint8_t *)&v10, 0x26u);
    }

  }
  return v4 != 0;
}

- (MapsSuggestionsMutableSignalPack)initWithCapacity:(unint64_t)a3
{
  MapsSuggestionsMutableSignalPack *v4;
  MapsSuggestionsMutableSignalPack *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MapsSuggestionsMutableSignalPack;
  v4 = -[MapsSuggestionsMutableSignalPack init](&v7, sel_init);
  v5 = v4;
  if (v4)
    std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>>>::__rehash<true>((uint64_t)&v4->super._innerSignalPack, vcvtps_u32_f32((float)a3 / v4->super._innerSignalPack.dict_.__table_.__p3_.__value_));
  return v5;
}

- (BOOL)writeSignalValue:(float)a3 forType:(int64_t)a4 gathered:(id)a5 expires:(id)a6
{
  SignalPack *p_innerSignalPack;
  id v11;
  id v12;
  _QWORD *v13;
  int64_t v15;

  if (self)
    p_innerSignalPack = &self->super._innerSignalPack;
  else
    p_innerSignalPack = 0;
  v15 = a4;
  v11 = a5;
  v12 = a6;
  v13 = std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>>>::__emplace_unique_key_args<MapsSuggestionsSignalType,std::piecewise_construct_t const&,std::tuple<MapsSuggestionsSignalType const&>,std::tuple<>>((uint64_t)p_innerSignalPack, a4, &v15);
  *((float *)v13 + 6) = a3;
  objc_storeStrong((id *)v13 + 4, a5);
  objc_storeStrong((id *)v13 + 5, a6);

  return 1;
}

- (BOOL)writeSignalValue:(float)a3 forType:(int64_t)a4 gathered:(id)a5
{
  id v8;
  void *v9;
  double v10;

  v8 = a5;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", v8, 3600.0);
  *(float *)&v10 = a3;
  LOBYTE(a4) = -[MapsSuggestionsMutableSignalPack writeSignalValue:forType:gathered:expires:](self, "writeSignalValue:forType:gathered:expires:", a4, v8, v9, v10);

  return a4;
}

- (BOOL)writeSignalValue:(float)a3 forType:(int64_t)a4
{
  void *v7;
  double v8;

  MapsSuggestionsNow();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = a3;
  LOBYTE(a4) = -[MapsSuggestionsMutableSignalPack writeSignalValue:forType:gathered:](self, "writeSignalValue:forType:gathered:", a4, v7, v8);

  return a4;
}

- (BOOL)removeSignalType:(int64_t)a3
{
  SignalPack *p_innerSignalPack;

  if (self)
    p_innerSignalPack = &self->super._innerSignalPack;
  else
    p_innerSignalPack = 0;
  return std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>>>::__erase_unique<MapsSuggestionsSignalType>(p_innerSignalPack, (id)a3) != 0;
}

- (void)removeAll
{
  if (self)
    std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>>>::clear((uint64_t)&self->super._innerSignalPack);
  else
    std::__hash_table<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::__unordered_map_hasher<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::hash<MapsSuggestionsSignalType>,std::equal_to<MapsSuggestionsSignalType>,true>,std::__unordered_map_equal<MapsSuggestionsSignalType,std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>,std::equal_to<MapsSuggestionsSignalType>,std::hash<MapsSuggestionsSignalType>,true>,std::allocator<std::__hash_value_type<MapsSuggestionsSignalType,MSg::Signal>>>::clear(0);
}

- (id)copy
{
  return -[MapsSuggestionsSignalPack initWithSignalPack:]([MapsSuggestionsSignalPack alloc], "initWithSignalPack:", self);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[MapsSuggestionsSignalPack initWithSignalPack:](+[MapsSuggestionsMutableSignalPack allocWithZone:](MapsSuggestionsMutableSignalPack, "allocWithZone:", a3), "initWithSignalPack:", self);
}

@end
