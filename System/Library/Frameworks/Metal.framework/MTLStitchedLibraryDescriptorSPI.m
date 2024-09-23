@implementation MTLStitchedLibraryDescriptorSPI

- (id)formattedDescription:(unint64_t)a3
{
  unint64_t v4;
  uint64_t v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  NSArray *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  id v25;
  MTLStitchedLibraryDescriptorSPI *v27;
  objc_super v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[9];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3 + 4;
  v5 = objc_msgSend(CFSTR("\n"), "stringByPaddingToLength:withString:startingAtIndex:", a3 + 4, CFSTR(" "), 0);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v27 = self;
  v6 = -[MTLStitchedLibraryDescriptor functionGraphs](self, "functionGraphs");
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v34 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        if (v9)
          objc_msgSend(v9, "appendString:", v5);
        else
          v9 = (id)objc_opt_new();
        objc_msgSend(v9, "appendString:", objc_msgSend(v12, "formattedDescription:", v4));
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v13 = -[MTLStitchedLibraryDescriptor binaryArchives](self, "binaryArchives");
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v30;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
        if (v16)
          objc_msgSend(v16, "appendString:", v5);
        else
          v16 = (id)objc_opt_new();
        objc_msgSend(v16, "appendString:", objc_msgSend(v19, "formattedDescription:", v4));
      }
      v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
    }
    while (v15);
  }
  else
  {
    v16 = 0;
  }
  v20 = (void *)MEMORY[0x1E0CB3940];
  v28.receiver = v27;
  v28.super_class = (Class)MTLStitchedLibraryDescriptorSPI;
  v21 = -[MTLStitchedLibraryDescriptor description](&v28, sel_description);
  v37[0] = v5;
  v37[1] = CFSTR("functionGraphs =");
  v22 = (void *)MEMORY[0x1E0C9AA60];
  if (v9)
    v23 = v9;
  else
    v23 = (id)MEMORY[0x1E0C9AA60];
  v37[2] = v23;
  v37[3] = v5;
  v37[4] = CFSTR("functions =");
  v24 = -[MTLStitchedLibraryDescriptor functions](v27, "functions");
  if (!v24)
    v24 = objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v37[5] = v24;
  v37[6] = v5;
  if (v16)
    v25 = v16;
  else
    v25 = v22;
  v37[7] = CFSTR("binaryArchives =");
  v37[8] = v25;
  return (id)objc_msgSend(v20, "stringWithFormat:", CFSTR("%@%@"), v21, objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 9), "componentsJoinedByString:", CFSTR(" ")));
}

- (id)description
{
  return -[MTLStitchedLibraryDescriptorSPI formattedDescription:](self, "formattedDescription:", 0);
}

@end
