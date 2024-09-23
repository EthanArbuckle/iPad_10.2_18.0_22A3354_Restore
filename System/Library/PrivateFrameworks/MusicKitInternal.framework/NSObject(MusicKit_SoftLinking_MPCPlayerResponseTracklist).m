@implementation NSObject(MusicKit_SoftLinking_MPCPlayerResponseTracklist)

- (id)_musicKit_self_responseTracklist
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2050000000;
  v2 = (void *)getMPCPlayerResponseTracklistClass_softClass;
  v9 = getMPCPlayerResponseTracklistClass_softClass;
  if (!getMPCPlayerResponseTracklistClass_softClass)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __getMPCPlayerResponseTracklistClass_block_invoke;
    v5[3] = &unk_1E9C05688;
    v5[4] = &v6;
    __getMPCPlayerResponseTracklistClass_block_invoke((uint64_t)v5);
    v2 = (void *)v7[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v6, 8);
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return a1;
  else
    return 0;
}

- (id)musicKit_responseTracklist_playingItem
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_responseTracklist");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "playingItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)musicKit_responseTracklist_repeatType
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_musicKit_self_responseTracklist");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "repeatType");

  if (v2 == 2)
    return 2;
  else
    return v2 == 1;
}

- (uint64_t)musicKit_responseTracklist_shuffleType
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_musicKit_self_responseTracklist");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "shuffleType");

  if (v2 == 2)
    return 2;
  else
    return v2 == 1;
}

- (uint64_t)musicKit_responseTracklist_actionAtQueueEnd
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_musicKit_self_responseTracklist");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "actionAtQueueEnd");

  if ((unint64_t)(v2 - 1) >= 3)
    return 0;
  else
    return v2;
}

- (id)musicKit_responseTracklist_resetCommand
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_responseTracklist");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "resetCommand");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)musicKit_responseTracklist_insertCommand
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_responseTracklist");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "insertCommand");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)musicKit_responseTracklist_reorderCommand
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_responseTracklist");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reorderCommand");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)musicKit_responseTracklist_changeItemCommand
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_responseTracklist");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "changeItemCommand");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)musicKit_responseTracklist_repeatCommand
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_responseTracklist");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "repeatCommand");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)musicKit_responseTracklist_shuffleCommand
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_responseTracklist");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "shuffleCommand");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)musicKit_responseTracklist_actionAtQueueEndCommand
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_musicKit_self_responseTracklist");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "actionAtQueueEndCommand");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)musicKit_responseTracklist_sectionedCollection
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "_musicKit_self_responseTracklist");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "displayItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CCDEB0]), "initWithUnderlyingSectionedCollection:", v2);

  return v3;
}

- (void)musicKit_responseTracklist_underlyingSectionObjectAtIndexPathBlock
{
  _QWORD aBlock[5];

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __127__NSObject_MusicKit_SoftLinking_MPCPlayerResponseTracklist__musicKit_responseTracklist_underlyingSectionObjectAtIndexPathBlock__block_invoke;
  aBlock[3] = &unk_1E9C05C18;
  aBlock[4] = a1;
  return _Block_copy(aBlock);
}

- (uint64_t)musicKit_globalItemCount
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_musicKit_self_responseTracklist");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "globalItemCount");

  return v2;
}

@end
