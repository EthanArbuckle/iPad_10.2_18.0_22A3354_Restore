@implementation _TDLayerStackFilterHelper

- (_TDLayerStackFilterHelper)init
{
  _TDLayerStackFilterHelper *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_TDLayerStackFilterHelper;
  v2 = -[_TDLayerStackFilterHelper init](&v4, sel_init);
  if (v2)
  {
    v2->_excludedIdioms = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v2->_excludedSubtypes = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v2->_excludedScaleFactors = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v2->_excludedHorizontalSizeClasses = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v2->_excludedVerticalSizeClasses = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v2->_excludedDirections = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v2->_excludedLayers = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v2->_excludedPresentationStates = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v2->_excludedSizes = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v2->_excludedStates = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v2->_excludedValues = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  }
  return v2;
}

- (void)establishExclusionsWithHelper:(id)a3 idioms:(id)a4 sizeClasses:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend((id)-[TDLayerStackRenditionSpec keySpec](self->_layerStackRendition, "keySpec", a3, a4, a5), "idiom"))
  {
    v8 = objc_msgSend((id)-[TDLayerStackRenditionSpec keySpec](self->_layerStackRendition, "keySpec"), "idiom");
    if (v8 == objc_msgSend(a4, "objectAtIndex:", 0))
    {
      v14 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "layerStackRendition"), "keySpec"), "idiom");
      if (v14 != objc_msgSend(a4, "objectAtIndex:", 0))
        -[NSMutableArray addObject:](self->_excludedIdioms, "addObject:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "layerStackRendition"), "keySpec"), "idiom"));
    }
    else if (!-[NSMutableArray count](self->_excludedIdioms, "count"))
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v9 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v21 != v11)
              objc_enumerationMutation(a4);
            v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
            if (v13 != objc_msgSend((id)-[TDLayerStackRenditionSpec keySpec](self->_layerStackRendition, "keySpec"), "idiom"))-[NSMutableArray addObject:](self->_excludedIdioms, "addObject:", v13);
          }
          v10 = objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v10);
      }
    }
  }
  if (objc_msgSend((id)-[TDLayerStackRenditionSpec keySpec](self->_layerStackRendition, "keySpec"), "idiom"))
  {
    v15 = objc_msgSend((id)-[TDLayerStackRenditionSpec keySpec](self->_layerStackRendition, "keySpec"), "idiom");
    if (v15 != objc_msgSend(a4, "objectAtIndex:", 0))
    {
      v16 = objc_msgSend((id)-[TDLayerStackRenditionSpec keySpec](self->_layerStackRendition, "keySpec"), "idiom");
      if (v16 == objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "layerStackRendition"), "keySpec"), "idiom"))
      {
        v18 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "layerStackRendition"), "keySpec"), "subtype");
        if ((_DWORD)v18)
        {
          v19 = v18;
          if ((_DWORD)v18 != objc_msgSend((id)-[TDLayerStackRenditionSpec keySpec](self->_layerStackRendition, "keySpec"), "subtype"))-[NSMutableArray addObject:](self->_excludedSubtypes, "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v19));
        }
      }
    }
  }
  v17 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "layerStackRendition"), "keySpec"), "scaleFactor");
  if (objc_msgSend((id)-[TDLayerStackRenditionSpec keySpec](self->_layerStackRendition, "keySpec"), "scaleFactor") != (_DWORD)v17)-[NSMutableArray addObject:](self->_excludedScaleFactors, "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v17));
}

- (BOOL)allowKey:(id)a3
{
  NSMutableArray *excludedSubtypes;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  NSMutableArray *excludedScaleFactors;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend(a3, "idiom")
    || (-[NSMutableArray containsObject:](self->_excludedIdioms, "containsObject:", objc_msgSend(a3, "idiom")) & 1) == 0)
  {
    if (objc_msgSend(a3, "subtype")
      && (v26 = 0u,
          v27 = 0u,
          v24 = 0u,
          v25 = 0u,
          excludedSubtypes = self->_excludedSubtypes,
          (v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](excludedSubtypes, "countByEnumeratingWithState:objects:count:", &v24, v29, 16)) != 0))
    {
      v8 = v7;
      v9 = *(_QWORD *)v25;
LABEL_8:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(excludedSubtypes);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v10);
        v12 = objc_msgSend(a3, "subtype");
        if (v12 == objc_msgSend(v11, "unsignedIntValue"))
          break;
        if (v8 == ++v10)
        {
          v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](excludedSubtypes, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
          if (v8)
            goto LABEL_8;
          goto LABEL_14;
        }
      }
    }
    else
    {
LABEL_14:
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      excludedScaleFactors = self->_excludedScaleFactors;
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](excludedScaleFactors, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v21;
LABEL_16:
        v17 = 0;
        while (1)
        {
          if (*(_QWORD *)v21 != v16)
            objc_enumerationMutation(excludedScaleFactors);
          v18 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v17);
          v19 = objc_msgSend(a3, "scaleFactor");
          if (v19 == objc_msgSend(v18, "unsignedIntValue"))
            break;
          if (v15 == ++v17)
          {
            v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](excludedScaleFactors, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            if (v15)
              goto LABEL_16;
            goto LABEL_22;
          }
        }
      }
      else
      {
LABEL_22:
        if ((!objc_msgSend(a3, "sizeClassVertical")
           || (-[NSMutableArray containsObject:](self->_excludedVerticalSizeClasses, "containsObject:", objc_msgSend(a3, "sizeClassVertical")) & 1) == 0)&& (!objc_msgSend(a3, "direction")|| (-[NSMutableArray containsObject:](self->_excludedDirections, "containsObject:", objc_msgSend(a3, "direction")) & 1) == 0)&& (!objc_msgSend(a3, "layer")|| (-[NSMutableArray containsObject:](self->_excludedLayers, "containsObject:", objc_msgSend(a3, "layer")) & 1) == 0)&& (!objc_msgSend(a3, "presentationState")|| (-[NSMutableArray containsObject:](self->_excludedPresentationStates, "containsObject:", objc_msgSend(a3, "presentationState")) & 1) == 0)&& (!objc_msgSend(a3, "size")|| (-[NSMutableArray containsObject:](self->_excludedSizes, "containsObject:", objc_msgSend(a3, "size")) & 1) == 0)&& (!objc_msgSend(a3, "state")|| (-[NSMutableArray containsObject:](self->_excludedStates, "containsObject:", objc_msgSend(a3, "state")) & 1) == 0)
          && (!objc_msgSend(a3, "value")
           || (-[NSMutableArray containsObject:](self->_excludedValues, "containsObject:", objc_msgSend(a3, "value")) & 1) == 0))
        {
          return 1;
        }
      }
    }
  }
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_TDLayerStackFilterHelper;
  -[_TDLayerStackFilterHelper dealloc](&v3, sel_dealloc);
}

- (NSMutableArray)excludedIdioms
{
  return self->_excludedIdioms;
}

- (void)setExcludedIdioms:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSMutableArray)excludedSubtypes
{
  return self->_excludedSubtypes;
}

- (void)setExcludedSubtypes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSMutableArray)excludedScaleFactors
{
  return self->_excludedScaleFactors;
}

- (void)setExcludedScaleFactors:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (NSMutableArray)excludedHorizontalSizeClasses
{
  return self->_excludedHorizontalSizeClasses;
}

- (void)setExcludedHorizontalSizeClasses:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (NSMutableArray)excludedVerticalSizeClasses
{
  return self->_excludedVerticalSizeClasses;
}

- (void)setExcludedVerticalSizeClasses:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (NSMutableArray)excludedDirections
{
  return self->_excludedDirections;
}

- (void)setExcludedDirections:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (NSMutableArray)excludedLayers
{
  return self->_excludedLayers;
}

- (void)setExcludedLayers:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (NSMutableArray)excludedPresentationStates
{
  return self->_excludedPresentationStates;
}

- (void)setExcludedPresentationStates:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 72);
}

- (NSMutableArray)excludedSizes
{
  return self->_excludedSizes;
}

- (void)setExcludedSizes:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 80);
}

- (NSMutableArray)excludedStates
{
  return self->_excludedStates;
}

- (void)setExcludedStates:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 88);
}

- (NSMutableArray)excludedValues
{
  return self->_excludedValues;
}

- (void)setExcludedValues:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 96);
}

- (TDLayerStackRenditionSpec)layerStackRendition
{
  return self->_layerStackRendition;
}

- (void)setLayerStackRendition:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
