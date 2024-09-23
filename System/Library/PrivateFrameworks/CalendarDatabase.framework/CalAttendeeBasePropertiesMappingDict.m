@implementation CalAttendeeBasePropertiesMappingDict

void __CalAttendeeBasePropertiesMappingDict_block_invoke()
{
  __CFString *v0;
  __CFDictionary *MutableCopy;
  uint64_t i;
  uint64_t j;
  __CFString *v4;
  int v5;
  __CFString *v6;
  int v7;
  __CFString *v8;
  int v9;
  __CFString *v10;
  int v11;
  __CFString *v12;
  int v13;
  __CFString *v14;
  int v15;
  __CFString *v16;
  int v17;
  __CFString *v18;
  int v19;
  __CFString *v20;
  int v21;
  __CFString *v22;
  int v23;
  __CFString *v24;
  int v25;
  __CFString *v26;
  int v27;
  __CFString *v28;
  int v29;
  __CFString *v30;
  int v31;
  __CFString *v32;
  int v33;
  __CFString *v34;
  int v35;
  __CFString *v36;
  int v37;
  __CFString *v38;
  int v39;
  __CFString *v40;
  int v41;
  __CFString *v42;
  int v43;
  __CFString *v44;
  int v45;
  __CFString *v46;
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v26 = CFSTR("UUID");
  v27 = 8;
  v28 = CFSTR("displayNameRaw");
  v29 = 21;
  v30 = CFSTR("URLString");
  v31 = 22;
  v32 = CFSTR("emailAddress");
  v33 = 9;
  v34 = CFSTR("phoneNumber");
  v35 = 10;
  v36 = CFSTR("firstName");
  v37 = 28;
  v38 = CFSTR("lastName");
  v39 = 29;
  v40 = CFSTR("comment");
  v41 = 12;
  v42 = CFSTR("commentLastModifiedDate");
  v43 = 30;
  v44 = CFSTR("proposedStartDateStatus");
  v45 = 18;
  v0 = CFSTR("scheduleForceSend");
  v46 = v0;
  v47 = 20;
  CalAttendeeBasePropertiesMappingDict_sOrganizerPropDict = (uint64_t)_CalDBCreatePropertyMap((uint64_t)&v26, 11);
  MutableCopy = CFDictionaryCreateMutableCopy(0, 0, (CFDictionaryRef)CalAttendeeBasePropertiesMappingDict_sOrganizerPropDict);
  v4 = CFSTR("proposedStartDate");
  v5 = 16;
  v6 = CFSTR("inviterNameString");
  v7 = 17;
  v8 = CFSTR("flags");
  v9 = 14;
  v10 = CFSTR("lastModifiedParticipationStatus");
  v11 = 15;
  v12 = CFSTR("participantType");
  v13 = 1;
  v14 = CFSTR("participantRole");
  v15 = 4;
  v16 = CFSTR("statusRaw");
  v17 = 2;
  v18 = CFSTR("pendingStatusRaw");
  v19 = 3;
  v20 = CFSTR("scheduleStatus");
  v21 = 19;
  v22 = v0;
  v23 = 20;
  v24 = CFSTR("isCurrentUser");
  v25 = 32;
  _CalDBInsertPropertyMap(MutableCopy, (uint64_t)&v4, 11);
  CalAttendeeBasePropertiesMappingDict_sAttendeePropDict = (uint64_t)MutableCopy;
  for (i = 160; i != -16; i -= 16)

  for (j = 160; j != -16; j -= 16)
}

@end
