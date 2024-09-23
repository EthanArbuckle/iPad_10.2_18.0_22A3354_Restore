@implementation CalDatabaseClearSuperfluousChanges

void ___CalDatabaseClearSuperfluousChanges_block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  ___CalDatabaseClearSuperfluousChanges_block_invoke_2(a1, __classesTrackingChanges);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)_CalDatabaseClearSuperfluousChanges___clientSequenceDeleteQueryMainDB;
  _CalDatabaseClearSuperfluousChanges___clientSequenceDeleteQueryMainDB = v1;

  ___CalDatabaseClearSuperfluousChanges_block_invoke_2(v3, off_1EE807BC0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_CalDatabaseClearSuperfluousChanges___clientSequenceDeleteQueryAuxDB;
  _CalDatabaseClearSuperfluousChanges___clientSequenceDeleteQueryAuxDB = v4;

}

id ___CalDatabaseClearSuperfluousChanges_block_invoke_2(uint64_t a1, _QWORD *a2)
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("DELETE FROM ClientSequence WHERE ClientSequence.sequence_number NOT IN "));
  v4 = (_QWORD *)*a2;
  if (*a2)
  {
    v5 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", *v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        objc_msgSend(v3, "appendString:", CFSTR("AND ClientSequence.sequence_number NOT IN "));
      objc_msgSend(v3, "appendFormat:", CFSTR("(SELECT DISTINCT %@Changes.sequence_number FROM %@Changes WHERE %@Changes.sequence_number IS NOT NULL)"), v6, v6, v6);

      v4 = (_QWORD *)a2[++v5];
    }
    while (v4);
  }
  return v3;
}

@end
