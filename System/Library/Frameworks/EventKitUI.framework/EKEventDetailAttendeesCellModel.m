@implementation EKEventDetailAttendeesCellModel

- (EKEventDetailAttendeesCellModel)init
{
  EKEventDetailAttendeesCellModel *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKEventDetailAttendeesCellModel;
  result = -[EKEventDetailAttendeesCellModel init](&v3, sel_init);
  if (result)
    result->_lock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)setEvent:(id)a3
{
  id v5;
  NSMutableArray *pendingCallbackBlocks;
  NSMutableArray *v7;
  NSMutableArray *v8;
  NSArray *accepted;
  NSArray *maybe;
  NSArray *declined;
  NSArray *noReply;
  NSArray *ungrouped;
  NSArray *cachedAttendeesNotIncludingOrganizerOrLocationsOrResources;
  NSMutableArray *v15;
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

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  os_unfair_lock_lock(&self->_lock);
  if (-[EKEventDetailAttendeesCellModel _eventDifferent:](self, "_eventDifferent:", v5))
  {
    objc_storeStrong((id *)&self->_event, a3);
    ++self->_generation;
    pendingCallbackBlocks = self->_pendingCallbackBlocks;
    if (pendingCallbackBlocks)
    {
      v7 = pendingCallbackBlocks;
      v8 = self->_pendingCallbackBlocks;
      self->_pendingCallbackBlocks = 0;

    }
    self->_groupAndSortQueued = 0;
    accepted = self->_accepted;
    self->_accepted = 0;

    maybe = self->_maybe;
    self->_maybe = 0;

    declined = self->_declined;
    self->_declined = 0;

    noReply = self->_noReply;
    self->_noReply = 0;

    ungrouped = self->_ungrouped;
    self->_ungrouped = 0;

    cachedAttendeesNotIncludingOrganizerOrLocationsOrResources = self->_cachedAttendeesNotIncludingOrganizerOrLocationsOrResources;
    self->_cachedAttendeesNotIncludingOrganizerOrLocationsOrResources = 0;

    os_unfair_lock_unlock(&self->_lock);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v15 = pendingCallbackBlocks;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v21;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v21 != v18)
            objc_enumerationMutation(v15);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v19) + 16))(*(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v19));
          ++v19;
        }
        while (v17 != v19);
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v17);
    }

  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (BOOL)_eventDifferent:(id)a3
{
  BOOL v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  if (self->_event == a3)
  {
    objc_msgSend(a3, "attendeesNotIncludingOrganizerOrLocationsOrResources");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    if (v6 == -[NSArray count](self->_cachedAttendeesNotIncludingOrganizerOrLocationsOrResources, "count"))
    {
      if (!v6)
      {
LABEL_8:
        v3 = objc_msgSend((id)objc_opt_class(), "computeStatusHash:", v5) != self->_statusHash;
LABEL_10:

        return v3;
      }
      v7 = 0;
      while (1)
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray objectAtIndexedSubscript:](self->_cachedAttendeesNotIncludingOrganizerOrLocationsOrResources, "objectAtIndexedSubscript:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8 != v9)
          break;
        if (v6 == ++v7)
          goto LABEL_8;
      }
    }
    v3 = 1;
    goto LABEL_10;
  }
  return 1;
}

- (BOOL)sortAttendeesWithCompletion:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSArray *maybe;
  NSArray *accepted;
  NSArray *noReply;
  NSArray *declined;
  NSArray *v10;
  NSArray *v11;
  NSArray *v12;
  NSArray *v13;
  NSArray *v14;
  BOOL v15;
  NSMutableArray *pendingCallbackBlocks;
  NSMutableArray *v17;
  NSMutableArray *v18;
  void *v19;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (-[EKEventDetailAttendeesCellModel _needsGroupAndSort](self, "_needsGroupAndSort")
    && (self->_groupAndSortQueued || !-[EKEventDetailAttendeesCellModel _groupAndSort](self, "_groupAndSort")))
  {
    pendingCallbackBlocks = self->_pendingCallbackBlocks;
    if (!pendingCallbackBlocks)
    {
      v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v18 = self->_pendingCallbackBlocks;
      self->_pendingCallbackBlocks = v17;

      pendingCallbackBlocks = self->_pendingCallbackBlocks;
    }
    v19 = _Block_copy(v4);
    -[NSMutableArray addObject:](pendingCallbackBlocks, "addObject:", v19);

    os_unfair_lock_unlock(p_lock);
    v15 = 0;
  }
  else
  {
    accepted = self->_accepted;
    maybe = self->_maybe;
    declined = self->_declined;
    noReply = self->_noReply;
    v10 = self->_ungrouped;
    v11 = noReply;
    v12 = declined;
    v13 = maybe;
    v14 = accepted;
    os_unfair_lock_unlock(p_lock);
    (*((void (**)(id, NSArray *, NSArray *, NSArray *, NSArray *, NSArray *))v4 + 2))(v4, v14, v13, v12, v11, v10);

    v15 = 1;
  }

  return v15;
}

- (BOOL)_needsGroupAndSort
{
  return !self->_accepted && self->_ungrouped == 0;
}

- (BOOL)_groupAndSort
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  unint64_t v17;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  uint64_t v26;
  EKEventDetailAttendeesCellModel *v29;
  unint64_t v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  -[EKEventDetailAttendeesCellModel attendeesNotIncludingOrganizerOrLocationsOrResources](self, "attendeesNotIncludingOrganizerOrLocationsOrResources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[EKEvent calendar](self->_event, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "source");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraints");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "statusesAreAccurate"))
  {
    v8 = CanSeeAttendeeStatuses((uint64_t)self->_event);

    if (v8)
    {
      v29 = self;
      v30 = v4;
      v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v11 = v3;
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v38;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v38 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
            v17 = objc_msgSend(v16, "participantType");
            if (v17 <= 4 && ((1 << v17) & 0x13) != 0)
            {
              objc_msgSend(v16, "participantStatus");
              v19 = v9;
              switch((unint64_t)v9)
              {
                case 0uLL:
                case 1uLL:
                  v19 = v10;
                  goto LABEL_16;
                case 2uLL:
                  goto LABEL_16;
                case 3uLL:
                  v19 = v31;
                  goto LABEL_16;
                case 4uLL:
                  v19 = v32;
LABEL_16:
                  objc_msgSend(v19, "addObject:", v16);
                  break;
                default:
                  continue;
              }
            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        }
        while (v13);
      }
      v4 = v30;

      -[EKEventDetailAttendeesCellModel sortAccepted:maybe:declined:noReply:ungrouped:synchronous:](v29, "sortAccepted:maybe:declined:noReply:ungrouped:synchronous:", v9, v32, v31, v10, 0, v30 < 0x19);
      goto LABEL_35;
    }
  }
  else
  {

  }
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v20 = v3;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v34 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
        v26 = objc_msgSend(v25, "participantType");
        if (v26 == 4 || v26 == 1)
          objc_msgSend(v9, "addObject:", v25);
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    }
    while (v22);
  }

  -[EKEventDetailAttendeesCellModel sortAccepted:maybe:declined:noReply:ungrouped:synchronous:](self, "sortAccepted:maybe:declined:noReply:ungrouped:synchronous:", 0, 0, 0, 0, v9, v4 < 0x19);
LABEL_35:

  return v4 < 0x19;
}

- (void)sortAccepted:(id)a3 maybe:(id)a4 declined:(id)a5 noReply:(id)a6 ungrouped:(id)a7 synchronous:(BOOL)a8
{
  _BOOL4 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  OS_dispatch_queue *v21;
  OS_dispatch_queue *sortAttendeesQueue;
  EKEvent *v23;
  int generation;
  NSObject *v25;
  NSObject *v26;
  EKEvent *v27;
  uint64_t v28;
  _QWORD block[5];
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  EKEvent *v35;
  int v36;
  char v37;
  uint8_t buf[4];
  int v39;
  uint64_t v40;

  v8 = a8;
  v40 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if (v8)
  {
    BYTE4(v28) = 1;
    LODWORD(v28) = self->_generation;
    -[EKEventDetailAttendeesCellModel _sortAccepted:maybe:declined:noReply:ungrouped:event:generation:synchronous:](self, "_sortAccepted:maybe:declined:noReply:ungrouped:event:generation:synchronous:", v14, v15, v16, v17, v18, self->_event, v28);
  }
  else
  {
    self->_groupAndSortQueued = 1;
    if (!self->_sortAttendeesQueue)
    {
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v19 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v19, QOS_CLASS_USER_INITIATED, 0);
      v20 = objc_claimAutoreleasedReturnValue();

      v21 = (OS_dispatch_queue *)dispatch_queue_create("sortAttendeesQueue", v20);
      sortAttendeesQueue = self->_sortAttendeesQueue;
      self->_sortAttendeesQueue = v21;

    }
    v23 = self->_event;
    generation = self->_generation;
    v25 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      v39 = generation;
      _os_log_impl(&dword_1AF84D000, v25, OS_LOG_TYPE_INFO, "Kicking off asynchronous sort of attendees with generation %i", buf, 8u);
    }
    v26 = self->_sortAttendeesQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __93__EKEventDetailAttendeesCellModel_sortAccepted_maybe_declined_noReply_ungrouped_synchronous___block_invoke;
    block[3] = &unk_1E6019A88;
    block[4] = self;
    v30 = v14;
    v31 = v15;
    v32 = v16;
    v33 = v17;
    v34 = v18;
    v35 = v23;
    v36 = generation;
    v37 = 0;
    v27 = v23;
    dispatch_async(v26, block);

  }
}

void __93__EKEventDetailAttendeesCellModel_sortAccepted_maybe_declined_noReply_ungrouped_synchronous___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD block[5];
  int v4;

  BYTE4(v2) = *(_BYTE *)(a1 + 92);
  LODWORD(v2) = *(_DWORD *)(a1 + 88);
  objc_msgSend(*(id *)(a1 + 32), "_sortAccepted:maybe:declined:noReply:ungrouped:event:generation:synchronous:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), v2);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__EKEventDetailAttendeesCellModel_sortAccepted_maybe_declined_noReply_ungrouped_synchronous___block_invoke_2;
  block[3] = &unk_1E6019A60;
  block[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_DWORD *)(a1 + 88);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __93__EKEventDetailAttendeesCellModel_sortAccepted_maybe_declined_noReply_ungrouped_synchronous___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "callCallbacksWithGeneration:", *(unsigned int *)(a1 + 40));
}

- (void)_sortAccepted:(id)a3 maybe:(id)a4 declined:(id)a5 noReply:(id)a6 ungrouped:(id)a7 event:(id)a8 generation:(int)a9 synchronous:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  int generation;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  int v31;
  id obj;
  void *v33;
  void *v34;
  id v35;
  id v36;
  uint8_t buf[4];
  int v38;
  __int16 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = v21;
  if (v16)
  {
    objc_msgSend(v21, "sortedEKParticipantsDisplayStringsIgnoringNonHumans:", v16);
    obj = (id)objc_claimAutoreleasedReturnValue();
    if (v17)
      goto LABEL_3;
LABEL_6:
    v36 = 0;
    if (v18)
      goto LABEL_4;
    goto LABEL_7;
  }
  obj = 0;
  if (!v17)
    goto LABEL_6;
LABEL_3:
  objc_msgSend(v22, "sortedEKParticipantsDisplayStringsIgnoringNonHumans:", v17, obj);
  v36 = (id)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
LABEL_4:
    objc_msgSend(v22, "sortedEKParticipantsDisplayStringsIgnoringNonHumans:", v18, obj);
    v35 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
LABEL_7:
  v35 = 0;
LABEL_8:
  v34 = v16;
  if (v19)
  {
    objc_msgSend(v22, "sortedEKParticipantsDisplayStringsIgnoringNonHumans:", v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }
  v33 = v20;
  v24 = v19;
  if (v20)
  {
    objc_msgSend(v22, "sortedEKParticipantsDisplayStringsIgnoringNonHumans:", v20);
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  v25 = v18;
  if (!a10)
    os_unfair_lock_lock(&self->_lock);
  generation = self->_generation;
  v27 = kEKUILogHandle;
  v28 = os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO);
  if (generation == a9)
  {
    v29 = v25;
    if (v28)
    {
      *(_DWORD *)buf = 67109120;
      v38 = a9;
      _os_log_impl(&dword_1AF84D000, v27, OS_LOG_TYPE_INFO, "Completed sort of attendees with generation %i", buf, 8u);
    }
    v30 = obj;
    objc_storeStrong((id *)&self->_accepted, obj);
    objc_storeStrong((id *)&self->_maybe, v36);
    objc_storeStrong((id *)&self->_declined, v35);
    objc_storeStrong((id *)&self->_noReply, v23);
    objc_storeStrong((id *)&self->_ungrouped, v20);
  }
  else
  {
    v29 = v25;
    v30 = obj;
    if (v28)
    {
      v31 = self->_generation;
      *(_DWORD *)buf = 67109376;
      v38 = a9;
      v39 = 1024;
      v40 = v31;
      _os_log_impl(&dword_1AF84D000, v27, OS_LOG_TYPE_INFO, "Completed sort of attendees with generation %i, but the current generation is %i", buf, 0xEu);
    }
  }
  if (!a10)
    os_unfair_lock_unlock(&self->_lock);

}

- (void)callCallbacksWithGeneration:(int)a3
{
  os_unfair_lock_s *p_lock;
  NSArray *v6;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;
  NSArray *v10;
  NSMutableArray *v11;
  NSMutableArray *pendingCallbackBlocks;
  void *v13;
  NSObject *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  int generation;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  _BYTE v28[10];
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_generation == a3)
  {
    v6 = self->_accepted;
    v7 = self->_maybe;
    v8 = self->_declined;
    v9 = self->_noReply;
    v10 = self->_ungrouped;
    v11 = self->_pendingCallbackBlocks;
    pendingCallbackBlocks = self->_pendingCallbackBlocks;
    self->_pendingCallbackBlocks = 0;

    self->_groupAndSortQueued = 0;
    os_unfair_lock_unlock(p_lock);
    v13 = (void *)kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO))
    {
      v14 = v13;
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)v28 = -[NSMutableArray count](v11, "count");
      *(_WORD *)&v28[8] = 1024;
      v29 = a3;
      _os_log_impl(&dword_1AF84D000, v14, OS_LOG_TYPE_INFO, "Calling %lu attendee sort callbacks for generation %i", buf, 0x12u);

    }
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v15 = v11;
    v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v15);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v19) + 16))(*(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v19));
          ++v19;
        }
        while (v17 != v19);
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v17);
    }

  }
  else
  {
    v20 = kEKUILogHandle;
    if (os_log_type_enabled((os_log_t)kEKUILogHandle, OS_LOG_TYPE_INFO))
    {
      generation = self->_generation;
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v28 = a3;
      *(_WORD *)&v28[4] = 1024;
      *(_DWORD *)&v28[6] = generation;
      _os_log_impl(&dword_1AF84D000, v20, OS_LOG_TYPE_INFO, "Not calling attendee sort callbacks because work completed for generation %i, but the current generation is %i", buf, 0xEu);
    }
    os_unfair_lock_unlock(p_lock);
  }
}

- (NSArray)attendeesNotIncludingOrganizerOrLocationsOrResources
{
  NSArray *cachedAttendeesNotIncludingOrganizerOrLocationsOrResources;
  NSArray *v4;
  NSArray *v5;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  cachedAttendeesNotIncludingOrganizerOrLocationsOrResources = self->_cachedAttendeesNotIncludingOrganizerOrLocationsOrResources;
  if (!cachedAttendeesNotIncludingOrganizerOrLocationsOrResources)
  {
    -[EKEvent attendeesNotIncludingOrganizerOrLocationsOrResources](self->_event, "attendeesNotIncludingOrganizerOrLocationsOrResources");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_cachedAttendeesNotIncludingOrganizerOrLocationsOrResources;
    self->_cachedAttendeesNotIncludingOrganizerOrLocationsOrResources = v4;

    self->_statusHash = objc_msgSend((id)objc_opt_class(), "computeStatusHash:", self->_cachedAttendeesNotIncludingOrganizerOrLocationsOrResources);
    cachedAttendeesNotIncludingOrganizerOrLocationsOrResources = self->_cachedAttendeesNotIncludingOrganizerOrLocationsOrResources;
  }
  return cachedAttendeesNotIncludingOrganizerOrLocationsOrResources;
}

+ (unint64_t)computeStatusHash:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  uint64_t v15;
  BOOL v16;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = a3;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1E0D0CD90];
        objc_msgSend(v10, "comment");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithAutoCommentRemoved:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "length") != 0;

        v15 = ((objc_msgSend(v10, "participantStatus") | (16 * v14)) << (4 * v5)) | v6;
        v16 = v5 == 15;
        if (v5 == 15)
          v5 = 0;
        else
          ++v5;
        if (v16)
          v6 = 0;
        else
          v6 = v15;
        if (v16)
          v7 = v15 + 13 * v7;
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v4);
    if (v5)
      v7 = v6 + 11 * v7;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingCallbackBlocks, 0);
  objc_storeStrong((id *)&self->_ungrouped, 0);
  objc_storeStrong((id *)&self->_noReply, 0);
  objc_storeStrong((id *)&self->_declined, 0);
  objc_storeStrong((id *)&self->_maybe, 0);
  objc_storeStrong((id *)&self->_accepted, 0);
  objc_storeStrong((id *)&self->_sortAttendeesQueue, 0);
  objc_storeStrong((id *)&self->_cachedAttendeesNotIncludingOrganizerOrLocationsOrResources, 0);
  objc_storeStrong((id *)&self->_event, 0);
}

@end
