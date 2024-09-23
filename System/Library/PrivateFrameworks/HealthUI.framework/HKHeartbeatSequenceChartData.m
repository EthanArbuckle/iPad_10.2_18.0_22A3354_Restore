@implementation HKHeartbeatSequenceChartData

- (HKHeartbeatSequenceChartData)init
{
  HKHeartbeatSequenceChartData *v2;
  NSMutableArray *v3;
  NSMutableArray *sections;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKHeartbeatSequenceChartData;
  v2 = -[HKHeartbeatSequenceChartData init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    sections = v2->_sections;
    v2->_sections = v3;

  }
  return v2;
}

- (void)addSequencePoint:(id)a3 section:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[HKHeartbeatSequenceChartData _expandToSection:](self, "_expandToSection:", a4);
  -[NSMutableArray objectAtIndexedSubscript:](self->_sections, "objectAtIndexedSubscript:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v6);

}

- (int64_t)sectionCount
{
  return -[NSMutableArray count](self->_sections, "count");
}

- (void)enumerateSequences:(id)a3
{
  unsigned int (**v4)(id, _QWORD);
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (unsigned int (**)(id, _QWORD))a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_sections;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v8)
        objc_enumerationMutation(v5);
      if (!v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9)))
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)_expandToSection:(int64_t)a3
{
  int64_t v5;
  int64_t v6;
  id v7;

  v5 = -[NSMutableArray count](self->_sections, "count");
  if (v5 <= a3)
  {
    v6 = a3 - v5 + 1;
    do
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[NSMutableArray addObject:](self->_sections, "addObject:", v7);

      --v6;
    }
    while (v6);
  }
}

- (double)initialXAxisOffset
{
  return self->_initialXAxisOffset;
}

- (void)setInitialXAxisOffset:(double)a3
{
  self->_initialXAxisOffset = a3;
}

- (NSMutableArray)sections
{
  return self->_sections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
