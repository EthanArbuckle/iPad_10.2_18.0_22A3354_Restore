@implementation ICNotesUpdateUserActivityForViewingNoteWithState

void __ICNotesUpdateUserActivityForViewingNoteWithState_block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  objc_msgSend(a2, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "numberWithDouble:");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

@end
