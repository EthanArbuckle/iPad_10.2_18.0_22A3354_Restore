@implementation ENPlainNoteContent

- (ENPlainNoteContent)initWithString:(id)a3
{
  id v4;
  ENPlainNoteContent *v5;
  void *v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ENPlainNoteContent;
  v5 = -[ENPlainNoteContent init](&v8, sel_init);
  if (v5)
  {
    v9[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ENPlainNoteContent setContents:](v5, "setContents:", v6);

  }
  return v5;
}

- (ENPlainNoteContent)initWithContents:(id)a3
{
  id v4;
  ENPlainNoteContent *v5;
  ENPlainNoteContent *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ENPlainNoteContent;
  v5 = -[ENPlainNoteContent init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ENPlainNoteContent setContents:](v5, "setContents:", v4);

  return v6;
}

- (id)enmlWithNote:(id)a3
{
  ENMLWriter *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v30 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(ENMLWriter);
  -[ENMLWriter startDocument](v4, "startDocument");
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  -[ENPlainNoteContent contents](self, "contents");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v43;
    v31 = *(_QWORD *)v43;
    do
    {
      v8 = 0;
      v32 = v6;
      do
      {
        if (*(_QWORD *)v43 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          objc_msgSend(v10, "componentsSeparatedByString:", CFSTR("\n"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v39;
            do
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v39 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
                -[ENXMLWriter startElement:](v4, "startElement:", CFSTR("div"));
                if (objc_msgSend(v16, "length"))
                  -[ENXMLWriter writeString:](v4, "writeString:", v16);
                else
                  -[ENXMLWriter writeElement:attributes:content:](v4, "writeElement:attributes:content:", CFSTR("br"), 0, 0);
                -[ENXMLWriter endElement](v4, "endElement");
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
            }
            while (v13);
          }

          v7 = v31;
          v6 = v32;
        }
        ++v8;
      }
      while (v8 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v6);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v30, "resources");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v35 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
        objc_msgSend(v22, "dataHash");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "mimeType");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[ENMLWriter writeResourceWithDataHash:mime:attributes:](v4, "writeResourceWithDataHash:mime:attributes:", v23, v24, 0);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    }
    while (v19);
  }

  -[ENMLWriter endDocument](v4, "endDocument");
  if (objc_msgSend(v29, "count"))
  {
    objc_msgSend(v30, "resources");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "arrayByAddingObjectsFromArray:", v29);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setResources:", v26);

  }
  -[ENXMLWriter contents](v4, "contents");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (NSArray)contents
{
  return self->_contents;
}

- (void)setContents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contents, 0);
}

@end
