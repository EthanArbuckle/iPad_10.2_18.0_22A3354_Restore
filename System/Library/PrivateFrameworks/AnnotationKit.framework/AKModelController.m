@implementation AKModelController

- (AKModelController)init
{
  AKModelController *v2;
  uint64_t v3;
  AKSparseMutableControllerArray *mutablePageModelControllers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AKModelController;
  v2 = -[AKModelController init](&v6, sel_init);
  if (v2)
  {
    +[AKSparseMutableControllerArray array](AKSparseMutableControllerArray, "array");
    v3 = objc_claimAutoreleasedReturnValue();
    mutablePageModelControllers = v2->_mutablePageModelControllers;
    v2->_mutablePageModelControllers = (AKSparseMutableControllerArray *)v3;

  }
  return v2;
}

- (NSArray)pageModelControllers
{
  return (NSArray *)self->_mutablePageModelControllers;
}

- (void)insertObject:(id)a3 inPageModelControllersAtIndex:(unint64_t)a4
{
  -[AKSparseMutableControllerArray insertObject:atIndex:](self->_mutablePageModelControllers, "insertObject:atIndex:", a3, a4);
}

- (void)insertPageModelControllers:(id)a3 atIndexes:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if ((-[AKSparseMutableControllerArray containsObject:](self->_mutablePageModelControllers, "containsObject:", v6) & 1) != 0)
  {
    v8 = objc_msgSend(v7, "firstIndex");
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          -[AKModelController insertObject:inPageModelControllersAtIndex:](self, "insertObject:inPageModelControllersAtIndex:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13), v8, (_QWORD)v14);
          v8 = objc_msgSend(v7, "indexGreaterThanIndex:", v8);
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
  else
  {
    -[AKSparseMutableControllerArray insertObjects:atIndexes:](self->_mutablePageModelControllers, "insertObjects:atIndexes:", v6, v7);
  }

}

- (void)removeObjectFromPageModelControllersAtIndex:(unint64_t)a3
{
  -[AKSparseMutableControllerArray removeObjectAtIndex:](self->_mutablePageModelControllers, "removeObjectAtIndex:", a3);
}

- (void)removePageModelControllersAtIndexes:(id)a3
{
  -[AKSparseMutableControllerArray removeObjectsAtIndexes:](self->_mutablePageModelControllers, "removeObjectsAtIndexes:", a3);
}

- (void)replaceObjectInPageModelControllersAtIndex:(unint64_t)a3 withObject:(id)a4
{
  -[AKSparseMutableControllerArray replaceObjectAtIndex:withObject:](self->_mutablePageModelControllers, "replaceObjectAtIndex:withObject:", a3, a4);
}

- (void)replacePageModelControllersAtIndexes:(id)a3 withPageModelControllers:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if ((-[AKSparseMutableControllerArray containsObject:](self->_mutablePageModelControllers, "containsObject:", v7) & 1) != 0)
  {
    v8 = objc_msgSend(v6, "firstIndex");
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          -[AKModelController replaceObjectInPageModelControllersAtIndex:withObject:](self, "replaceObjectInPageModelControllersAtIndex:withObject:", v8, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13), (_QWORD)v14);
          v8 = objc_msgSend(v6, "indexGreaterThanIndex:", v8);
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
  else
  {
    -[AKSparseMutableControllerArray replaceObjectsAtIndexes:withObjects:](self->_mutablePageModelControllers, "replaceObjectsAtIndexes:withObjects:", v6, v7);
  }

}

- (id)pageModelControllerForPage:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[AKModelController pageModelControllers](self, "pageModelControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pageModelControllerForAnnotation:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[AKModelController pageModelControllers](self, "pageModelControllers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "containsAnnotation:", v4))
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)allSelectedAnnotations
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id obj;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[AKModelController pageModelControllers](self, "pageModelControllers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v8, "annotations");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "selectedAnnotations");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = MEMORY[0x24BDAC760];
        v16[1] = 3221225472;
        v16[2] = sub_229023280;
        v16[3] = &unk_24F1A7D20;
        v17 = v10;
        v11 = v10;
        objc_msgSend(v9, "indexesOfObjectsPassingTest:", v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectsAtIndexes:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v13);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }

  return v3;
}

- (void)deleteAllSelectedAnnotations
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id obj;
  _QWORD v13[4];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[AKModelController pageModelControllers](self, "pageModelControllers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v16 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v6, "annotations");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "selectedAnnotations");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = MEMORY[0x24BDAC760];
        v13[1] = 3221225472;
        v13[2] = sub_229023430;
        v13[3] = &unk_24F1A7D20;
        v14 = v8;
        v9 = v8;
        objc_msgSend(v7, "indexesOfObjectsPassingTest:", v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "mutableArrayValueForKey:", CFSTR("annotations"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeObjectsAtIndexes:", v10);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v3);
  }

}

- (void)deselectAllAnnotations
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[AKModelController pageModelControllers](self, "pageModelControllers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v7, "selectedAnnotations");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "count");

        if (v9)
        {
          objc_msgSend(v7, "mutableSetValueForKey:", CFSTR("selectedAnnotations"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCF20], "set");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setSet:", v11);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

}

- (id)archivedPageModelControllers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  size_t v12;
  uint8_t *v13;
  uint8_t *v14;
  size_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[2];
  _QWORD v28[2];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[AKModelController pageModelControllers](self, "pageModelControllers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v8), "archivableRepresentation");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[AKSecureSerializationHelper dataForSecureCodingCompliantObject:withOptionalKey:](AKSecureSerializationHelper, "dataForSecureCodingCompliantObject:withOptionalKey:", v10, qword_255A25820);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "length");
  v13 = (uint8_t *)malloc_type_calloc(v12, 1uLL, 0x100004077774924uLL);
  if (v13)
  {
    v14 = v13;
    v11 = objc_retainAutorelease(v11);
    v15 = compression_encode_buffer(v14, v12, (const uint8_t *)objc_msgSend(v11, "bytes"), v12, 0, COMPRESSION_LZMA);
    if (v15)
    {
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v14, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = qword_255A25830;
      v27[1] = qword_255A25838;
      v28[0] = v16;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v28[1] = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      +[AKSecureSerializationHelper dataForSecureCodingCompliantObject:withOptionalKey:](AKSecureSerializationHelper, "dataForSecureCodingCompliantObject:withOptionalKey:", v18, qword_255A25828);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "length");
      if (v20 < objc_msgSend(v11, "length"))
      {
        v21 = v19;

        v11 = v21;
      }

    }
    free(v14);
  }

  return v11;
}

- (BOOL)populateFromArchivedPageModelControllers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _UNKNOWN **v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  size_t v15;
  size_t v16;
  uint8_t *v17;
  size_t v18;
  NSObject *v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint8_t *v28;
  uint8_t *src_buffer;
  _QWORD v30[4];
  id v31;
  _QWORD v32[3];
  _QWORD v33[6];

  v33[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x22E2C10E4]();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v4, 0);
  v7 = v6;
  if (v6
    && ((objc_msgSend(v6, "containsValueForKey:", qword_255A25828) & 1) != 0
     || (objc_msgSend(v7, "containsValueForKey:", qword_255A25820) & 1) != 0))
  {
    v8 = &off_24F1A6000;
    v9 = 0x24BDBC000uLL;
    v10 = v4;
    if (!objc_msgSend(v7, "containsValueForKey:", qword_255A25828))
    {
LABEL_25:
      objc_msgSend(v7, "finishDecoding");

      objc_autoreleasePoolPop(v5);
      if (v10)
      {
        v21 = v8[105];
        v32[0] = objc_opt_class();
        v32[1] = objc_opt_class();
        v32[2] = objc_opt_class();
        objc_msgSend(*(id *)(v9 + 3632), "arrayWithObjects:count:", v32, 3);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "secureCodingCompliantObjectForData:ofClasses:withOptionalKey:", v10, v22, qword_255A25820);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v23, "count"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v30[0] = MEMORY[0x24BDAC760];
          v30[1] = 3221225472;
          v30[2] = sub_229023CAC;
          v30[3] = &unk_24F1A7810;
          v31 = v24;
          v25 = v24;
          objc_msgSend(v23, "enumerateObjectsUsingBlock:", v30);
          objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 0, objc_msgSend(v25, "count"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[AKModelController insertPageModelControllers:atIndexes:](self, "insertPageModelControllers:atIndexes:", v25, v26);

        }
      }
      v20 = 1;
      goto LABEL_30;
    }
    v33[0] = objc_opt_class();
    v33[1] = objc_opt_class();
    v33[2] = objc_opt_class();
    v33[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[AKSecureSerializationHelper secureCodingCompliantObjectForData:ofClasses:withOptionalKey:](AKSecureSerializationHelper, "secureCodingCompliantObjectForData:ofClasses:withOptionalKey:", v4, v11, qword_255A25828);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v13 = 0;
      v10 = 0;
      v9 = 0x24BDBC000;
      v8 = &off_24F1A6000;
LABEL_24:

      goto LABEL_25;
    }
    objc_msgSend(v12, "objectForKeyedSubscript:", qword_255A25830);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      v13 = 0;
    }
    v8 = &off_24F1A6000;
    objc_msgSend(v12, "objectForKeyedSubscript:", qword_255A25838);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = objc_msgSend(v14, "unsignedIntegerValue");

      v10 = 0;
      if (!v13 || !v15)
        goto LABEL_23;
      v16 = objc_msgSend(v13, "length");
      v13 = objc_retainAutorelease(v13);
      src_buffer = (uint8_t *)objc_msgSend(v13, "bytes");
      v17 = (uint8_t *)malloc_type_calloc(v15, 1uLL, 0xF547F5F6uLL);
      if (v17)
      {
        v28 = v17;
        v18 = compression_decode_buffer(v17, v15, src_buffer, v16, 0, COMPRESSION_LZMA);
        if (v18 && v18 == v15)
        {
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v28, v15);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          NSLog(CFSTR("%s: Decompressing %zu bytes to %zu failed! Decoded %zu bytes instead."), "-[AKModelController populateFromArchivedPageModelControllers:]", v16, v15, v18);
          v10 = 0;
        }
        free(v28);
        goto LABEL_23;
      }
    }
    else
    {

    }
    v10 = 0;
LABEL_23:
    v9 = 0x24BDBC000uLL;
    goto LABEL_24;
  }
  objc_msgSend(v7, "finishDecoding");

  v19 = os_log_create("com.apple.annotationkit", "Serialization");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    sub_22907F9B0(v19);

  objc_autoreleasePoolPop(v5);
  v20 = 0;
  v10 = v4;
LABEL_30:

  return v20;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutablePageModelControllers, 0);
}

@end
