@implementation _MPCQueueControllerBehaviorMusicEnumerator

- (_MPCQueueControllerBehaviorMusicEnumerator)initWithQueueEnumerator:(id)a3 startingComponents:(id)a4
{
  id v7;
  id v8;
  _MPCQueueControllerBehaviorMusicEnumerator *v9;
  _MPCQueueControllerBehaviorMusicEnumerator *v10;
  void *v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_MPCQueueControllerBehaviorMusicEnumerator;
  v9 = -[_MPCQueueControllerBehaviorMusicEnumerator init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startingComponents, a4);
    objc_storeStrong((id *)&v10->_queueEnumerator, a3);
    objc_initWeak(&location, v10);
    v14 = MEMORY[0x24BDAC760];
    v15 = 3221225472;
    v16 = __89___MPCQueueControllerBehaviorMusicEnumerator_initWithQueueEnumerator_startingComponents___block_invoke;
    v17 = &unk_24CABA2F8;
    objc_copyWeak(&v18, &location);
    -[_MPCQueueControllerEnumerator setRepeatBoundaryBlock:](v10->_queueEnumerator, "setRepeatBoundaryBlock:", &v14);
    if ((-[_MPCQueueControllerEnumerator mode](v10->_queueEnumerator, "mode", v14, v15, v16, v17) & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      -[_MPCQueueControllerEnumerator musicBehavior](v10->_queueEnumerator, "musicBehavior");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "repeatType");

      if (v12)
        v10->_repeatIteration = objc_msgSend(v8, "repeatIteration");
    }
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v10;
}

- (id)nextObject
{
  int64_t v4;
  MPCQueueControllerBehaviorMusicIdentifierComponents *repeatOneComponents;
  _MPCQueueControllerEnumerator *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  SEL v17;
  _MPCQueueControllerBehaviorMusicEnumerator *v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  uint64_t v22;
  _MPCQueueControllerEnumerator *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t i;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  MPCQueueControllerBehaviorMusicIdentifierComponents *v48;
  MPCQueueControllerBehaviorMusicIdentifierComponents *v49;
  MPCQueueControllerBehaviorMusicIdentifierComponents *v50;
  MPCQueueControllerBehaviorMusicIdentifierComponents *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *queueEnumerator;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v66;
  void *v67;
  SEL v68;
  SEL v69;
  char v70;
  unint64_t v71;
  void *v72;
  _MPCQueueControllerBehaviorMusicEnumerator *v73;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint8_t buf[4];
  void *v84;
  __int16 v85;
  void *v86;
  __int16 v87;
  void *v88;
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  -[_MPCQueueControllerEnumerator musicBehavior](self->_queueEnumerator, "musicBehavior");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_MPCQueueControllerEnumerator mode](self->_queueEnumerator, "mode");
  v70 = -[_MPCQueueControllerEnumerator options](self->_queueEnumerator, "options");
  if (v4 == 3 && objc_msgSend(v74, "repeatType") == 1)
  {
    repeatOneComponents = self->_repeatOneComponents;
    if (repeatOneComponents)
      goto LABEL_59;
    v68 = a2;
    if (self->_startingComponents)
      ++self->_repeatIteration;
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v6 = self->_queueEnumerator;
    v7 = -[_MPCQueueControllerEnumerator countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v79, v90, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v80;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v80 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v10);
          if (objc_msgSend(v11, "entryType") == 3)
          {
            objc_msgSend(v11, "itemResult");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "sectionIdentifier");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "itemIdentifier");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            +[MPCQueueControllerBehaviorMusicIdentifierComponents itemComponentsWithSectionID:itemID:](MPCQueueControllerBehaviorMusicIdentifierComponents, "itemComponentsWithSectionID:itemID:", v45, v46);
            v47 = (void *)objc_claimAutoreleasedReturnValue();

            v48 = (MPCQueueControllerBehaviorMusicIdentifierComponents *)objc_msgSend(v47, "copyWithRepeatIteration:", self->_repeatIteration);
            v49 = self->_repeatOneComponents;
            self->_repeatOneComponents = v48;

            goto LABEL_58;
          }
          if (objc_msgSend(v11, "entryType") == 2)
          {
            objc_msgSend(v11, "trackingEntryResult");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "sectionIdentifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            -[_MPCQueueControllerBehaviorMusicEnumerator _loadingComponentsForHeadOfSection:](self, "_loadingComponentsForHeadOfSection:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (v14)
            {
              objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = v15;
              v17 = v68;
              v18 = self;
              v19 = 4024;
              v20 = CFSTR("Encountered unexpected loading section Head in Natural Repeat One enumerator");
LABEL_21:
              objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", v17, v18, CFSTR("_MPCQueueControllerBehaviorMusic.m"), v19, v20);

            }
          }
          else
          {
            if (objc_msgSend(v11, "entryType") != 4)
              goto LABEL_18;
            objc_msgSend(v11, "trackingEntryResult");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "sectionIdentifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "dataSources");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectForKeyedSubscript:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v14, "shouldRequestAdditionalItemsAtTail"))
            {
              objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = v15;
              v17 = v68;
              v18 = self;
              v19 = 4031;
              v20 = CFSTR("Encountered unexpected loading section Tail in Natural Repeat One enumerator");
              goto LABEL_21;
            }
          }

LABEL_18:
          ++v10;
        }
        while (v8 != v10);
        v22 = -[_MPCQueueControllerEnumerator countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v79, v90, 16);
        v8 = v22;
      }
      while (v22);
    }
LABEL_58:

    repeatOneComponents = self->_repeatOneComponents;
    if (repeatOneComponents)
    {
LABEL_59:
      v50 = -[MPCQueueControllerBehaviorMusicIdentifierComponents copyWithRepeatIteration:](repeatOneComponents, "copyWithRepeatIteration:", self->_repeatIteration);
      v51 = self->_repeatOneComponents;
      self->_repeatOneComponents = v50;

      ++self->_repeatIteration;
      repeatOneComponents = self->_repeatOneComponents;
    }
    -[MPCQueueControllerBehaviorMusicIdentifierComponents contentItemID](repeatOneComponents, "contentItemID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_81;
  }
  v69 = a2;
  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v73 = self;
  v23 = self->_queueEnumerator;
  v24 = -[_MPCQueueControllerEnumerator countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
  if (!v24)
    goto LABEL_46;
  v25 = v24;
  v26 = *(_QWORD *)v76;
  v71 = v4 & 0xFFFFFFFFFFFFFFFELL;
  v27 = (v4 & 0xFFFFFFFFFFFFFFFELL) != 2 || (v70 & 8) != 0;
  while (2)
  {
    for (i = 0; i != v25; ++i)
    {
      if (*(_QWORD *)v76 != v26)
        objc_enumerationMutation(v23);
      v29 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * i);
      v30 = objc_msgSend(v29, "entryType");
      switch(v30)
      {
        case 2:
          if (v27)
            continue;
          objc_msgSend(v29, "trackingEntryResult");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "sectionIdentifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[_MPCQueueControllerBehaviorMusicEnumerator _loadingComponentsForHeadOfSection:](v73, "_loadingComponentsForHeadOfSection:", v34);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31)
          {
            v35 = v31;
            objc_msgSend(v31, "contentItemID");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_80:

            goto LABEL_81;
          }
          goto LABEL_43;
        case 4:
          objc_msgSend(v29, "trackingEntryResult");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "sectionIdentifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "dataSources");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectForKeyedSubscript:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (!objc_msgSend(v35, "isRadioDataSource")
            || !objc_msgSend(v35, "shouldRequestAdditionalItemsAtTail"))
          {
            goto LABEL_42;
          }
          if (v4 == 1)
          {
            if ((v70 & 8) != 0)
            {
              objc_msgSend(v74, "host");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v53 = os_log_create("com.apple.amp.mediaplaybackcore", "MusicBehavior");
              if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v52, "engineID");
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v74, "sessionID");
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                v84 = v54;
                v85 = 2114;
                v86 = v55;
                v87 = 2114;
                v88 = v34;
                _os_log_impl(&dword_210BD8000, v53, OS_LOG_TYPE_DEFAULT, "[BMUS:%{public}@:%{public}@] enumerator nextObject: | returning nil [encountered radio tail while reverse enumerating in display mode] sectionID=%{public}@", buf, 0x20u);

              }
            }
            v40 = 0;
            queueEnumerator = v73->_queueEnumerator;
            v73->_queueEnumerator = 0;
          }
          else
          {
            if (v71 != 2)
            {
LABEL_42:

LABEL_43:
              continue;
            }
            objc_msgSend(MEMORY[0x24BDDCBC0], "positionForTailOfSection:", v34);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            +[_MPCQueueControllerEnumerator enumeratorWithMusicBehavior:mode:options:startPosition:endPosition:](_MPCQueueControllerEnumerator, "enumeratorWithMusicBehavior:mode:options:startPosition:endPosition:", v74, 0, 8, v57, 0);
            queueEnumerator = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(queueEnumerator, "nextObject");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = v58;
            if (v58)
            {
              v72 = queueEnumerator;
              if (objc_msgSend(v58, "entryType") != 3)
              {
                objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
                v67 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v67, "handleFailureInMethod:object:file:lineNumber:description:", v69, v73, CFSTR("_MPCQueueControllerBehaviorMusic.m"), 4111, CFSTR("Encountered unexpected enumeration result type: %ld"), objc_msgSend(v59, "entryType"));

              }
              objc_msgSend(v59, "itemResult");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "sectionIdentifier");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "itemIdentifier");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              +[MPCQueueControllerBehaviorMusicIdentifierComponents itemComponentsWithSectionID:itemID:](MPCQueueControllerBehaviorMusicIdentifierComponents, "itemComponentsWithSectionID:itemID:", v61, v62);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              v64 = (void *)objc_msgSend(v63, "copyAsDeferredWithLoadingSectionID:", v34);

              objc_msgSend(v64, "contentItemID");
              v40 = (void *)objc_claimAutoreleasedReturnValue();

              queueEnumerator = v72;
            }
            else
            {
              +[MPCQueueControllerBehaviorMusicIdentifierComponents placeholderComponentsWithLoadingSectionID:](MPCQueueControllerBehaviorMusicIdentifierComponents, "placeholderComponentsWithLoadingSectionID:", v34);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "contentItemID");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
            }

          }
          goto LABEL_80;
        case 3:
          objc_msgSend(v29, "itemResult");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "sectionIdentifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "itemIdentifier");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v74, "dataSources");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectForKeyedSubscript:", v34);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          if (v37)
          {
            if (objc_msgSend(v37, "shouldUsePlaceholderForItem:inSection:", v35, v34))
            {
              if (v71 == 2)
              {
                +[MPCQueueControllerBehaviorMusicIdentifierComponents itemComponentsWithSectionID:itemID:](MPCQueueControllerBehaviorMusicIdentifierComponents, "itemComponentsWithSectionID:itemID:", v34, v35);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = objc_msgSend(v38, "copyAsPlaceholder");

              }
              else
              {
                v39 = 0;
              }
              if (!v4 || (v70 & 8) != 0)
                goto LABEL_75;
              v41 = v73->_queueEnumerator;
              v73->_queueEnumerator = 0;
LABEL_74:

LABEL_75:
              v41 = (void *)v39;
              goto LABEL_76;
            }
            +[MPCQueueControllerBehaviorMusicIdentifierComponents itemComponentsWithSectionID:itemID:](MPCQueueControllerBehaviorMusicIdentifierComponents, "itemComponentsWithSectionID:itemID:", v34, v35);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v41 = v43;
            if (v71 != 2)
            {
LABEL_76:
              objc_msgSend(v41, "contentItemID");
              v40 = (void *)objc_claimAutoreleasedReturnValue();

              goto LABEL_80;
            }
            v42 = objc_msgSend(v43, "copyWithRepeatIteration:", v73->_repeatIteration);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "handleFailureInMethod:object:file:lineNumber:description:", v69, v73, CFSTR("_MPCQueueControllerBehaviorMusic.m"), 4053, CFSTR("Enumerated an itemResult that has no dataSourceState: sectionID=%@"), v34);

            }
            +[MPCQueueControllerBehaviorMusicIdentifierComponents itemComponentsWithSectionID:itemID:](MPCQueueControllerBehaviorMusicIdentifierComponents, "itemComponentsWithSectionID:itemID:", v34, v35);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v41, "copyAsPlaceholder");
          }
          v39 = v42;
          goto LABEL_74;
      }
    }
    v25 = -[_MPCQueueControllerEnumerator countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v75, v89, 16);
    if (v25)
      continue;
    break;
  }
LABEL_46:

  v40 = 0;
LABEL_81:

  return v40;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queueEnumerator, 0);
  objc_storeStrong((id *)&self->_repeatOneComponents, 0);
  objc_storeStrong((id *)&self->_startingComponents, 0);
}

- (id)_loadingComponentsForHeadOfSection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[_MPCQueueControllerEnumerator musicBehavior](self->_queueEnumerator, "musicBehavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (objc_msgSend(v7, "state") != 1)
    {
LABEL_15:
      v14 = 0;
      goto LABEL_16;
    }
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(v5, "dataSources", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v17;
      while (2)
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v12)
            objc_enumerationMutation(v9);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v13), "state") != 1)
          {

            goto LABEL_15;
          }
          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v11)
          continue;
        break;
      }
    }

  }
  +[MPCQueueControllerBehaviorMusicIdentifierComponents placeholderComponentsWithLoadingSectionID:](MPCQueueControllerBehaviorMusicIdentifierComponents, "placeholderComponentsWithLoadingSectionID:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v14;
}

- (_MPCQueueControllerEnumerator)queueEnumerator
{
  return self->_queueEnumerator;
}

@end
