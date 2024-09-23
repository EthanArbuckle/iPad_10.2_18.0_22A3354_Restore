@implementation IKDOMNamedNodeMap

- (id)getNamedItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IKDOMNodeList _updateNodes](self, "_updateNodes");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[IKDOMNodeList nodes](self, "nodes", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "nodeName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)setNamedItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  xmlNode *v8;
  id v9;
  const xmlChar *v10;
  void *v11;
  id v12;
  const xmlChar *v13;

  v4 = a3;
  objc_msgSend(v4, "nodeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IKDOMNamedNodeMap getNamedItem:](self, "getNamedItem:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[IKDOMNodeList contextNode](self, "contextNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (xmlNode *)objc_msgSend(v7, "nodePtr");

  objc_msgSend(v4, "nodeName");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = (const xmlChar *)objc_msgSend(v9, "UTF8String");

  objc_msgSend(v4, "nodeValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_retainAutorelease(v11);
  v13 = (const xmlChar *)objc_msgSend(v12, "UTF8String");

  if (v6)
    xmlSetProp(v8, v10, v13);
  else
    xmlNewProp(v8, v10, v13);
  return v6;
}

@end
