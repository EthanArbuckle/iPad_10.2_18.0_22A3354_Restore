@implementation ATXFakeAnchorModelPhase1Trainer

- (ATXFakeAnchorModelPhase1Trainer)init
{
  ATXFakeAnchorModelPhase1Trainer *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ATXFakeAnchorModelPhase1Trainer;
  result = -[ATXFakeAnchorModelPhase1Trainer init](&v3, sel_init);
  if (result)
    result->_phase1TrainerCalled = 0;
  return result;
}

- (id)trainPhase1
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  self->_phase1TrainerCalled = 1;
  v2 = (void *)objc_opt_new();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = objc_msgSend(&unk_1E83D0418, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(&unk_1E83D0418);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6);
        v8 = (void *)objc_opt_new();
        objc_msgSend(v8, "setCandidateId:", v7);
        objc_msgSend(v2, "addObject:", v8);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(&unk_1E83D0418, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  return v2;
}

- (BOOL)phase1TrainerCalled
{
  return self->_phase1TrainerCalled;
}

@end
