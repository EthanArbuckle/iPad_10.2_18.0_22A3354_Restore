@implementation WFContentAlertButton

- (BOOL)hasContentSubtitle
{
  if (!self->_group)
    -[WFContentAlertButton start](self, "start");
  return self->_hasContentSubtitle;
}

- (void)getSubtitle:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __36__WFContentAlertButton_getSubtitle___block_invoke;
  v6[3] = &unk_24C4DFC50;
  objc_copyWeak(&v8, &location);
  v5 = v4;
  v7 = v5;
  -[WFContentAlertButton addSubtitleCompletionHandler:](self, "addSubtitleCompletionHandler:", v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

- (void)start
{
  OS_dispatch_group *v3;
  OS_dispatch_group *group;
  void *v5;
  _QWORD v6[5];

  v3 = (OS_dispatch_group *)dispatch_group_create();
  group = self->_group;
  self->_group = v3;

  dispatch_group_enter((dispatch_group_t)self->_group);
  -[WFContentAlertButton contentItem](self, "contentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __29__WFContentAlertButton_start__block_invoke;
  v6[3] = &unk_24C4E08D0;
  v6[4] = self;
  self->_hasContentSubtitle = objc_msgSend(v5, "getListSubtitle:", v6);

  if (!self->_hasContentSubtitle)
    dispatch_group_leave((dispatch_group_t)self->_group);
}

- (BOOL)addSubtitleCompletionHandler:(id)a3
{
  id v4;
  NSObject *group;
  id v6;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  group = self->_group;
  if (!group)
  {
    -[WFContentAlertButton start](self, "start");
    group = self->_group;
  }
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__WFContentAlertButton_addSubtitleCompletionHandler___block_invoke;
  v8[3] = &unk_24C4E00C0;
  v8[4] = self;
  v9 = v4;
  v6 = v4;
  dispatch_group_notify(group, MEMORY[0x24BDAC9B8], v8);

  return 0;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (WFContentItem)contentItem
{
  return self->_contentItem;
}

- (BOOL)hideSubtitle
{
  return self->_hideSubtitle;
}

- (void)setHideSubtitle:(BOOL)a3
{
  self->_hideSubtitle = a3;
}

- (OS_dispatch_group)group
{
  return self->_group;
}

- (void)setGroup:(id)a3
{
  objc_storeStrong((id *)&self->_group, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_contentItem, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
}

uint64_t __53__WFContentAlertButton_addSubtitleCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88));
}

void __29__WFContentAlertButton_start__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "copy");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 88);
  *(_QWORD *)(v4 + 88) = v3;

  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 104));
}

void __36__WFContentAlertButton_getSubtitle___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (v9)
  {
    (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
  }
  else
  {
    v5 = objc_msgSend(WeakRetained, "hideSubtitle");
    v6 = *(_QWORD *)(a1 + 32);
    if (v5)
    {
      (*(void (**)(uint64_t))(v6 + 16))(v6);
    }
    else
    {
      objc_msgSend(v4, "contentItem");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "localizedTypeDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v8);

    }
  }

}

+ (id)buttonWithContentItem:(id)a3 selected:(BOOL)a4 stickySelection:(BOOL)a5 handler:(id)a6
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id *v16;
  id *v17;

  v7 = a5;
  v8 = a4;
  v11 = a3;
  v12 = a6;
  objc_msgSend(v11, "name");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEC1618], "parseAnnotatedString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "displayString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "buttonWithTitle:subtitle:selected:stickySelection:style:handler:image:", v15, 0, v8, v7, 0, v12, 0);
  v16 = (id *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_storeStrong(v16 + 12, a3);
    v17 = v16;
  }

  return v16;
}

+ (void)processContentAlertButtonSubtitles:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  _BOOL8 v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
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
  v3 = a3;
  objc_msgSend(v3, "objectsMatchingClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v12, "contentItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", objc_opt_class());

        v9 |= objc_msgSend(v12, "hasContentSubtitle");
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v8);

    if ((v9 & 1) != 0)
    {
      v14 = 0;
      goto LABEL_12;
    }
  }
  else
  {

  }
  v14 = objc_msgSend(v5, "count") == 1;
LABEL_12:
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v15 = v6;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v21;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * j), "setHideSubtitle:", v14, (_QWORD)v20);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v17);
  }

}

@end
