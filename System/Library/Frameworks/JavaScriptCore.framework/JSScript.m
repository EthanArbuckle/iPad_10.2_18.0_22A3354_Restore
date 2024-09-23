@implementation JSScript

+ (id)scriptOfType:(int64_t)a3 withSource:(id)a4 andSourceURL:(id)a5 andBytecodeCache:(id)a6 inVirtualMachine:(id)a7 error:(id *)a8
{
  JSScript *v13;
  WTF::AtomStringImpl *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  WTF::StringImpl *v21;
  WTF::StringImpl *m_ptr;
  int v23;
  void *v24;
  void *v25;
  unint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  WTF::AtomStringImpl *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  WTF::StringImpl *v50;

  if (!validateBytecodeCachePath((NSURL *)a6, (NSError **)a8))
    return 0;
  v13 = objc_alloc_init(JSScript);
  objc_storeWeak(&v13->m_virtualMachine.m_weakReference, a7);
  v13->m_type = a3;
  WTF::String::String(&v50, (CFStringRef)a4);
  v21 = v50;
  v50 = 0;
  m_ptr = (WTF::StringImpl *)v13->m_source.m_impl.m_ptr;
  v13->m_source.m_impl.m_ptr = (StringImpl *)v21;
  if (m_ptr)
  {
    v23 = *(_DWORD *)m_ptr - 2;
    if (*(_DWORD *)m_ptr == 2)
    {
      WTF::StringImpl::~StringImpl(m_ptr, v14, v15, v16, v17, v18, v19, v20);
      WTF::fastFree(v27, v28, v29, v30, v31, v32, v33, v34);
      m_ptr = v50;
      v50 = 0;
      if (!m_ptr)
        goto LABEL_5;
      v23 = *(_DWORD *)m_ptr - 2;
      if (*(_DWORD *)m_ptr == 2)
      {
        WTF::StringImpl::~StringImpl(m_ptr, v35, v36, v37, v38, v39, v40, v41);
        WTF::fastFree(v42, v43, v44, v45, v46, v47, v48, v49);
        goto LABEL_5;
      }
    }
    *(_DWORD *)m_ptr = v23;
  }
LABEL_5:
  if (a5)
    CFRetain(a5);
  v24 = v13->m_sourceURL.m_ptr;
  v13->m_sourceURL.m_ptr = a5;
  if (v24)
    CFRelease(v24);
  if (a6)
    CFRetain(a6);
  v25 = v13->m_cachePath.m_ptr;
  v13->m_cachePath.m_ptr = a6;
  if (v25)
    CFRelease(v25);
  -[JSScript readCache](v13, "readCache");
  return (id)(id)CFMakeCollectable(v13);
}

+ (id)scriptOfType:(int64_t)a3 memoryMappedFromASCIIFile:(id)a4 withSourceURL:(id)a5 andBytecodeCache:(id)a6 inVirtualMachine:(id)a7 error:(id *)a8
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  float v19;
  const __CFString *v20;
  CFURLRef v21;
  CFTypeRef v22;
  void *v23;
  const __CFURL *v24;
  WTF::AtomStringImpl *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  CFURLRef v33;
  CFURLRef v34;
  uint64_t v35;
  char v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  unsigned int v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  const __CFString *v44;
  JSScript *v45;
  WTF::AtomStringImpl *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  CFURLRef v54;
  int *v55;
  WTF::StringImpl *m_ptr;
  CFURLRef v57;
  void *v58;
  void *v59;
  const __CFString *v60;
  WTF::StringImpl *v61;
  WTF::StringImpl *v62;
  unint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  unint64_t v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  void *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  WTF::StringImpl *v88;
  char v89;
  WTF::StringImpl *v90[5];
  CFURLRef anURL;
  size_t v92;
  const __CFString *v93;
  CFStringRef v94[2];

  v94[1] = *(CFStringRef *)MEMORY[0x1E0C80C00];
  if (!validateBytecodeCachePath((NSURL *)a6, (NSError **)a8))
    return 0;
  WTF::URL::URL((WTF::URL *)v90, (CFURLRef)objc_msgSend(a4, "absoluteURL"));
  if ((WTF::URL::protocolIs((uint64_t *)v90, "file", 0x100000004) & 1) == 0)
  {
    v23 = (void *)MEMORY[0x1E0CB3940];
    WTF::URL::createCFURL((WTF::URL *)v90, v14, v15, v16, v17, v18, &anURL, v19);
    v24 = (const __CFURL *)objc_msgSend(v23, "stringWithFormat:", CFSTR("File path %@ is not a local file"), anURL);
    if (a8)
    {
      v94[0] = CFSTR("message");
      anURL = v24;
      *a8 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("JSScriptErrorDomain"), 1, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &anURL, v94, 1));
    }
    v22 = 0;
    goto LABEL_54;
  }
  v89 = 0;
  WTF::URL::createCFURL((WTF::URL *)v90, v14, v15, v16, v17, v18, &anURL, v19);
  if (anURL)
  {
    v20 = CFURLCopyFileSystemPath(anURL, kCFURLPOSIXPathStyle);
    WTF::String::String(&v88, v20);
    if (v20)
      CFRelease(v20);
    v21 = anURL;
    anURL = 0;
    if (v21)
      CFRelease(v21);
  }
  else
  {
    v88 = 0;
  }
  WTF::FileSystemImpl::MappedFileData::MappedFileData((uint64_t)&anURL, &v88, 0, &v89);
  if (!v89)
  {
    v43 = (void *)MEMORY[0x1E0CB3940];
    if (v88)
    {
      WTF::StringImpl::createCFString(v88, v94);
      v44 = (id)v94[0];
    }
    else
    {
      v44 = &stru_1E35BF3F0;
    }
    v60 = (const __CFString *)objc_msgSend(v43, "stringWithFormat:", CFSTR("File at path %@ could not be mapped."), v44);
    if (!a8)
      goto LABEL_48;
    goto LABEL_47;
  }
  v32 = 0;
  v33 = anURL;
  v34 = (CFURLRef)((char *)anURL + v92);
  if ((anURL & 7) != 0 && (_DWORD)v92)
  {
    v32 = 0;
    v35 = v92 - 1;
    v36 = (_BYTE)anURL + 1;
    do
    {
      v37 = *(unsigned __int8 *)v33;
      v33 = (CFURLRef)((char *)v33 + 1);
      v32 |= v37;
      if ((v36 & 7) == 0)
        break;
      v38 = v35--;
      ++v36;
    }
    while (v38);
  }
  while ((unint64_t)v33 < ((unint64_t)v34 & 0xFFFFFFFFFFFFFFF8))
  {
    v39 = *(_QWORD *)v33;
    v33 = (CFURLRef)((char *)v33 + 8);
    v32 |= v39;
  }
  while (v33 != v34)
  {
    v40 = *(unsigned __int8 *)v33;
    v33 = (CFURLRef)((char *)v33 + 1);
    v32 |= v40;
  }
  if ((v32 & 0x8080808080808080) == 0)
  {
    v45 = objc_alloc_init(JSScript);
    objc_storeWeak(&v45->m_virtualMachine.m_weakReference, a7);
    v45->m_type = a3;
    v53 = v92;
    if ((_DWORD)v92)
    {
      v54 = anURL;
      v55 = (int *)WTF::fastCompactMalloc((WTF *)0x20);
      *v55 = 2;
      v55[1] = v53;
      *((_QWORD *)v55 + 1) = v54;
      v55[4] = 4;
    }
    else
    {
      v55 = &WTF::StringImpl::s_emptyAtomString;
      WTF::StringImpl::s_emptyAtomString += 2;
    }
    m_ptr = (WTF::StringImpl *)v45->m_source.m_impl.m_ptr;
    v45->m_source.m_impl.m_ptr = (StringImpl *)v55;
    if (m_ptr)
    {
      if (*(_DWORD *)m_ptr == 2)
      {
        WTF::StringImpl::~StringImpl(m_ptr, v46, v47, v48, v49, v50, v51, v52);
        WTF::fastFree(v80, v81, v82, v83, v84, v85, v86, v87);
      }
      else
      {
        *(_DWORD *)m_ptr -= 2;
      }
    }
    v57 = anURL;
    anURL = 0;
    v45->m_mappedSource.m_fileData = v57;
    LODWORD(v57) = v92;
    LODWORD(v92) = 0;
    v45->m_mappedSource.m_fileSize = v57;
    if (a5)
      CFRetain(a5);
    v58 = v45->m_sourceURL.m_ptr;
    v45->m_sourceURL.m_ptr = a5;
    if (v58)
      CFRelease(v58);
    if (a6)
      CFRetain(a6);
    v59 = v45->m_cachePath.m_ptr;
    v45->m_cachePath.m_ptr = a6;
    if (v59)
      CFRelease(v59);
    -[JSScript readCache](v45, "readCache");
    v22 = (id)CFMakeCollectable(v45);
    goto LABEL_49;
  }
  v41 = (void *)MEMORY[0x1E0CB3940];
  if (v88)
  {
    WTF::StringImpl::createCFString(v88, v94);
    v42 = (id)v94[0];
  }
  else
  {
    v42 = &stru_1E35BF3F0;
  }
  v60 = (const __CFString *)objc_msgSend(v41, "stringWithFormat:", CFSTR("Not all characters in file at %@ are ASCII."), v42);
  if (a8)
  {
LABEL_47:
    v93 = CFSTR("message");
    v94[0] = v60;
    *a8 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("JSScriptErrorDomain"), 1, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v94, &v93, 1));
  }
LABEL_48:
  v22 = 0;
LABEL_49:
  if (anURL)
    munmap(anURL, v92);
  v61 = v88;
  v88 = 0;
  if (v61)
  {
    if (*(_DWORD *)v61 == 2)
    {
      WTF::StringImpl::~StringImpl(v61, v25, v26, v27, v28, v29, v30, v31);
      WTF::fastFree(v72, v73, v74, v75, v76, v77, v78, v79);
    }
    else
    {
      *(_DWORD *)v61 -= 2;
    }
  }
LABEL_54:
  v62 = v90[0];
  v90[0] = 0;
  if (v62)
  {
    if (*(_DWORD *)v62 == 2)
    {
      WTF::StringImpl::~StringImpl(v62, v25, v26, v27, v28, v29, v30, v31);
      WTF::fastFree(v64, v65, v66, v67, v68, v69, v70, v71);
    }
    else
    {
      *(_DWORD *)v62 -= 2;
    }
  }
  return (id)v22;
}

- (void)readCache
{
  void *m_ptr;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  _DWORD *v12;
  unint64_t st_size;
  char *v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  WTF *v29;
  const char *v30;
  WTF::StringImpl *v31;
  unint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  WTF *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  WTF *v59;
  uint64_t v60;
  int v61;
  unsigned int v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _BOOL4 isCachedBytecodeStillValid;
  WTF *v71;
  CachedBytecode *v72;
  WTF::StringImpl *v73;
  WTF *v74;
  _DWORD *v75;
  unint64_t v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  WTF *v84;
  WTF *v85;
  uint64_t v86;
  WTF::StringImpl *v87;
  int v88;
  int v89;
  int v90;
  _QWORD v91[3];
  WTF::StringImpl *v92;
  stat v93;
  __int128 v94;
  int v95;
  _QWORD md[2];
  int v97;
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  m_ptr = self->m_cachePath.m_ptr;
  if (!m_ptr)
    return;
  WTF::String::String(&v92, (CFStringRef)objc_msgSend(m_ptr, "path"));
  WTF::FileSystemImpl::fileSystemRepresentation(&v92, (uint64_t *)&v93.st_dev);
  if (*(_QWORD *)&v93.st_dev)
  {
    v11 = open((const char *)(*(_QWORD *)&v93.st_dev + 16), 0, 438);
    v12 = *(_DWORD **)&v93.st_dev;
    *(_QWORD *)&v93.st_dev = 0;
    if (v12)
    {
      if (*v12 == 1)
        WTF::fastFree((unint64_t)v12, v4, v5, v6, v7, v8, v9, v10);
      else
        --*v12;
    }
    if (v11 != -1)
    {
      flock(v11, 6);
      if (fstat(v11, &v93))
        goto LABEL_39;
      st_size = v93.st_size;
      if (HIDWORD(v93.st_size))
        goto LABEL_39;
      if (LODWORD(v93.st_size))
      {
        v14 = (char *)mmap(0, v93.st_size, 1, 2, v11, 0);
        if (v14 == (char *)-1)
          goto LABEL_39;
        v15 = v14;
        if (st_size > 0x13)
        {
          CC_SHA1_Init((CC_SHA1_CTX *)&v93);
          if (st_size < (st_size - 20)
            || (v16 = (st_size - 20),
                CC_SHA1_Update((CC_SHA1_CTX *)&v93, v15, st_size - 20),
                CC_SHA1_Final((unsigned __int8 *)md, (CC_SHA1_CTX *)&v93),
                st_size - v16 <= 0x13))
          {
            __break(1u);
          }
          v94 = *(_OWORD *)&v15[v16];
          v17 = *(unsigned int *)&v15[v16 + 16];
          v95 = *(_DWORD *)&v15[v16 + 16];
          if (md[0] != (_QWORD)v94 || md[1] != *((_QWORD *)&v94 + 1) || v97 != v17)
          {
            WTF::FileSystemImpl::fileSystemRepresentation(&v92, (uint64_t *)&v85);
            if (v85)
              v20 = (char *)v85 + 16;
            else
              v20 = 0;
            v28 = unlink(v20);
            v29 = v85;
            v85 = 0;
            if (!v29)
              goto LABEL_35;
            goto LABEL_32;
          }
          v40 = WTF::fastMalloc((WTF *)0x40);
          v85 = (WTF *)v15;
          LODWORD(v86) = st_size;
          LODWORD(v87) = 0;
          v41 = 1;
          *(_DWORD *)v40 = 1;
          v42 = std::__variant_detail::__visitation::__base::__dispatcher<0ul>::__dispatch[abi:sn180100]<std::__variant_detail::__visitation::__variant::__value_visitor<WTF::Visitor<JSC::CachePayload::size(void)::$_0,JSC::CachePayload::size(void)::$_1>> &&,std::__variant_detail::__base<(std::__variant_detail::_Trait)1,WTF::FileSystemImpl::MappedFileData,std::pair<WTF::MallocPtr<unsigned char,WTF::FastMalloc>,unsigned long>> const&>((uint64_t)v91, (uint64_t)&v85);
          *(_QWORD *)(v40 + 16) = 0;
          *(_QWORD *)(v40 + 8) = v42;
          *(_DWORD *)(v40 + 24) = 0;
          *(_DWORD *)(v40 + 32) = 0;
          v91[0] = v40 + 16;
          _ZNSt3__116__variant_detail12__visitation6__base12__dispatcherIJLm0ELm0EEE10__dispatchB8sn180100IOZNS0_12__assignmentINS0_8__traitsIJN3WTF14FileSystemImpl14MappedFileDataENS_4pairINS8_9MallocPtrIhNS8_10FastMallocEEEmEEEEEE16__generic_assignB8sn180100INS0_17__move_assignmentISG_LNS0_6_TraitE1EEEEEvOT_EUlRSM_OT0_E_JRNS0_6__baseILSK_1EJSA_SF_EEEOSU_EEEDcSM_DpT0_((uint64_t)v91, v40 + 16, (uint64_t *)&v85);
          if ((_DWORD)v87 != -1)
          {
            if ((_DWORD)v87 == 1)
            {
              v50 = v85;
              v85 = 0;
              WTF::fastFree((unint64_t)v50, v43, v44, v45, v46, v47, v48, v49);
              WTF::fastFree(0, v51, v52, v53, v54, v55, v56, v57);
              v86 = 0;
              v41 = (int)v87;
              *(_QWORD *)(v40 + 48) = 0;
              *(_QWORD *)(v40 + 56) = 0;
              *(_QWORD *)(v40 + 40) = 0;
              if (v41 == -1)
                goto LABEL_52;
              goto LABEL_51;
            }
            ((void (*)(_QWORD *, WTF **))__const__ZNSt3__116__variant_detail12__visitation6__base11__visit_altB8sn180100IZNS0_6__dtorINS0_8__traitsIJN3WTF14FileSystemImpl14MappedFileDataENS_4pairINS6_9MallocPtrIhNS6_10FastMallocEEEmEEEEELNS0_6_TraitE1EE9__destroyB8sn180100EvEUlRT_E_JRSG_EEEDcOSH_DpOT0____fmatrix[v87])(v91, &v85);
          }
          v85 = 0;
          v86 = 0;
          LODWORD(v87) = 1;
          *(_QWORD *)(v40 + 48) = 0;
          *(_QWORD *)(v40 + 56) = 0;
          *(_QWORD *)(v40 + 40) = 0;
LABEL_51:
          ((void (*)(_QWORD *, WTF **))__const__ZNSt3__116__variant_detail12__visitation6__base11__visit_altB8sn180100IZNS0_6__dtorINS0_8__traitsIJN3WTF14FileSystemImpl14MappedFileDataENS_4pairINS6_9MallocPtrIhNS6_10FastMallocEEEmEEEEELNS0_6_TraitE1EE9__destroyB8sn180100EvEUlRT_E_JRSG_EEEDcOSH_DpOT0____fmatrix[v41])(v91, &v85);
LABEL_52:
          v58 = objc_msgSend(objc_loadWeak(&self->m_virtualMachine.m_weakReference), "JSContextGroupRef");
          -[JSScript sourceCode](self, "sourceCode");
          v59 = (WTF *)v91[0];
          v60 = v91[1];
          if (self->m_type)
            v61 = 39;
          else
            v61 = 2;
          if (v91[0])
            ++*(_DWORD *)(v91[0] + 8);
          v85 = v59;
          v86 = v60;
          v87 = 0;
          v88 = v61;
          v89 = -1;
          v90 = (*(uint64_t (**)(WTF *))(*(_QWORD *)v59 + 16))(v59) ^ v61;
          ++*(_DWORD *)v40;
          v84 = (WTF *)v40;
          if (self->m_type)
            v62 = 3;
          else
            v62 = 1;
          isCachedBytecodeStillValid = JSC::isCachedBytecodeStillValid(v58, (uint64_t *)&v84, (uint64_t)&v85, v62);
          v71 = v84;
          v84 = 0;
          if (v71)
            WTF::RefCounted<JSC::CachedBytecode>::deref(v71, v63, v64, v65, v66, v67, v68, v69);
          if (isCachedBytecodeStillValid)
          {
            v72 = self->m_cachedBytecode.m_ptr;
            self->m_cachedBytecode.m_ptr = (CachedBytecode *)v40;
            if (v72)
              WTF::RefCounted<JSC::CachedBytecode>::deref((WTF *)v72, v63, v64, v65, v66, v67, v68, v69);
            v40 = 0;
          }
          else
          {
            ftruncate(v11, 0);
          }
          v73 = v87;
          v87 = 0;
          if (v73)
          {
            if (*(_DWORD *)v73 == 2)
            {
              WTF::StringImpl::~StringImpl(v73, (WTF::AtomStringImpl *)v63, v64, v65, v66, v67, v68, v69);
              WTF::fastFree(v76, v77, v78, v79, v80, v81, v82, v83);
            }
            else
            {
              *(_DWORD *)v73 -= 2;
            }
          }
          v74 = v85;
          v85 = 0;
          if (v74)
          {
            if (*((_DWORD *)v74 + 2) == 1)
              (*(void (**)(WTF *))(*(_QWORD *)v74 + 8))(v74);
            else
              --*((_DWORD *)v74 + 2);
          }
          v75 = (_DWORD *)v91[0];
          v91[0] = 0;
          if (v75)
          {
            if (v75[2] == 1)
            {
              (*(void (**)(_DWORD *))(*(_QWORD *)v75 + 8))(v75);
              if (!v40)
                goto LABEL_39;
              goto LABEL_77;
            }
            --v75[2];
          }
          if (v40)
LABEL_77:
            WTF::RefCounted<JSC::CachedBytecode>::deref((WTF *)v40, v63, v64, v65, v66, v67, v68, v69);
LABEL_39:
          flock(v11, 8);
          close(v11);
          goto LABEL_40;
        }
      }
      else
      {
        v15 = 0;
      }
      WTF::FileSystemImpl::fileSystemRepresentation(&v92, (uint64_t *)&v93.st_dev);
      if (*(_QWORD *)&v93.st_dev)
        v30 = (const char *)(*(_QWORD *)&v93.st_dev + 16);
      else
        v30 = 0;
      v28 = unlink(v30);
      v29 = *(WTF **)&v93.st_dev;
      *(_QWORD *)&v93.st_dev = 0;
      if (!v29)
        goto LABEL_35;
LABEL_32:
      if (*(_DWORD *)v29 == 1)
        WTF::fastFree((unint64_t)v29, v21, v22, v23, v24, v25, v26, v27);
      else
        --*(_DWORD *)v29;
LABEL_35:
      if (v28)
        __error();
      if (v15)
        munmap(v15, st_size);
      goto LABEL_39;
    }
  }
LABEL_40:
  v31 = v92;
  v92 = 0;
  if (v31)
  {
    if (*(_DWORD *)v31 == 2)
    {
      WTF::StringImpl::~StringImpl(v31, (WTF::AtomStringImpl *)v4, v5, v6, v7, v8, v9, v10);
      WTF::fastFree(v32, v33, v34, v35, v36, v37, v38, v39);
    }
    else
    {
      *(_DWORD *)v31 -= 2;
    }
  }
}

- (BOOL)cacheBytecodeWithError:(id *)a3
{
  WTF::StringImpl *v4;
  id v5;
  WTF::AtomStringImpl *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  WTF::StringImpl *v13;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  WTF::StringImpl *v23;
  const __CFString *v24;
  id v25[2];

  v25[1] = *(id *)MEMORY[0x1E0C80C00];
  v23 = 0;
  -[JSScript writeCache:](self, "writeCache:", &v23);
  v4 = v23;
  if (v23)
  {
    WTF::StringImpl::createCFString(v23, (CFStringRef *)v25);
    v5 = v25[0];
    if (a3)
    {
      v24 = CFSTR("message");
      v25[0] = v5;
      *a3 = (id)objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("JSScriptErrorDomain"), 1, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1));
    }
    v13 = v23;
    v23 = 0;
    if (v13)
    {
      if (*(_DWORD *)v13 == 2)
      {
        WTF::StringImpl::~StringImpl(v13, v6, v7, v8, v9, v10, v11, v12);
        WTF::fastFree(v15, v16, v17, v18, v19, v20, v21, v22);
      }
      else
      {
        *(_DWORD *)v13 -= 2;
      }
    }
  }
  return v4 == 0;
}

- (BOOL)isUsingBytecodeCache
{
  CachedBytecode *m_ptr;
  uint64_t v3;
  JSScript *v5;
  SEL v6;
  char v7;
  char *v8;

  m_ptr = self->m_cachedBytecode.m_ptr;
  v3 = *((unsigned int *)m_ptr + 8);
  if ((_DWORD)v3 == -1)
  {
    v5 = (JSScript *)std::__throw_bad_variant_access[abi:sn180100]();
    return -[JSScript sourceURL](v5, v6);
  }
  else
  {
    v8 = &v7;
    return ((uint64_t (*)(char **, char *))__const__ZNSt3__116__variant_detail12__visitation6__base11__visit_altB8sn180100INS1_9__variant15__value_visitorIN3WTF7VisitorIZNK3JSC12CachePayload4sizeEvE3__0JZNKS9_4sizeEvE3__1EEEEEJRKNS0_6__implIJNS6_14FileSystemImpl14MappedFileDataENS_4pairINS6_9MallocPtrIhNS6_10FastMallocEEEmEEEEEEEEDcOT_DpOT0____fmatrix[v3])(&v8, (char *)m_ptr + 16) != 0;
  }
}

- (id)sourceURL
{
  return self->m_sourceURL.m_ptr;
}

- (int64_t)type
{
  return self->m_type;
}

- (void).cxx_destruct
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CachedBytecode *m_ptr;
  void *v10;
  void *v11;
  StringImpl *v12;
  void *m_fileData;
  unint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  m_ptr = self->m_cachedBytecode.m_ptr;
  self->m_cachedBytecode.m_ptr = 0;
  if (m_ptr)
    WTF::RefCounted<JSC::CachedBytecode>::deref((WTF *)m_ptr, (void *)a2, v2, v3, v4, v5, v6, v7);
  v10 = self->m_cachePath.m_ptr;
  self->m_cachePath.m_ptr = 0;
  if (v10)
    CFRelease(v10);
  v11 = self->m_sourceURL.m_ptr;
  self->m_sourceURL.m_ptr = 0;
  if (v11)
    CFRelease(v11);
  v12 = self->m_source.m_impl.m_ptr;
  self->m_source.m_impl.m_ptr = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2)
    {
      WTF::StringImpl::~StringImpl((WTF::StringImpl *)v12, (WTF::AtomStringImpl *)a2, v2, v3, v4, v5, v6, v7);
      WTF::fastFree(v14, v15, v16, v17, v18, v19, v20, v21);
    }
    else
    {
      *(_DWORD *)v12 -= 2;
    }
  }
  m_fileData = self->m_mappedSource.m_fileData;
  if (m_fileData)
    munmap(m_fileData, self->m_mappedSource.m_fileSize);
  objc_destroyWeak(&self->m_virtualMachine.m_weakReference);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 3) = 0;
  *((_DWORD *)self + 8) = 0;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  return self;
}

- (JSScript)init
{
  JSScript *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  WTF *m_ptr;
  CachedBytecode *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)JSScript;
  v2 = -[JSScript init](&v13, sel_init);
  if (v2)
  {
    JSC::CachedBytecode::create((JSC::CachedBytecode *)&v12);
    m_ptr = (WTF *)v2->m_cachedBytecode.m_ptr;
    v2->m_cachedBytecode.m_ptr = v12;
    if (m_ptr)
      WTF::RefCounted<JSC::CachedBytecode>::deref(m_ptr, v3, v4, v5, v6, v7, v8, v9);
  }
  return v2;
}

- (unsigned)hash
{
  StringImpl *m_ptr;
  unsigned int v3;

  m_ptr = self->m_source.m_impl.m_ptr;
  if (m_ptr)
  {
    v3 = *((_DWORD *)m_ptr + 4);
    if (v3 < 0x100)
      LODWORD(m_ptr) = WTF::StringImpl::hashSlowCase((WTF::StringImpl *)m_ptr);
    else
      LODWORD(m_ptr) = v3 >> 8;
  }
  return m_ptr;
}

- (const)source
{
  return &self->m_source;
}

- (RefPtr<JSC::CachedBytecode,)cachedBytecode
{
  CachedBytecode **v2;
  CachedBytecode *m_ptr;

  m_ptr = self->m_cachedBytecode.m_ptr;
  if (m_ptr)
    ++*(_DWORD *)m_ptr;
  *v2 = m_ptr;
  return (RefPtr<JSC::CachedBytecode, WTF::RawPtrTraits<JSC::CachedBytecode>, WTF::DefaultRefDerefTraits<JSC::CachedBytecode>>)self;
}

- (SourceCode)sourceCode
{
  JSC::VM *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  WTF::AtomStringImpl *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  WTF::StringImpl *v24;
  BOOL v25;
  WTF::StringImpl *v26;
  uint64_t v27;
  SourceProvider *v28;
  WTF::StringImpl *v29;
  WTF::AtomStringImpl *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  WTF::StringImpl *v37;
  WTF::StringImpl *v38;
  SourceCode *result;
  unint64_t v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  WTF::StringImpl *v72[2];
  __int128 v73;
  uint64_t v74;
  WTF::StringImpl *v75;
  __int128 v76;
  __int128 v77;
  WTF::StringImpl *v78;
  unsigned int *v79;

  v5 = (JSC::VM *)objc_msgSend(objc_loadWeak(&self->m_virtualMachine.m_weakReference), "JSContextGroupRef");
  JSC::JSLockHolder::JSLockHolder((JSC::JSLockHolder *)&v79, v5, v6, v7, v8, v9, v10, v11, v12);
  WTF::String::String(&v78, (CFStringRef)objc_msgSend(-[JSScript sourceURL](self, "sourceURL"), "absoluteString"));
  v74 = 0;
  *(_OWORD *)v72 = 0u;
  v73 = 0u;
  WTF::URL::URL((uint64_t)&v75, (uint64_t)v72, &v78, 0, v13, v14, v15, v16);
  v24 = v72[0];
  v72[0] = 0;
  if (v24)
  {
    if (*(_DWORD *)v24 == 2)
    {
      WTF::StringImpl::~StringImpl(v24, v17, v18, v19, v20, v21, v22, v23);
      WTF::fastFree(v40, v41, v42, v43, v44, v45, v46, v47);
    }
    else
    {
      *(_DWORD *)v24 -= 2;
    }
  }
  v25 = self->m_type == 1;
  v26 = v75;
  if (v75)
    *(_DWORD *)v75 += 2;
  *(_OWORD *)v72 = v76;
  v73 = v77;
  v27 = WTF::fastMalloc((WTF *)0x80);
  v28 = (SourceProvider *)v27;
  *(_DWORD *)(v27 + 8) = 1;
  *(_QWORD *)v27 = off_1E35964B0;
  *(_BYTE *)(v27 + 12) = v25;
  if (v26)
    *(_DWORD *)v26 += 2;
  *(_QWORD *)(v27 + 16) = v26;
  *(_OWORD *)(v27 + 24) = *(_OWORD *)v72;
  *(_OWORD *)(v27 + 40) = v73;
  v29 = v78;
  v78 = 0;
  *(_QWORD *)(v27 + 56) = 0;
  *(_QWORD *)(v27 + 64) = v29;
  *(_OWORD *)(v27 + 72) = 0u;
  *(_OWORD *)(v27 + 88) = 0u;
  *(_OWORD *)(v27 + 101) = 0u;
  *(_QWORD *)v27 = off_1E357B500;
  *(_QWORD *)(v27 + 120) = self;
  CFRetain(self);
  retstr->var0.var0 = v28;
  retstr->var1 = 0;
  (*(void (**)(SourceProvider *))(*(_QWORD *)v28 + 24))(v28);
  *(_QWORD *)&retstr->var3.var0 = 0;
  retstr->var2 = (int)v30;
  if (v26)
  {
    if (*(_DWORD *)v26 == 2)
    {
      WTF::StringImpl::~StringImpl(v26, v30, v31, v32, v33, v34, v35, v36);
      WTF::fastFree(v48, v49, v50, v51, v52, v53, v54, v55);
    }
    else
    {
      *(_DWORD *)v26 -= 2;
    }
  }
  v37 = v75;
  v75 = 0;
  if (v37)
  {
    if (*(_DWORD *)v37 == 2)
    {
      WTF::StringImpl::~StringImpl(v37, v30, v31, v32, v33, v34, v35, v36);
      WTF::fastFree(v56, v57, v58, v59, v60, v61, v62, v63);
    }
    else
    {
      *(_DWORD *)v37 -= 2;
    }
  }
  v38 = v78;
  v78 = 0;
  if (v38)
  {
    if (*(_DWORD *)v38 == 2)
    {
      WTF::StringImpl::~StringImpl(v38, v30, v31, v32, v33, v34, v35, v36);
      WTF::fastFree(v64, v65, v66, v67, v68, v69, v70, v71);
    }
    else
    {
      *(_DWORD *)v38 -= 2;
    }
  }
  JSC::JSLockHolder::~JSLockHolder(&v79, v30, v31, v32, v33, v34, v35, v36);
  return result;
}

- (void)jsSourceCode
{
  JSC::VM **v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _DWORD *v24;
  uint64_t v26[3];
  unsigned int *v27;

  v3 = (JSC::VM **)objc_msgSend(objc_loadWeak(&self->m_virtualMachine.m_weakReference), "JSContextGroupRef");
  JSC::JSLockHolder::JSLockHolder((JSC::JSLockHolder *)&v27, (JSC::VM *)v3, v4, v5, v6, v7, v8, v9, v10);
  if (self)
    -[JSScript sourceCode](self, "sourceCode");
  else
    memset(v26, 0, sizeof(v26));
  v23 = (void *)JSC::JSSourceCode::create((uint64_t)v3, v3[5208], v26, v11, v12, v13, v14, v15);
  v24 = (_DWORD *)v26[0];
  v26[0] = 0;
  if (v24)
  {
    if (v24[2] == 1)
      (*(void (**)(_DWORD *))(*(_QWORD *)v24 + 8))(v24);
    else
      --v24[2];
  }
  JSC::JSLockHolder::~JSLockHolder(&v27, v16, v17, v18, v19, v20, v21, v22);
  return v23;
}

- (BOOL)writeCache:(void *)a3
{
  uint64_t v5;
  WTF::AtomStringImpl *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  void *m_ptr;
  void *v17;
  const std::__fs::filesystem::path *v18;
  const std::__fs::filesystem::path *v19;
  int v20;
  int v21;
  const SourceCode *v22;
  JSC *v23;
  JSC::BytecodeCacheError *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  int64_t m_type;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  WTF::StringImpl *v37;
  char v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  WTF::AtomStringImpl *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  SourceProvider *var0;
  WTF::StringImpl *v50;
  unint64_t v51;
  int v52;
  unint64_t v53;
  uint64_t v54;
  WTF::AtomStringImpl *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  SourceProvider *v62;
  WTF::StringImpl *v63;
  CachedBytecode *v64;
  CachedBytecode *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  WTF *v73;
  int v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  CachedBytecode *v82;
  WTF::AtomStringImpl *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  WTF::StringImpl *v90;
  WTF::StringImpl *v91;
  WTF::StringImpl *v92;
  CachedBytecode *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const void *v97;
  CC_LONG v98;
  std::error_code *v99;
  SourceProvider *v100;
  unint64_t v102;
  void *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  SourceProvider *v110;
  unint64_t v111;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  SourceProvider *v119;
  unint64_t v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  WTF::StringImpl *v128;
  unint64_t v129;
  void *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  unint64_t v137;
  void *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  unint64_t v145;
  void *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  unint64_t v153;
  void *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  CC_SHA1_CTX c;
  WTF::StringImpl *v162;
  SourceCode v163;
  char v164;
  char *v165;
  unsigned __int8 md[8];
  const char *v167;
  __int128 v168;
  __int128 v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  int v175;
  __int16 v176;
  int v177;
  uint64_t v178;

  v178 = *MEMORY[0x1E0C80C00];
  if (-[JSScript isUsingBytecodeCache](self, "isUsingBytecodeCache"))
  {
    v5 = WTF::fastCompactMalloc((WTF *)0x20);
    v13 = v5;
    v14 = 0x3D00000002;
    v15 = "Cache for JSScript is already non-empty. Can not override it.";
    goto LABEL_10;
  }
  m_ptr = self->m_cachePath.m_ptr;
  if (m_ptr)
  {
    v17 = (void *)objc_msgSend(m_ptr, "path");
    v18 = (const std::__fs::filesystem::path *)objc_msgSend(v17, "UTF8String");
    v19 = (const std::__fs::filesystem::path *)objc_msgSend((id)objc_msgSend(v17, "stringByAppendingString:", CFSTR(".tmp")), "UTF8String");
    v20 = open((const char *)v18, 549, 384);
    if (v20 == -1)
    {
      v39 = *__error();
      v40 = WTF::fastMalloc((WTF *)0x411);
      *(_DWORD *)v40 = 1;
      *(_QWORD *)(v40 + 8) = 1024;
      *(_BYTE *)(v40 + 1040) = 0;
      if (strerror_r(v39, (char *)(v40 + 16), 0x400uLL))
        snprintf((char *)(v40 + 16), 0x400uLL, "%s %d", "Unknown error", v39);
      v41 = *(_QWORD *)(v40 + 8);
      v167 = "Could not open or lock the bytecode cache file. It's likely another VM or process is already using it. Error: ";
      *(_QWORD *)&v168 = 111;
      *(_QWORD *)&c.h0 = v40 + 16;
      *(_QWORD *)&c.h2 = v41;
      WTF::tryMakeString<WTF::ASCIILiteral,std::span<unsigned char const,18446744073709551615ul>>(&v167, (uint64_t)&c, (int **)&v163);
      var0 = v163.var0.var0;
      if (v163.var0.var0)
      {
        v163.var0.var0 = 0;
        v50 = *(WTF::StringImpl **)a3;
        *(_QWORD *)a3 = var0;
        if (v50)
        {
          if (*(_DWORD *)v50 == 2)
          {
            WTF::StringImpl::~StringImpl(v50, v42, v43, v44, v45, v46, v47, v48);
            WTF::fastFree(v102, v103, v104, v105, v106, v107, v108, v109);
            v110 = v163.var0.var0;
            v163.var0.var0 = 0;
            if (v110)
            {
              if (*(_DWORD *)v110 == 2)
              {
                WTF::StringImpl::~StringImpl((WTF::StringImpl *)v110, v42, v43, v44, v45, v46, v47, v48);
                WTF::fastFree(v137, v138, v139, v140, v141, v142, v143, v144);
              }
              else
              {
                *(_DWORD *)v110 -= 2;
              }
            }
          }
          else
          {
            *(_DWORD *)v50 -= 2;
            v163.var0.var0 = 0;
          }
        }
        if (*(_DWORD *)v40 == 1)
        {
          v51 = v40;
          goto LABEL_22;
        }
        --*(_DWORD *)v40;
        return 0;
      }
      goto LABEL_82;
    }
    v21 = v20;
    v22 = (const SourceCode *)open((const char *)v19, 550, 384);
    if ((_DWORD)v22 == -1)
    {
      v52 = *__error();
      v53 = WTF::fastMalloc((WTF *)0x411);
      *(_DWORD *)v53 = 1;
      *(_QWORD *)(v53 + 8) = 1024;
      *(_BYTE *)(v53 + 1040) = 0;
      if (strerror_r(v52, (char *)(v53 + 16), 0x400uLL))
        snprintf((char *)(v53 + 16), 0x400uLL, "%s %d", "Unknown error", v52);
      v54 = *(_QWORD *)(v53 + 8);
      v167 = "Could not open or lock the bytecode cache temp file. Error: ";
      *(_QWORD *)&v168 = 61;
      *(_QWORD *)&c.h0 = v53 + 16;
      *(_QWORD *)&c.h2 = v54;
      WTF::tryMakeString<WTF::ASCIILiteral,std::span<unsigned char const,18446744073709551615ul>>(&v167, (uint64_t)&c, (int **)&v163);
      v62 = v163.var0.var0;
      if (!v163.var0.var0)
      {
        __break(0xC471u);
        JUMPOUT(0x197F01918);
      }
      v163.var0.var0 = 0;
      v63 = *(WTF::StringImpl **)a3;
      *(_QWORD *)a3 = v62;
      if (v63)
      {
        if (*(_DWORD *)v63 == 2)
        {
          WTF::StringImpl::~StringImpl(v63, v55, v56, v57, v58, v59, v60, v61);
          WTF::fastFree(v111, v112, v113, v114, v115, v116, v117, v118);
          v119 = v163.var0.var0;
          v163.var0.var0 = 0;
          if (v119)
          {
            if (*(_DWORD *)v119 == 2)
            {
              WTF::StringImpl::~StringImpl((WTF::StringImpl *)v119, v55, v56, v57, v58, v59, v60, v61);
              WTF::fastFree(v145, v146, v147, v148, v149, v150, v151, v152);
            }
            else
            {
              *(_DWORD *)v119 -= 2;
            }
          }
        }
        else
        {
          *(_DWORD *)v63 -= 2;
          v163.var0.var0 = 0;
        }
      }
      if (*(_DWORD *)v53 == 1)
        WTF::fastFree(v53, v55, v56, v57, v58, v59, v60, v61);
      else
        --*(_DWORD *)v53;
      v38 = 0;
      goto LABEL_61;
    }
    LODWORD(v167) = 0x100000;
    v168 = 0u;
    v169 = 0u;
    v170 = 0;
    v171 = -1;
    v172 = -1;
    v173 = -1;
    v174 = 0;
    v175 = -1;
    v176 = 0;
    v177 = 0;
    -[JSScript sourceCode](self, "sourceCode");
    v23 = (JSC *)objc_msgSend(objc_loadWeak(&self->m_virtualMachine.m_weakReference), "JSContextGroupRef");
    m_type = self->m_type;
    if (m_type)
    {
      if (m_type != 1)
        goto LABEL_37;
      JSC::generateModuleBytecode(v23, &v163, v22, v24, (uint64_t)&v167, v25, v26, v27, (uint64_t *)&c, v28);
    }
    else
    {
      JSC::generateProgramBytecode(v23, &v163, v22, v24, (uint64_t)&v167, v25, v26, v27, (uint64_t *)&c, v28);
    }
    v64 = *(CachedBytecode **)&c.h0;
    *(_QWORD *)&c.h0 = 0;
    v65 = self->m_cachedBytecode.m_ptr;
    self->m_cachedBytecode.m_ptr = v64;
    if (v65)
    {
      WTF::RefCounted<JSC::CachedBytecode>::deref((WTF *)v65, v30, v31, v32, v33, v34, v35, v36);
      v73 = *(WTF **)&c.h0;
      *(_QWORD *)&c.h0 = 0;
      if (v73)
        WTF::RefCounted<JSC::CachedBytecode>::deref(v73, v66, v67, v68, v69, v70, v71, v72);
    }
LABEL_37:
    if (v177 != -1)
    {
      *(_QWORD *)&c.h0 = md;
      v74 = ((uint64_t (*)(CC_SHA1_CTX *, const char **))__const__ZNSt3__116__variant_detail12__visitation6__base11__visit_altB8sn180100INS1_9__variant15__value_visitorIN3WTF7VisitorIZNK3JSC18BytecodeCacheError7isValidEvE3__0JEEEEEJRKNS0_6__implIJNS8_11ParserErrorENS9_13StandardErrorENS9_10WriteErrorEEEEEEEDcOT_DpOT0____fmatrix[v177])(&c, &v167);
      if (v74)
      {
        JSC::CachedBytecode::create((JSC::CachedBytecode *)&c);
        v82 = self->m_cachedBytecode.m_ptr;
        self->m_cachedBytecode.m_ptr = *(CachedBytecode **)&c.h0;
        if (v82)
          WTF::RefCounted<JSC::CachedBytecode>::deref((WTF *)v82, v75, v76, v77, v78, v79, v80, v81);
        ftruncate(v21, 0);
        if (v177 != -1)
        {
          *(_QWORD *)&c.h0 = &v165;
          ((void (*)(WTF::StringImpl **__return_ptr, CC_SHA1_CTX *, const char **))__const__ZNSt3__116__variant_detail12__visitation6__base11__visit_altB8sn180100INS1_9__variant15__value_visitorIN3WTF7VisitorIZNK3JSC18BytecodeCacheError7messageEvE3__0JEEEEEJRKNS0_6__implIJNS8_11ParserErrorENS9_13StandardErrorENS9_10WriteErrorEEEEEEEDcOT_DpOT0____fmatrix[v177])(&v162, &c, &v167);
          *(_QWORD *)&c.h0 = "Unable to generate bytecode for this JSScript because: ";
          *(_QWORD *)&c.h2 = 56;
          WTF::tryMakeString<WTF::ASCIILiteral,WTF::String>((uint64_t *)&c, (uint64_t *)&v162, (int **)md);
          v90 = *(WTF::StringImpl **)md;
          if (*(_QWORD *)md)
          {
            *(_QWORD *)md = 0;
            v91 = *(WTF::StringImpl **)a3;
            *(_QWORD *)a3 = v90;
            if (v91)
            {
              if (*(_DWORD *)v91 == 2)
              {
                WTF::StringImpl::~StringImpl(v91, v83, v84, v85, v86, v87, v88, v89);
                WTF::fastFree(v120, v121, v122, v123, v124, v125, v126, v127);
                v128 = *(WTF::StringImpl **)md;
                *(_QWORD *)md = 0;
                if (v128)
                {
                  if (*(_DWORD *)v128 == 2)
                  {
                    WTF::StringImpl::~StringImpl(v128, v83, v84, v85, v86, v87, v88, v89);
                    WTF::fastFree(v153, v154, v155, v156, v157, v158, v159, v160);
                  }
                  else
                  {
                    *(_DWORD *)v128 -= 2;
                  }
                }
              }
              else
              {
                *(_DWORD *)v91 -= 2;
                *(_QWORD *)md = 0;
              }
            }
            v92 = v162;
            v162 = 0;
            if (v92)
            {
              if (*(_DWORD *)v92 == 2)
              {
                WTF::StringImpl::~StringImpl(v92, v83, v84, v85, v86, v87, v88, v89);
                WTF::fastFree(v129, v130, v131, v132, v133, v134, v135, v136);
              }
              else
              {
                *(_DWORD *)v92 -= 2;
              }
            }
            goto LABEL_55;
          }
LABEL_82:
          __break(0xC471u);
          JUMPOUT(0x197F01910);
        }
      }
      else
      {
        CC_SHA1_Init(&c);
        v93 = self->m_cachedBytecode.m_ptr;
        v94 = *((unsigned int *)v93 + 8);
        if ((_DWORD)v94 != -1)
        {
          v165 = &v164;
          v95 = ((uint64_t (*)(char **, char *))__const__ZNSt3__116__variant_detail12__visitation6__base11__visit_altB8sn180100INS1_9__variant15__value_visitorIN3WTF7VisitorIZNK3JSC12CachePayload4dataEvE3__0JZNKS9_4dataEvE3__1EEEEEJRKNS0_6__implIJNS6_14FileSystemImpl14MappedFileDataENS_4pairINS6_9MallocPtrIhNS6_10FastMallocEEEmEEEEEEEEDcOT_DpOT0____fmatrix[v94])(&v165, (char *)v93 + 16);
          v96 = *((unsigned int *)v93 + 8);
          if ((_DWORD)v96 != -1)
          {
            v97 = (const void *)v95;
            v165 = &v164;
            v98 = ((uint64_t (*)(char **, char *))__const__ZNSt3__116__variant_detail12__visitation6__base11__visit_altB8sn180100INS1_9__variant15__value_visitorIN3WTF7VisitorIZNK3JSC12CachePayload4sizeEvE3__0JZNKS9_4sizeEvE3__1EEEEEJRKNS0_6__implIJNS6_14FileSystemImpl14MappedFileDataENS_4pairINS6_9MallocPtrIhNS6_10FastMallocEEEmEEEEEEEEDcOT_DpOT0____fmatrix[v96])(&v165, (char *)v93 + 16);
            CC_SHA1_Update(&c, v97, v98);
            CC_SHA1_Final(md, &c);
            while (write((int)v22, md, 0x14uLL) < 0 && *__error() == 4)
              ;
            fsync((int)v22);
            rename(v19, v18, v99);
LABEL_55:
            v100 = v163.var0.var0;
            v163.var0.var0 = 0;
            if (v100)
            {
              if (*((_DWORD *)v100 + 2) == 1)
                (*(void (**)(SourceProvider *))(*(_QWORD *)v100 + 8))(v100);
              else
                --*((_DWORD *)v100 + 2);
            }
            v38 = v74 ^ 1;
            if (v177 != -1)
              ((void (*)(CC_SHA1_CTX *, const char **))off_1E357B550[v177])(&c, &v167);
            close((int)v22);
LABEL_61:
            close(v21);
            return v38;
          }
        }
      }
    }
    std::__throw_bad_variant_access[abi:sn180100]();
    goto LABEL_82;
  }
  v5 = WTF::fastCompactMalloc((WTF *)0x20);
  v13 = v5;
  v14 = 0x4000000002;
  v15 = "No cache path was provided during construction of this JSScript.";
LABEL_10:
  *(_QWORD *)v5 = v14;
  *(_QWORD *)(v5 + 8) = v15;
  *(_DWORD *)(v5 + 16) = 4;
  v37 = *(WTF::StringImpl **)a3;
  *(_QWORD *)a3 = v13;
  if (!v37)
    return 0;
  if (*(_DWORD *)v37 == 2)
  {
    WTF::StringImpl::~StringImpl(v37, v6, v7, v8, v9, v10, v11, v12);
LABEL_22:
    WTF::fastFree(v51, v42, v43, v44, v45, v46, v47, v48);
    return 0;
  }
  v38 = 0;
  *(_DWORD *)v37 -= 2;
  return v38;
}

@end
