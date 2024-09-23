@implementation SIActivityDump

size_t ___SIActivityDump_block_invoke(size_t result, int *a2)
{
  size_t v3;
  int v4;
  int v5;
  const char *v6;
  const char *v7;
  time_t v8;
  tm *v9;
  __CFCalendar *v10;
  FILE *v11;
  uint64_t v12;
  const char *date_string;
  const char *v14;
  FILE *v15;
  uint64_t v16;
  FILE *v17;
  tm *v18;
  FILE *v19;
  FILE *v20;
  unsigned int v21;
  uint64_t v22;
  const char *v23;
  FILE *v24;
  const char *v25;
  size_t v26;
  FILE *v27;
  FILE *v28;
  FILE *v29;
  FILE *v30;
  FILE *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  time_t v50;
  time_t v51;
  char v52[16];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  char v68[264];
  uint64_t v69;

  v3 = result;
  v69 = *MEMORY[0x1E0C80C00];
  memset(v68, 0, 256);
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v4 = *a2;
  v5 = *a2 - 1;
  *(_OWORD *)v52 = 0u;
  v53 = 0u;
  v6 = "CreateIndex";
  switch(v4)
  {
    case 1:
    case 37:
      break;
    case 2:
    case 33:
    case 38:
      v6 = "OpenIndex";
      break;
    case 3:
    case 34:
    case 39:
      v6 = "OpenIndexShadow";
      break;
    case 4:
    case 7:
    case 8:
    case 35:
    case 36:
LABEL_13:
      v15 = *(FILE **)(result + 32);
      get_date_string(*(__CFCalendar **)(result + 40), v68, *((CFAbsoluteTime *)a2 + 3));
      return fprintf(v15, "%s time: %s\n");
    case 5:
    case 40:
      v6 = "SyncIndex";
      break;
    case 6:
LABEL_25:
      v51 = *((_QWORD *)a2 + 4);
      v18 = localtime(&v51);
      strftime(v52, 0x100uLL, "%F %T", v18);
      v19 = *(FILE **)(v3 + 32);
      get_date_string(*(__CFCalendar **)(v3 + 40), v68, *((CFAbsoluteTime *)a2 + 3));
      return fprintf(v19, "%s time: %s recoverTimeStamp:%s (%ld)\n");
    case 9:
    case 10:
    case 16:
    case 32:
    case 41:
    case 42:
    case 43:
    case 44:
      return result;
    case 11:
    case 28:
    case 29:
      v6 = "AddItem";
      break;
    case 12:
    case 14:
    case 15:
LABEL_20:
      v17 = *(FILE **)(result + 32);
      if (!a2[3])
        return fprintf(v17, "%s oid: 0x%llx %lld\n");
      return fprintf(v17, "%s oid: 0x%llx %lld transaction: %d\n");
    case 13:
    case 30:
    case 31:
      v6 = "UpdateItem";
      break;
    case 17:
    case 18:
    case 19:
    case 54:
LABEL_14:
      v16 = *((_QWORD *)a2 + 3);
      if ((HIDWORD(v16) == 716189596 || HIDWORD(v16) == 510259174) && (v16 & 0x80000000) == 0 && (_DWORD)v16)
        return fprintf(*(FILE **)(result + 32), "%s id: %d oid: 0x%llx %lld\n");
      v17 = *(FILE **)(result + 32);
      return fprintf(v17, "%s oid: 0x%llx %lld\n");
    case 20:
      return fprintf(*(FILE **)(result + 32), "NewLiveIndex position: %d base: %lld\n");
    case 21:
    case 22:
      return fprintf(*(FILE **)(result + 32), "%s position: %d count: %d\n");
    case 23:
      return fprintf(*(FILE **)(result + 32), "NewBundleGroup %d 0x%x %s\n");
    case 24:
    case 25:
    case 52:
    case 53:
      return fprintf(*(FILE **)(result + 32), "%s journal.%d\n");
    case 26:
LABEL_33:
      v24 = *(FILE **)(result + 32);
      v25 = "Playback start\n";
      v26 = 15;
      return fwrite(v25, v26, 1uLL, v24);
    case 27:
LABEL_34:
      v24 = *(FILE **)(result + 32);
      v25 = "Playback end\n";
      v26 = 13;
      return fwrite(v25, v26, 1uLL, v24);
    case 45:
    case 47:
    case 50:
      v6 = "AddMailItem";
      break;
    case 46:
    case 48:
    case 49:
    case 51:
      v6 = "UpdateMailItem";
      break;
    case 55:
LABEL_36:
      v27 = *(FILE **)(result + 32);
      get_date_string(*(__CFCalendar **)(result + 40), v68, *((CFAbsoluteTime *)a2 + 3));
      return fprintf(v27, "Journal was reset at time %s, size before reset: %llu, size after reset: %llu\n");
    case 56:
LABEL_37:
      v28 = *(FILE **)(result + 32);
      get_date_string(*(__CFCalendar **)(result + 40), v68, *((CFAbsoluteTime *)a2 + 4));
      return fprintf(v28, "%s pid: %d time: %s build: %s\n");
    case 58:
LABEL_38:
      v29 = *(FILE **)(result + 32);
      if (a2[13])
        return fprintf(v29, "%s[%u] id: %llu hash: %llx sz: %lu %s\n");
      else
        return fprintf(v29, "%s[%u] id: %llu hash: %llx sz: %lu\n");
    case 59:
      return fprintf(*(FILE **)(result + 32), "%s[%u] %s/%s cnt:%u\n");
    default:
      v6 = "Unknown";
      break;
  }
  v7 = v6;
  switch(v5)
  {
    case 0:
    case 1:
    case 2:
    case 32:
    case 33:
    case 36:
    case 37:
    case 38:
      if ((v4 - 37) <= 2)
      {
        v51 = *((_QWORD *)a2 + 9);
        v8 = v51;
        v9 = localtime(&v51);
        strftime(v52, 0x100uLL, "%F %T", v9);
        v11 = *(FILE **)(v3 + 32);
        v10 = *(__CFCalendar **)(v3 + 40);
        v12 = a2[6];
        date_string = get_date_string(v10, v68, *((CFAbsoluteTime *)a2 + 4));
        v49 = v52;
        v50 = v8;
        v45 = *((_QWORD *)a2 + 7);
        v48 = *((_QWORD *)a2 + 8);
        v41 = a2[11];
        v43 = a2[12];
        v37 = date_string;
        v39 = a2[10];
        v14 = "%s pid: %d time: %s syncCount: %d scanCount: %d liveCount: %d serialNumber: %lld consumedSerialNumber: %ll"
              "d recoverTimeStamp:%s (%ld)\n";
        v35 = v12;
        return fprintf(v11, v14, v7, v35, v37, v39, v41, v43, v45, v48, v49, v50);
      }
      v21 = v4 - 33;
      v22 = a2[6];
      v11 = *(FILE **)(result + 32);
      v23 = get_date_string(*(__CFCalendar **)(result + 40), v68, *((CFAbsoluteTime *)a2 + 4));
      if (v21 <= 1)
      {
        v45 = *((_QWORD *)a2 + 7);
        v48 = *((_QWORD *)a2 + 8);
        v41 = a2[11];
        v43 = a2[12];
        v37 = v23;
        v39 = a2[10];
        v14 = "%s pid: %d time: %s syncCount: %d scanCount: %d liveCount: %d serialNumber: %lld consumedSerialNumber: %lld\n";
        v35 = v22;
        return fprintf(v11, v14, v7, v35, v37, v39, v41, v43, v45, v48, v49, v50);
      }
      return fprintf(v11, "%s pid: %d time: %s syncCount: %d scanCount: %d liveCount: %d\n");
    case 3:
    case 4:
    case 6:
    case 7:
    case 34:
    case 35:
      goto LABEL_13;
    case 5:
    case 39:
      goto LABEL_25;
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
      goto LABEL_20;
    case 16:
    case 17:
    case 18:
    case 53:
      goto LABEL_14;
    case 19:
      return fprintf(*(FILE **)(result + 32), "NewLiveIndex position: %d base: %lld\n");
    case 20:
    case 21:
      return fprintf(*(FILE **)(result + 32), "%s position: %d count: %d\n");
    case 22:
      return fprintf(*(FILE **)(result + 32), "NewBundleGroup %d 0x%x %s\n");
    case 23:
    case 24:
    case 51:
    case 52:
      return fprintf(*(FILE **)(result + 32), "%s journal.%d\n");
    case 25:
      goto LABEL_33;
    case 26:
      goto LABEL_34;
    case 27:
    case 28:
    case 29:
    case 30:
      v20 = *(FILE **)(result + 32);
      if (a2[3])
        return fprintf(v20, "%s transaction: %d id: %s oid: 0x%llx serial: %lld\n");
      else
        return fprintf(v20, "%s id: %s oid: 0x%llx serial: %lld\n");
    case 44:
    case 45:
      v30 = *(FILE **)(result + 32);
      if (a2[3])
        return fprintf(v30, "%s transaction: %d id: %s oid: 0x%llx serial: %lld read: %d\n");
      else
        return fprintf(v30, "%s id: %s oid: 0x%llx serial: %lld read: %d\n");
    case 46:
    case 47:
      v31 = *(FILE **)(result + 32);
      v32 = a2[3];
      v44 = *((char *)a2 + 44);
      v46 = *((char *)a2 + 45);
      v40 = *((_QWORD *)a2 + 3);
      v42 = *((_QWORD *)a2 + 2);
      v38 = *((_QWORD *)a2 + 4);
      v33 = "%s transaction: %d id: %s oid: 0x%llx serial: %lld read: %d flagged: %d\n";
      goto LABEL_49;
    case 48:
      v31 = *(FILE **)(result + 32);
      v32 = a2[3];
      v44 = *((char *)a2 + 44);
      v46 = *((char *)a2 + 45);
      v40 = *((_QWORD *)a2 + 3);
      v42 = *((_QWORD *)a2 + 2);
      v38 = *((_QWORD *)a2 + 4);
      v33 = "%s transaction: %d id: %s oid: 0x%llx serial: %lld read: %d flagged: %d color: <null>\n";
LABEL_49:
      v36 = v32;
      return fprintf(v31, v33, v6, v36, v38, v40, v42, v44, v46, v47);
    case 49:
    case 50:
      v31 = *(FILE **)(result + 32);
      v34 = a2[3];
      v46 = *((char *)a2 + 45);
      v47 = *((char *)a2 + 46);
      v42 = *((_QWORD *)a2 + 2);
      v44 = *((char *)a2 + 44);
      v38 = *((_QWORD *)a2 + 4);
      v40 = *((_QWORD *)a2 + 3);
      v33 = "%s transaction: %d id: %s oid: 0x%llx serial: %lld read: %d flagged: %d color: %d\n";
      v36 = v34;
      return fprintf(v31, v33, v6, v36, v38, v40, v42, v44, v46, v47);
    case 54:
      goto LABEL_36;
    case 55:
      goto LABEL_37;
    case 56:
      return fprintf(*(FILE **)(result + 32), "%s\n");
    case 57:
      goto LABEL_38;
    case 58:
      return fprintf(*(FILE **)(result + 32), "%s[%u] %s/%s cnt:%u\n");
    default:
      return result;
  }
}

@end
