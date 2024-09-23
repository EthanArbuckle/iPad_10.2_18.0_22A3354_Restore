id NoteContextManagedObjectModelPath()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathForResource:ofType:", CFSTR("NotesModel"), CFSTR("momd"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

void sub_1C88DA8E4(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1C88DB770(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36)
{
  void *v36;

  objc_sync_exit(v36);
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void sub_1C88DBAFC(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    JUMPOUT(0x1C88DBA78);
  }
  _Unwind_Resume(exception_object);
}

id NoteContextPersistentStorePath()
{
  void *v0;
  void *v1;

  NoteContextRootDirectoryPath();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("notes.sqlite"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id NoteContextRootDirectoryPath()
{
  if (s_testsNotesRootPath)
    return (id)s_testsNotesRootPath;
  else
    return (id)NoteStoreCopyRootPath();
}

__CFString *_NoteStoreCopyPath()
{
  __CFString *v0;
  __CFString *v1;
  const __CFString *v2;

  v0 = _NoteStoreCopyRootPath();
  v1 = v0;
  if (v0)
  {
    if (_testingFilePrefix)
    {
      CFStringAppend(v0, (CFStringRef)_testingFilePrefix);
      v2 = CFSTR(".db");
    }
    else
    {
      v2 = CFSTR("notes.db");
    }
    CFStringAppend(v1, v2);
  }
  return v1;
}

__CFString *_NoteStoreCopyRootPath()
{
  const __CFString *v0;
  __CFString *MutableCopy;

  v0 = (const __CFString *)CPSharedResourcesDirectory();
  if (!v0)
    return 0;
  MutableCopy = CFStringCreateMutableCopy(0, 0, v0);
  CFStringAppend(MutableCopy, CFSTR("/Library/Notes/"));
  CPFileBuildDirectoriesToPath();
  return MutableCopy;
}

void sub_1C88DC780(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id a14)
{
  void *v14;
  id v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  char v22;
  id v23;
  NSObject *v24;

  if (a2)
  {
    objc_end_catch();
    if (a2 == 2)
    {
      v17 = objc_begin_catch(a1);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v17, "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("NoteStoreHasMismatchedNoteBodies"));

        if (v19)
        {
          v20 = os_log_create("com.apple.notes", "HTML");
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
            -[NoteContext handleMigration].cold.3();

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          a14 = 0;
          v22 = objc_msgSend(v21, "removeItemAtPath:error:", a11, &a14);
          v23 = a14;

          if ((v22 & 1) == 0)
          {
            v24 = os_log_create("com.apple.notes", "HTML");
            if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
            {
              objc_msgSend(v23, "userInfo");
              objc_claimAutoreleasedReturnValue();
              -[NoteContext handleMigration].cold.2();
            }

          }
          objc_msgSend(v14, "invalidate");

          objc_end_catch();
          JUMPOUT(0x1C88DC710);
        }
      }
      objc_exception_rethrow();
    }
    objc_begin_catch(a1);
    objc_exception_rethrow();
  }
  _Unwind_Resume(a1);
}

void sub_1C88DC948(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1C88DC954(uint64_t a1, int a2)
{
  if (a2)
    objc_terminate();
  JUMPOUT(0x1C88DC960);
}

uint64_t __ReceiveNotification(int a1, void *a2, CFTypeRef cf1)
{
  return objc_msgSend(a2, "receiveDarwinNotificationWithChangeLogging:", CFEqual(cf1, CFSTR("NoteContextDarwinNotificationWithLoggedChanges")) != 0);
}

void sub_1C88E1A08(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    objc_begin_catch(exception_object);
    JUMPOUT(0x1C88E1980);
  }
  _Unwind_Resume(exception_object);
}

id NoteContextIndexPath()
{
  void *v0;
  void *v1;

  NoteContextRootDirectoryPath();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("notes.idx"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_4(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_14(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_16(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_17(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_23(void *a1, const char *a2)
{
  return objc_msgSend(a1, "count");
}

void sub_1C88E580C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getMCProfileConnectionClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!ManagedConfigurationLibraryCore_frameworkLibrary)
  {
    ManagedConfigurationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!ManagedConfigurationLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("MCProfileConnection");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getMCProfileConnectionClass_block_invoke_cold_1();
    free(v3);
  }
  getMCProfileConnectionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t NoteGetTitle()
{
  return CPRecordGetProperty();
}

uint64_t NoteGetContent()
{
  return CPRecordGetProperty();
}

BOOL NoteGetContainsCJK()
{
  return CPRecordGetProperty() != 0;
}

double NoteGetCreationDate()
{
  return (double)(int)CPRecordGetProperty();
}

double NoteGetModificationDate()
{
  return (double)(int)CPRecordGetProperty();
}

uint64_t NoteGetAuthor()
{
  return CPRecordGetProperty();
}

BOOL NoteGetContentIsPlain()
{
  return CPRecordGetProperty() == 1;
}

void sub_1C88E64CC(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    objc_end_catch();
    JUMPOUT(0x1C88E6248);
  }
  _Unwind_Resume(a1);
}

void sub_1C88E6BE8(_Unwind_Exception *a1)
{
  uint64_t v2;

  objc_end_catch();
  _Block_object_dispose(&v2, 8);
  _Unwind_Resume(a1);
}

void sub_1C88E6BF4()
{
  JUMPOUT(0x1C88E6C24);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_1C88E7BC0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C88E7D74(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C88E7E88(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C88E7F54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getACUILocalizationClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AccountsUILibraryCore_frameworkLibrary)
  {
    AccountsUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AccountsUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("ACUILocalization");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getACUILocalizationClass_block_invoke_cold_1();
    free(v3);
  }
  getACUILocalizationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1C88E8CF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

id NoteAttachmentObjectDataBasePath(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "obtainPermanentIDsForObjects:error:", v5, a2);

  if (v6)
  {
    objc_msgSend(v3, "objectID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[NoteAttachmentObject attachmentDirectoryPathForAttachmentObjectID:error:](NoteAttachmentObject, "attachmentDirectoryPathForAttachmentObjectID:error:", v7, a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id NoteAttachmentObjectDataPath(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;

  v3 = a1;
  NoteAttachmentObjectDataBasePath(v3, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "valueForKey:", CFSTR("filename"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!-[__CFString length](v5, "length"))
    {

      v5 = CFSTR("attachmentFile");
    }
    objc_msgSend(v4, "stringByAppendingPathComponent:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t DataWritingOptionForFileProtectionOption(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  if (v1)
  {
    if (DataWritingOptionForFileProtectionOption_onceToken != -1)
      dispatch_once(&DataWritingOptionForFileProtectionOption_onceToken, &__block_literal_global_2);
    objc_msgSend((id)DataWritingOptionForFileProtectionOption_s_mappings, "objectForKeyedSubscript:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "unsignedIntegerValue");

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

id NoteAttachmentObjectDataBasePathBetween12A173And12A189()
{
  void *v0;
  void *v1;

  NoteContextRootDirectoryPath();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("attachments"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id NoteAttachmentObjectDataPathBetween12A173And12A189(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a2) = objc_msgSend(v4, "obtainPermanentIDsForObjects:error:", v5, a2);

  if ((_DWORD)a2)
  {
    objc_msgSend(v3, "objectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URIRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "absoluteString");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v9 = (__CFString *)CFURLCreateStringByAddingPercentEscapes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v8, 0, CFSTR("/"), 0x8000100u);
    NoteAttachmentObjectDataBasePathBetween12A173And12A189();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingPathComponent:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void sub_1C88EAF40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

uint64_t NoteStoreGetSharedNoteStore()
{
  uint64_t v0;
  __CFString *v1;
  __CFString *v2;

  v0 = __SharedNoteStore;
  if (!__SharedNoteStore)
  {
    v1 = _NoteStoreCopyPath();
    if (v1)
    {
      v2 = v1;
      v0 = CPRecordStoreCreateWithPath();
      CFRelease(v2);
      CPRecordStoreLogChanges();
      CPRecordStoreSetSetupHandler();
      CPRecordStoreGetDatabase();
      CPSqliteDatabaseSetMigrationHandlers();
      CPSqliteDatabaseSetVersion();
    }
    else
    {
      v0 = 0;
    }
    __SharedNoteStore = v0;
  }
  return v0;
}

uint64_t NoteStoreCopyAllNotes()
{
  return CPRecordStoreCopyAllInstancesOfClassWhere();
}

void __LoadContent(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  sqlite3_stmt *v5;
  int ID;
  void *v7;
  int v8;
  const __CFAllocator *v9;
  CFIndex v10;
  __CFData *Mutable;
  int v12;
  int v13;
  const __CFAllocator *v14;
  const UInt8 *BytePtr;
  CFStringRef v16;
  id v17;
  sqlite3_blob *ppBlob;

  v4 = CPSqliteConnectionStatementForSQL();
  if (v4)
  {
    v5 = *(sqlite3_stmt **)(v4 + 8);
    ID = CPRecordGetID();
    sqlite3_bind_int(v5, 1, ID);
    LODWORD(v5) = CPSqliteStatementIntegerResult();
    CPSqliteStatementReset();
    ppBlob = 0;
    if (sqlite3_blob_open(*(sqlite3 **)(a3 + 8), "main", "note_bodies", "data", (int)v5, 0, &ppBlob))
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("NoteStoreHasMismatchedNoteBodies"), CFSTR("Couldn't find the note body for a note"), 0);
      v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_exception_throw(v17);
    }
    v7 = malloc_type_calloc(1uLL, 0x4000uLL, 0x5059AC01uLL);
    v8 = sqlite3_blob_bytes(ppBlob);
    v9 = (const __CFAllocator *)MFGetMappedAllocator();
    v10 = v8;
    Mutable = CFDataCreateMutable(v9, v8);
    if (v8 >= 1)
    {
      v12 = 0;
      do
      {
        if ((int)v10 - v12 >= 0x4000)
          v13 = 0x4000;
        else
          v13 = v10 - v12;
        if (sqlite3_blob_read(ppBlob, v7, v13, v12))
          __LoadContent_cold_2();
        v12 += v13;
        CFDataAppendBytes(Mutable, (const UInt8 *)v7, v13);
      }
      while (v12 < (int)v10);
    }
    free(v7);
    v14 = (const __CFAllocator *)MFGetMappedAllocator();
    BytePtr = CFDataGetBytePtr(Mutable);
    v16 = CFStringCreateWithBytes(v14, BytePtr, v10, 0x8000100u, 0);
    CFRelease(Mutable);
    if (sqlite3_blob_close(ppBlob))
      __LoadContent_cold_1();
    CPSqliteDatabaseReleaseSqliteConnection();
    if (v16)
    {
      CPRecordInitializeProperty();
      CFRelease(v16);
    }
  }
}

void __SaveContent()
{
  uint64_t v0;
  sqlite3_stmt *v1;
  int ID;
  uint64_t v3;
  uint64_t v4;
  const __CFString *Property;
  const char *CStringPtr;
  char *v7;
  char *v8;
  sqlite3_stmt *v9;
  int v10;
  CFIndex Length;
  CFIndex MaximumSizeForEncoding;
  int CString;

  v0 = CPSqliteConnectionStatementForSQL();
  if (v0)
  {
    v1 = *(sqlite3_stmt **)(v0 + 8);
    ID = CPRecordGetID();
    sqlite3_bind_int(v1, 1, ID);
    LODWORD(v1) = CPSqliteStatementPerform();
    CPSqliteStatementReset();
    if ((_DWORD)v1 == 100)
    {
      v3 = CPSqliteConnectionStatementForSQL();
      if (v3)
      {
        v4 = v3;
        Property = (const __CFString *)CPRecordGetProperty();
        CStringPtr = CFStringGetCStringPtr(Property, 0x8000100u);
        if (CStringPtr)
        {
          v7 = (char *)CStringPtr;
          v8 = 0;
        }
        else
        {
          Length = CFStringGetLength(Property);
          MaximumSizeForEncoding = CFStringGetMaximumSizeForEncoding(Length + 1, 0x8000100u);
          v7 = (char *)malloc_type_malloc(MaximumSizeForEncoding, 0xC8A231FBuLL);
          if (!v7)
            goto LABEL_7;
          CString = CFStringGetCString(Property, v7, MaximumSizeForEncoding, 0x8000100u);
          v8 = v7;
          if (CString != 1)
            goto LABEL_7;
        }
        v9 = *(sqlite3_stmt **)(v4 + 8);
        v10 = CPRecordGetID();
        sqlite3_bind_int(v9, 1, v10);
        sqlite3_bind_text(*(sqlite3_stmt **)(v4 + 8), 2, v7, -1, 0);
        v7 = v8;
LABEL_7:
        CPSqliteStatementPerform();
        CPSqliteStatementReset();
        if (v7)
          free(v7);
      }
    }
  }
}

uint64_t configureNotesDatabase()
{
  CPRecordStoreCreateTablesForClass();
  CPSqliteConnectionPerformSQL();
  return _CreateBodiesTrigger();
}

BOOL _migrationVersionChecker(uint64_t a1, uint64_t a2, int a3)
{
  return a3 == 4 || (a3 & 0xFFFFFFFE) == 2;
}

uint64_t _migrationHandler(uint64_t a1, uint64_t a2, int a3)
{
  switch(a3)
  {
    case 4:
      goto LABEL_6;
    case 3:
      CPSqliteConnectionPerformSQL();
LABEL_6:
      _UpdateNoteTableWithCJK();
      goto LABEL_7;
    case 2:
      CPSqliteConnectionPerformSQL();
      CPRecordStoreCreateTablesForClass();
      CPSqliteConnectionPerformSQL();
      CPSqliteConnectionPerformSQL();
LABEL_7:
      _CreateBodiesTrigger();
      return 0;
  }
  return 1;
}

uint64_t _CreateBodiesTrigger()
{
  uint64_t result;

  result = CPSqliteConnectionStatementForSQL();
  if (result)
  {
    CPSqliteStatementPerform();
    return CPSqliteStatementReset();
  }
  return result;
}

uint64_t _UpdateNoteTableWithCJK()
{
  CPSqliteConnectionPerformSQL();
  CPRecordStoreCreateTablesForClass();
  CPSqliteConnectionPerformSQL();
  return CPSqliteConnectionPerformSQL();
}

uint64_t __getMCProfileConnectionClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[ExternalSequenceNumberToAttachmentNoteBodyToAttachmentMigrationPolicy unarchiveObjectWithExternalRepresentation:].cold.1(v0);
}

uint64_t __getACUILocalizationClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __91__ICHTMLSearchIndexerDataSource_allIndexableObjectIDsInReversedReindexingOrderWithContext___block_invoke_cold_1(v0);
}

void __LoadContent_cold_1()
{
  __assert_rtn("__LoadContent", "NoteStore.m", 165, "SQLITE_OK == err");
}

void __LoadContent_cold_2()
{
  __assert_rtn("__LoadContent", "NoteStore.m", 155, "SQLITE_OK == err");
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x1E0C98390](theData, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983B8](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x1E0C988F0](center, observer);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x1E0C98ED8](theString, appendedString);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F98](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99118](length, *(_QWORD *)&encoding);
}

CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C993F8](allocator, originalString, charactersToLeaveUnescaped, legalURLCharactersToBeEscaped, *(_QWORD *)&encoding);
}

uint64_t CPFileBuildDirectoriesToPath()
{
  return MEMORY[0x1E0CFA280]();
}

uint64_t CPRecordGetID()
{
  return MEMORY[0x1E0CFA3F0]();
}

uint64_t CPRecordGetProperty()
{
  return MEMORY[0x1E0CFA408]();
}

uint64_t CPRecordInitializeProperty()
{
  return MEMORY[0x1E0CFA430]();
}

uint64_t CPRecordStoreCopyAllInstancesOfClassWhere()
{
  return MEMORY[0x1E0CFA4A8]();
}

uint64_t CPRecordStoreCopyValueForProperty()
{
  return MEMORY[0x1E0CFA4E0]();
}

uint64_t CPRecordStoreCreateTablesForClass()
{
  return MEMORY[0x1E0CFA520]();
}

uint64_t CPRecordStoreCreateWithPath()
{
  return MEMORY[0x1E0CFA528]();
}

uint64_t CPRecordStoreGetDatabase()
{
  return MEMORY[0x1E0CFA5B8]();
}

uint64_t CPRecordStoreLogChanges()
{
  return MEMORY[0x1E0CFA610]();
}

uint64_t CPRecordStoreSetSetupHandler()
{
  return MEMORY[0x1E0CFA698]();
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1E0CFA6C0]();
}

uint64_t CPSqliteConnectionPerformSQL()
{
  return MEMORY[0x1E0CFA730]();
}

uint64_t CPSqliteConnectionStatementForSQL()
{
  return MEMORY[0x1E0CFA760]();
}

uint64_t CPSqliteDatabaseReleaseSqliteConnection()
{
  return MEMORY[0x1E0CFA7C8]();
}

uint64_t CPSqliteDatabaseSetMigrationHandlers()
{
  return MEMORY[0x1E0CFA828]();
}

uint64_t CPSqliteDatabaseSetVersion()
{
  return MEMORY[0x1E0CFA878]();
}

uint64_t CPSqliteStatementIntegerResult()
{
  return MEMORY[0x1E0CFA8D0]();
}

uint64_t CPSqliteStatementPerform()
{
  return MEMORY[0x1E0CFA8D8]();
}

uint64_t CPSqliteStatementReset()
{
  return MEMORY[0x1E0CFA8E8]();
}

uint64_t ICCheckedDynamicCast()
{
  return MEMORY[0x1E0D63F10]();
}

uint64_t ICCheckedProtocolCast()
{
  return MEMORY[0x1E0D63F18]();
}

uint64_t ICDynamicCast()
{
  return MEMORY[0x1E0D63F40]();
}

uint64_t ICUseCoreDataCoreSpotlightIntegration()
{
  return MEMORY[0x1E0D64158]();
}

uint64_t MFGetMappedAllocator()
{
  return MEMORY[0x1E0D45FA0]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return (IMP)MEMORY[0x1E0DE7AC0](cls, name);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D10](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1E0DE85A0](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D8](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_blob_bytes(sqlite3_blob *a1)
{
  return MEMORY[0x1E0DE8608](a1);
}

int sqlite3_blob_close(sqlite3_blob *a1)
{
  return MEMORY[0x1E0DE8610](a1);
}

int sqlite3_blob_open(sqlite3 *a1, const char *zDb, const char *zTable, const char *zColumn, sqlite3_int64 iRow, int flags, sqlite3_blob **ppBlob)
{
  return MEMORY[0x1E0DE8618](a1, zDb, zTable, zColumn, iRow, *(_QWORD *)&flags, ppBlob);
}

int sqlite3_blob_read(sqlite3_blob *a1, void *Z, int N, int iOffset)
{
  return MEMORY[0x1E0DE8620](a1, Z, *(_QWORD *)&N, *(_QWORD *)&iOffset);
}

