@implementation CalAttendeeMigrateTables

CFStringRef __CalAttendeeMigrateTables_block_invoke(uint64_t a1, CFStringRef theString1)
{
  const __CFUUID *v3;
  CFStringRef v4;

  if (*(int *)(a1 + 32) > 52 || CFStringCompare(theString1, CFSTR("UUID"), 0))
    return 0;
  v3 = CFUUIDCreate(0);
  v4 = CFUUIDCreateString(0, v3);
  CFRelease(v3);
  return v4;
}

void __CalAttendeeMigrateTables_block_invoke_2(uint64_t a1)
{
  int v2;
  _QWORD *v3;
  const __CFString *v4;
  const __CFString *v5;

  v2 = *(_DWORD *)(a1 + 40);
  v3 = *(_QWORD **)(a1 + 32);
  if (v2 >= 55)
    v4 = CFSTR("UPDATE Participant SET email = (SELECT Identity.address FROM Participant_, Identity WHERE Participant_.ROWID = Participant.ROWID AND Participant_.identity_id = Identity.ROWID);");
  else
    v4 = CFSTR("UPDATE Participant SET identity_id = (SELECT Attendee_.participant_id FROM Attendee_ WHERE Attendee_.ROWID = Participant.ROWID);");
  if (v2 >= 55)
    v5 = CFSTR("UPDATE Identity SET address = IFNULL((SELECT external_id FROM Participant_, Identity WHERE Identity.ROWID = Participant_.identity_id), 'mailto:' || address);");
  else
    v5 = CFSTR("UPDATE Participant SET email = (SELECT Identity.address FROM Attendee_, Identity WHERE Attendee_.ROWID = Participant.ROWID AND Attendee_.participant_id = Identity.ROWID);");
  CalPerformSQLWithConnection(v3, (uint64_t)v4);
  CalPerformSQLWithConnection(*(_QWORD **)(a1 + 32), (uint64_t)v5);
}

void __CalAttendeeMigrateTables_block_invoke_3(uint64_t a1)
{
  CalPerformSQLWithConnection(*(_QWORD **)(a1 + 32), (uint64_t)CFSTR("UPDATE Participant SET email = (SELECT Identity.address FROM Participant_, Identity WHERE Participant_.ROWID = Participant.ROWID AND Participant_.identity_id = Identity.ROWID);"));
  CalPerformSQLWithConnection(*(_QWORD **)(a1 + 32), (uint64_t)CFSTR("UPDATE Identity SET address = IFNULL((SELECT external_id FROM Participant_, Identity WHERE Identity.ROWID = Participant_.identity_id), 'mailto:' || address);"));
}

@end
