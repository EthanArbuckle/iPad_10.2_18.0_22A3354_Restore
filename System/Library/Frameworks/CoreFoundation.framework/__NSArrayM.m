@implementation __NSArrayM

- (void)dealloc
{
  _cow_failure(CFSTR("Attempting to over-release (mutable)"));
}

- (void)getObjects:(id *)a3 range:(_NSRange)a4
{
  uint64_t v4;
  NSUInteger length;
  NSUInteger location;
  $572E31AB9BCA8F739E7041A7602167BE *p_storage;
  NSUInteger used;
  offset **list;
  uint64_t size;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void **v17;
  uint64_t v18;
  void **v19;
  void *v20;
  uint64_t v21;
  void **v22;
  void *v23;
  uint64_t v24;
  void **v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  NSException *v39;
  uint64_t v40;
  double v41;
  NSException *v42;
  _QWORD v43[2];

  length = a4.length;
  location = a4.location;
  v43[1] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  p_storage = &self->storage;
  used = self->storage.state.var0.used;
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || location + length > used)
  {
    v28 = _os_log_pack_size();
    v30 = (char *)v43 - ((MEMORY[0x1E0C80A78](v28, v29) + 15) & 0xFFFFFFFFFFFFFFF0);
    v31 = _os_log_pack_fill();
    if ((_DWORD)used)
    {
      v40 = used - 1;
      v41 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v31, (uint64_t)"-[__NSArrayM getObjects:range:]", location, length, v40);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v41, "-[__NSArrayM getObjects:range:]", location, length, v40);
    }
    else
    {
      v32 = __os_log_helper_1_2_3_8_32_8_0_8_0(v31, (uint64_t)"-[__NSArrayM getObjects:range:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v32, "-[__NSArrayM getObjects:range:]", location, length);
    }
    v42 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v30, v28);
    objc_exception_throw(v42);
  }
  if (!a3 && length)
  {
    v33 = _os_log_pack_size();
    v35 = (char *)v43 - ((MEMORY[0x1E0C80A78](v33, v34) + 15) & 0xFFFFFFFFFFFFFFF0);
    v36 = _os_log_pack_fill();
    *(_DWORD *)v36 = 136315394;
    *(_QWORD *)(v36 + 4) = "-[__NSArrayM getObjects:range:]";
    *(_WORD *)(v36 + 12) = 2048;
    *(_QWORD *)(v36 + 14) = length;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[__NSArrayM getObjects:range:]", length);
    goto LABEL_40;
  }
  if (length >> 61)
  {
    v33 = _os_log_pack_size();
    v35 = (char *)v43 - ((MEMORY[0x1E0C80A78](v33, v37) + 15) & 0xFFFFFFFFFFFFFFF0);
    v38 = _os_log_pack_fill();
    *(_DWORD *)v38 = 136315394;
    *(_QWORD *)(v38 + 4) = "-[__NSArrayM getObjects:range:]";
    *(_WORD *)(v38 + 12) = 2048;
    *(_QWORD *)(v38 + 14) = length;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[__NSArrayM getObjects:range:]", length);
LABEL_40:
    v39 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v35, v33);
    objc_exception_throw(v39);
  }
  if (a3 && length)
  {
    list = p_storage->list;
    size = p_storage->size;
    v13 = (unint64_t)&p_storage->list[size];
    v14 = (unint64_t)(&p_storage->list[p_storage->var0] + location);
    v15 = -size;
    if (v13 <= v14)
      v16 = -size;
    else
      v16 = 0;
    v17 = (void **)(v14 + 8 * v16);
    switch(length)
    {
      case 1uLL:
        goto LABEL_34;
      case 2uLL:
        goto LABEL_30;
      case 3uLL:
        goto LABEL_26;
      case 4uLL:
        goto LABEL_22;
      default:
        if ((uint64_t)(v13 - (_QWORD)v17) >> 3 >= length)
          LODWORD(v18) = length;
        else
          v18 = (uint64_t)(v13 - (_QWORD)v17) >> 3;
        if ((_DWORD)v18)
          memmove(a3, v17, 8 * v18);
        if ((_DWORD)length != (_DWORD)v18)
          memmove(&a3[v18], list, 8 * (length - v18));
LABEL_22:
        v20 = *v17;
        v19 = v17 + 1;
        *a3++ = v20;
        if (v13 <= (unint64_t)v19)
          v21 = v15;
        else
          v21 = 0;
        v17 = &v19[v21];
LABEL_26:
        v23 = *v17;
        v22 = v17 + 1;
        *a3++ = v23;
        if (v13 <= (unint64_t)v22)
          v24 = v15;
        else
          v24 = 0;
        v17 = &v22[v24];
LABEL_30:
        v26 = *v17;
        v25 = v17 + 1;
        *a3++ = v26;
        if (v13 <= (unint64_t)v25)
          v27 = v15;
        else
          v27 = 0;
        v17 = &v25[v27];
LABEL_34:
        *a3 = *v17;
        break;
    }
  }
}

- (void)removeObjectsInRange:(_NSRange)a3
{
  uint64_t v3;
  int64_t length;
  int64_t location;
  uint64_t v7;
  $572E31AB9BCA8F739E7041A7602167BE *p_storage;
  unsigned int muts;
  unsigned int v10;
  unint64_t v12;
  unint64_t v13;
  int64_t v14;
  id *list;
  uint64_t size;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  id *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unsigned int v24;
  uint64_t used;
  uint64_t v26;
  size_t v27;
  size_t v28;
  size_t v29;
  offset **v30;
  offset **v31;
  offset **v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  offset **v38;
  offset **v39;
  uint64_t v40;
  uint64_t v41;
  int64_t v42;
  uint64_t v43;
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  int64_t v49;
  unint64_t v50;
  unint64_t v51;
  int64_t v52;
  uint64_t v53;
  int64_t v54;
  int64_t v55;
  int64_t v56;
  BOOL v57;
  unsigned int v58;
  BOOL v59;
  unsigned int v60;
  uint64_t var0;
  int64_t v62;
  offset **v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  int64_t v67;
  int64_t v68;
  int64_t v69;
  uint64_t v70;
  uint64_t v71;
  offset **v72;
  uint64_t v73;
  unint64_t v74;
  unint64_t v75;
  uint64_t v76;
  unint64_t v77;
  int64_t v78;
  unint64_t v79;
  unint64_t v80;
  int64_t v81;
  uint64_t v82;
  int64_t v83;
  uint64_t v84;
  uint64_t v85;
  unint64_t v86;
  uint64_t v87;
  unsigned int v88;
  _QWORD *v89;
  offset *v90;
  uint64_t v91;
  _QWORD *v92;
  offset *v93;
  uint64_t v94;
  _QWORD *v95;
  offset *v96;
  uint64_t v97;
  unint64_t v98;
  offset **v99;
  offset **v100;
  uint64_t v101;
  unint64_t v102;
  unint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t *v106;
  uint64_t v107;
  _QWORD *v108;
  offset *v109;
  uint64_t v110;
  _QWORD *v111;
  offset *v112;
  uint64_t v113;
  _QWORD *v114;
  offset *v115;
  uint64_t v116;
  offset **v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  uint64_t v121;
  double v122;
  uint64_t v123;
  char *v124;
  uint64_t v125;
  char *v126;
  uint64_t v127;
  uint64_t v128;
  double v129;
  uint64_t v130;
  unint64_t v131;
  uint64_t v132;
  uint64_t v133;
  $572E31AB9BCA8F739E7041A7602167BE *v134;
  uint64_t v135;

  length = a3.length;
  location = a3.location;
  v135 = *MEMORY[0x1E0C80C00];
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
  v7 = atomic_load((unint64_t *)&self->cow);
  p_storage = &self->storage;
  muts = self->storage.state.var0.muts;
  if (muts >> 9 < 0x7D)
    v10 = muts + 1;
  else
    v10 = 0;
  if (v7)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v7);
    if (!*(_WORD *)(v7 + 6))
      -[__NSArrayM removeObjectsInRange:].cold.2();
    if (*(_WORD *)(v7 + 6) != 1 || *(_WORD *)(v7 + 4) != 0)
    {
      --*(_WORD *)(v7 + 6);
      _cow_mutate_slow((uint64_t)self, v7, (uint64_t)__NSArray_cowCallbacks);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v7);
  }
  self->storage.state.var0.muts = v10;
  v12 = -[__NSArrayM count](self, "count");
  v13 = v12;
  if (location < 0 || length < 0 || (v14 = location + length, v12 < location + length))
  {
    if (v12)
    {
      v118 = _os_log_pack_size();
      v126 = (char *)&v130 - ((MEMORY[0x1E0C80A78](v118, v125) + 15) & 0xFFFFFFFFFFFFFFF0);
      v127 = _os_log_pack_fill();
      v128 = v13 - 1;
      v129 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v127, (uint64_t)"-[__NSArrayM removeObjectsInRange:]", location, length, v128);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v129, "-[__NSArrayM removeObjectsInRange:]", location, length, v128);
      v123 = _CFAutoreleasePoolAddObject();
      v124 = v126;
    }
    else
    {
      v118 = _os_log_pack_size();
      v120 = (char *)&v130 - ((MEMORY[0x1E0C80A78](v118, v119) + 15) & 0xFFFFFFFFFFFFFFF0);
      v121 = _os_log_pack_fill();
      v122 = __os_log_helper_1_2_3_8_32_8_0_8_0(v121, (uint64_t)"-[__NSArrayM removeObjectsInRange:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v122, "-[__NSArrayM removeObjectsInRange:]", location, length);
      v123 = _CFAutoreleasePoolAddObject();
      v124 = v120;
    }
    objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), v123, 0, v124, v118));
  }
  if (length)
  {
    list = (id *)p_storage->list;
    size = p_storage->size;
    v17 = (unint64_t)&p_storage->list[size];
    v18 = (unint64_t)(&p_storage->list[p_storage->var0] + location);
    if (v17 <= v18)
      v19 = -size;
    else
      v19 = 0;
    v20 = (id *)(v18 + 8 * v19);
    if ((uint64_t)(v17 - (_QWORD)v20) >> 3 >= (unint64_t)length)
      LODWORD(v21) = length;
    else
      v21 = (uint64_t)(v17 - (_QWORD)v20) >> 3;
    v22 = v21;
    if ((_DWORD)v21)
    {
      do
      {
        if (((unint64_t)*v20 & 0x8000000000000000) == 0)

        ++v20;
        --v22;
      }
      while (v22);
    }
    v23 = (length - v21);
    if ((_DWORD)length != (_DWORD)v21)
    {
      do
      {
        if (((unint64_t)*list & 0x8000000000000000) == 0)

        ++list;
        --v23;
      }
      while (v23);
    }
    v24 = p_storage->size;
    used = p_storage->state.var0.used;
    v26 = (used - length);
    v133 = v26;
    v134 = p_storage;
    if ((_DWORD)used == (_DWORD)length || (double)v26 * 2.61803399 >= (double)v24)
      goto LABEL_41;
    v27 = 8 * v26;
    v28 = malloc_good_size(v27);
    if (HIDWORD(v28))
      -[__NSArrayM removeObjectsInRange:].cold.1();
    v29 = v28;
    v30 = (offset **)malloc_type_malloc(v28, 0xB9DF98CuLL);
    if (!v30)
    {
LABEL_41:
      v40 = used - v14;
      if (location >= (unint64_t)(used - v14))
      {
        if (v40)
        {
          var0 = v134->var0;
          v62 = v134->size;
          v63 = v134->list;
          if (length < 1)
          {
            if (v40 >= 1)
            {
              v72 = v63 + 1;
              v73 = used + var0 - 1;
              v74 = v73 - length;
              if ((unint64_t)v62 <= 1)
                v75 = 1;
              else
                v75 = v134->size;
              v76 = (uint64_t)&v63[v62 + 1];
              do
              {
                v77 = ((v74 & ~((uint64_t)v74 >> 63)) - (v74 + (v74 >> 63))) / v75;
                v78 = v73
                    + v62
                    + v62
                    * (((v73 & ~(v73 >> 63)) - (v73 + ((unint64_t)v73 >> 63))) / v75
                     + ((unint64_t)v73 >> 63));
                do
                  v78 -= v62;
                while (v78 >= v62);
                v79 = v74 + (v77 + (v74 >> 63)) * v62;
                v80 = v62 + v62 * ((v74 >> 63) + v77);
                v81 = v74 + v80;
                v82 = v76 + 8 * v79;
                do
                {
                  v81 -= v62;
                  v80 -= v62;
                  v82 -= 8 * v62;
                }
                while ((uint64_t)(v74 + v80) >= v62);
                if (v78 >= (uint64_t)(v74 + v80))
                  v83 = v74 + v80;
                else
                  v83 = v78;
                if (v40 >= v83 + 1)
                  v84 = v83 + 1;
                else
                  v84 = v40;
                if (v78 < v81)
                  v81 = v78;
                if (v40 >= v81 + 1)
                  v85 = v81 + 1;
                else
                  v85 = v40;
                memmove((void *)(v82 - 8 * v85), &v72[v78] - v84, 8 * v84);
                v73 -= v84;
                v74 -= v84;
                v57 = v40 <= v84;
                v40 -= v84;
              }
              while (!v57);
            }
          }
          else if (v40 >= 1)
          {
            v64 = location + var0;
            v65 = v14 + var0;
            if ((unint64_t)v62 <= 1)
              v66 = 1;
            else
              v66 = v134->size;
            do
            {
              v67 = v65
                  + v62
                  + v62
                  * (((v65 & ~(v65 >> 63)) - (v65 + ((unint64_t)v65 >> 63))) / v66 + ((unint64_t)v65 >> 63));
              do
                v67 -= v62;
              while (v67 >= v62);
              v68 = v64
                  + v62
                  + v62
                  * (((unint64_t)v64 >> 63) + ((v64 & ~(v64 >> 63)) - (v64 + ((unint64_t)v64 >> 63)))
                                                   / v66);
              do
                v68 -= v62;
              while (v68 >= v62);
              if (v68 <= v67)
                v69 = v67;
              else
                v69 = v68;
              v70 = v62 - v69;
              if (v40 >= v70)
                v71 = v70;
              else
                v71 = v40;
              memmove(&v63[v68], &v63[v67], 8 * v71);
              v65 += v71;
              v64 += v71;
              v57 = v40 <= v71;
              v40 -= v71;
            }
            while (!v57);
          }
        }
      }
      else
      {
        v41 = p_storage->var0;
        if (location > 0)
        {
          LODWORD(v132) = v24;
          v42 = p_storage->size;
          v43 = (uint64_t)(p_storage->list + 1);
          v44 = location + v41 - 1;
          v45 = v44 + length;
          if ((unint64_t)v42 <= 1)
            v46 = 1;
          else
            v46 = p_storage->size;
          v47 = (uint64_t)&p_storage->list[v42 + 1];
          do
          {
            v48 = ((v45 & ~((uint64_t)v45 >> 63)) - (v45 + (v45 >> 63))) / v46;
            v49 = v44
                + v42
                + v42
                * (((v44 & ~(v44 >> 63)) - (v44 + ((unint64_t)v44 >> 63))) / v46 + ((unint64_t)v44 >> 63));
            do
              v49 -= v42;
            while (v49 >= v42);
            v50 = v45 + (v48 + (v45 >> 63)) * v42;
            v51 = v42 + v42 * ((v45 >> 63) + v48);
            v52 = v45 + v51;
            v53 = v47 + 8 * v50;
            do
            {
              v52 -= v42;
              v51 -= v42;
              v53 -= 8 * v42;
            }
            while ((uint64_t)(v45 + v51) >= v42);
            if (v49 >= (uint64_t)(v45 + v51))
              v54 = v45 + v51;
            else
              v54 = v49;
            if (location >= v54 + 1)
              v55 = v54 + 1;
            else
              v55 = location;
            if (v49 < v52)
              v52 = v49;
            if (location >= v52 + 1)
              v56 = v52 + 1;
            else
              v56 = location;
            memmove((void *)(v53 - 8 * v56), (const void *)(v43 - 8 * v55 + 8 * v49), 8 * v55);
            v44 -= v55;
            v45 -= v55;
            v57 = location <= v55;
            location -= v55;
          }
          while (!v57);
          p_storage = v134;
          LODWORD(v41) = v134->var0;
          v24 = v132;
        }
        v58 = v41 + length;
        p_storage->var0 = v58;
        v59 = v58 >= v24;
        v60 = v58 - v24;
        if (v59)
          v134->var0 = v60;
      }
      v134->state.var0.used = v133;
    }
    else
    {
      v31 = v30;
      v132 = 8 * v26;
      if (location)
      {
        v32 = p_storage->list;
        v34 = p_storage->var0;
        v33 = p_storage->size;
        v35 = (unint64_t)&p_storage->list[v33];
        v36 = -v33;
        if (v33 <= v34)
          v37 = -v33;
        else
          v37 = 0;
        v38 = &p_storage->list[v34] + v37;
        v39 = v30;
        switch(location)
        {
          case 1:
            goto LABEL_129;
          case 2:
            goto LABEL_125;
          case 3:
            goto LABEL_121;
          case 4:
            goto LABEL_117;
          default:
            v86 = (uint64_t)(v35 - (_QWORD)v38) >> 3;
            if (v86 >= location)
              v86 = location;
            v87 = v86;
            if ((_DWORD)v86)
            {
              v131 = v86;
              memmove(v30, v38, 8 * v86);
              LODWORD(v86) = v131;
            }
            v88 = location - v86;
            if (v88)
              memmove(&v31[v87], v32, 8 * v88);
LABEL_117:
            v90 = *v38;
            v89 = v38 + 1;
            *v31 = v90;
            v39 = v31 + 1;
            if (v35 <= (unint64_t)v89)
              v91 = v36;
            else
              v91 = 0;
            v38 = (offset **)&v89[v91];
LABEL_121:
            v93 = *v38;
            v92 = v38 + 1;
            *v39++ = v93;
            if (v35 <= (unint64_t)v92)
              v94 = v36;
            else
              v94 = 0;
            v38 = (offset **)&v92[v94];
LABEL_125:
            v96 = *v38;
            v95 = v38 + 1;
            *v39++ = v96;
            if (v35 <= (unint64_t)v95)
              v97 = v36;
            else
              v97 = 0;
            v38 = (offset **)&v95[v97];
LABEL_129:
            *v39 = *v38;
            v26 = v133;
            p_storage = v134;
            v27 = v132;
            break;
        }
      }
      v98 = used - v14;
      if (v98)
      {
        v99 = &v31[location];
        v100 = p_storage->list;
        v101 = p_storage->size;
        v102 = (unint64_t)&p_storage->list[v101];
        v103 = (unint64_t)(&p_storage->list[p_storage->var0] + v14);
        v104 = -v101;
        if (v102 <= v103)
          v105 = -v101;
        else
          v105 = 0;
        v106 = (uint64_t *)(v103 + 8 * v105);
        switch(v98)
        {
          case 1uLL:
            goto LABEL_154;
          case 2uLL:
            goto LABEL_150;
          case 3uLL:
            goto LABEL_146;
          case 4uLL:
            goto LABEL_142;
          default:
            if ((uint64_t)(v102 - (_QWORD)v106) >> 3 >= v98)
              LODWORD(v107) = v98;
            else
              v107 = (uint64_t)(v102 - (_QWORD)v106) >> 3;
            if ((_DWORD)v107)
              memmove(v99, v106, 8 * v107);
            if ((_DWORD)v98 != (_DWORD)v107)
              memmove(&v99[v107], v100, 8 * (v98 - v107));
LABEL_142:
            v109 = (offset *)*v106;
            v108 = v106 + 1;
            *v99++ = v109;
            if (v102 <= (unint64_t)v108)
              v110 = v104;
            else
              v110 = 0;
            v106 = &v108[v110];
LABEL_146:
            v112 = (offset *)*v106;
            v111 = v106 + 1;
            *v99++ = v112;
            if (v102 <= (unint64_t)v111)
              v113 = v104;
            else
              v113 = 0;
            v106 = &v111[v113];
LABEL_150:
            v115 = (offset *)*v106;
            v114 = v106 + 1;
            *v99++ = v115;
            if (v102 <= (unint64_t)v114)
              v116 = v104;
            else
              v116 = 0;
            v106 = &v114[v116];
LABEL_154:
            *v99 = (offset *)*v106;
            v26 = v133;
            p_storage = v134;
            v27 = v132;
            break;
        }
      }
      bzero(&v31[v26], v29 - v27);
      v117 = p_storage->list;
      p_storage->list = v31;
      p_storage->var0 = 0;
      p_storage->size = v29 >> 3;
      p_storage->state.var0.used = v26;
      free(v117);
    }
  }
}

- (unint64_t)count
{
  uint64_t v2;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableArray);
  return self->storage.state.var0.used;
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v4;
  $572E31AB9BCA8F739E7041A7602167BE *p_storage;
  unint64_t used;
  uint64_t v10;
  unsigned int muts;
  unsigned int v12;
  size_t size;
  unsigned int v15;
  offset **list;
  double v17;
  size_t v18;
  offset **v19;
  offset **v20;
  uint64_t var0;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  offset **v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  BOOL v34;
  unsigned int v35;
  BOOL v36;
  unsigned int v37;
  uint64_t v38;
  unint64_t v39;
  uint64_t v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unsigned int v51;
  unint64_t v52;
  int v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  uint64_t v58;
  NSException *v59;
  uint64_t v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  double v64;
  NSException *v65;
  offset *v66;
  size_t v67;
  unint64_t v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  if (__cf_tsanWriteFunction)
  {
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
    if (a3)
      goto LABEL_3;
LABEL_72:
    v55 = _os_log_pack_size();
    v57 = (char *)&v66 - ((MEMORY[0x1E0C80A78](v55, v56) + 15) & 0xFFFFFFFFFFFFFFF0);
    v58 = _os_log_pack_fill();
    *(_DWORD *)v58 = 136315138;
    *(_QWORD *)(v58 + 4) = "-[__NSArrayM insertObject:atIndex:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: object cannot be nil"), "-[__NSArrayM insertObject:atIndex:]");
    v59 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v57, v55);
    objc_exception_throw(v59);
  }
  if (!a3)
    goto LABEL_72;
LABEL_3:
  p_storage = &self->storage;
  used = self->storage.state.var0.used;
  if ((a4 & 0x8000000000000000) != 0 || used < a4)
  {
    v60 = _os_log_pack_size();
    v62 = (char *)&v66 - ((MEMORY[0x1E0C80A78](v60, v61) + 15) & 0xFFFFFFFFFFFFFFF0);
    v63 = _os_log_pack_fill();
    if ((_DWORD)used)
    {
      v64 = __os_log_helper_1_2_3_8_32_8_0_8_0(v63, (uint64_t)"-[__NSArrayM insertObject:atIndex:]", a4, used - 1);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v64, "-[__NSArrayM insertObject:atIndex:]", a4, used - 1);
    }
    else
    {
      *(_DWORD *)v63 = 136315394;
      *(_QWORD *)(v63 + 4) = "-[__NSArrayM insertObject:atIndex:]";
      *(_WORD *)(v63 + 12) = 2048;
      *(_QWORD *)(v63 + 14) = a4;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty array"), "-[__NSArrayM insertObject:atIndex:]", a4);
    }
    v65 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v62, v60);
    objc_exception_throw(v65);
  }
  v10 = atomic_load((unint64_t *)&self->cow);
  muts = self->storage.state.var0.muts;
  if (muts >> 9 < 0x7D)
    v12 = muts + 1;
  else
    v12 = 0;
  if (v10)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v10);
    if (!*(_WORD *)(v10 + 6))
      -[__NSArrayM insertObject:atIndex:].cold.2();
    if (*(_WORD *)(v10 + 6) != 1 || *(_WORD *)(v10 + 4) != 0)
    {
      --*(_WORD *)(v10 + 6);
      _cow_mutate_slow((uint64_t)self, v10, (uint64_t)__NSArray_cowCallbacks);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v10);
  }
  v66 = (offset *)a3;
  self->storage.state.var0.muts = v12;
  size = self->storage.size;
  v15 = used + 1;
  if (size < (int)used + 1)
  {
    list = p_storage->list;
    v17 = (double)used * 1.625;
    if (v17 <= (double)v15)
      v17 = (double)v15;
    v18 = malloc_good_size(8 * v17);
    v19 = (offset **)malloc_type_malloc(v18, 0x5944B39DuLL);
    if (!v19)
      -[__NSArrayM insertObject:atIndex:].cold.1();
    v20 = v19;
    var0 = p_storage->var0;
    if ((int)size - (int)var0 >= used)
      v22 = used;
    else
      v22 = size - var0;
    memmove(v19, &list[var0], 8 * v22);
    memmove(&v20[v22], list, 8 * (used - v22));
    bzero(&v20[used], v18 - 8 * used);
    free(list);
    p_storage->list = v20;
    size = v18 >> 3;
    p_storage->var0 = 0;
    p_storage->size = v18 >> 3;
  }
  v23 = (used - a4);
  v67 = size;
  v68 = a4;
  if (v23 <= a4)
  {
    if ((_DWORD)used != (_DWORD)a4)
    {
      v38 = (uint64_t)(p_storage->list + 1);
      v39 = v68 + (unint64_t)v23 + p_storage->var0;
      v40 = v39 - 1;
      if (v67 <= 1uLL)
        v41 = 1;
      else
        v41 = v67;
      do
      {
        v42 = ((v39 & ~((uint64_t)v39 >> 63)) - (v39 + (v39 >> 63))) / v41;
        v43 = v40
            + v67
            + v67
            * (((v40 & ~(v40 >> 63)) - (v40 + ((unint64_t)v40 >> 63))) / v41 + ((unint64_t)v40 >> 63));
        do
          v43 -= v67;
        while (v43 >= v67);
        v44 = v39 + (v42 + (v39 >> 63)) * v67;
        v45 = v67 + v67 * ((v39 >> 63) + v42);
        v46 = v39 + v45;
        v47 = v38 + 8 * v67 + 8 * v44;
        do
        {
          v46 -= v67;
          v45 -= v67;
          v47 -= 8 * v67;
        }
        while ((uint64_t)(v39 + v45) >= v67);
        if (v43 >= (uint64_t)(v39 + v45))
          v48 = v39 + v45;
        else
          v48 = v43;
        if (v23 >= v48 + 1)
          v49 = v48 + 1;
        else
          v49 = v23;
        if (v43 < v46)
          v46 = v43;
        if (v23 >= v46 + 1)
          v50 = v46 + 1;
        else
          v50 = v23;
        memmove((void *)(v47 - 8 * v50), (const void *)(v38 - 8 * v49 + 8 * v43), 8 * v49);
        v40 -= v49;
        v39 -= v49;
        v34 = v23 <= v49;
        v23 -= v49;
      }
      while (!v34);
    }
  }
  else
  {
    if ((_DWORD)a4)
    {
      v24 = a4;
      v25 = p_storage->list;
      v26 = p_storage->var0;
      v27 = v26 - 1;
      if (size <= 1uLL)
        v28 = 1;
      else
        v28 = size;
      do
      {
        v29 = v26
            + size
            + size
            * (((v26 & ~(v26 >> 63)) - (v26 + ((unint64_t)v26 >> 63))) / v28 + ((unint64_t)v26 >> 63));
        do
          v29 -= size;
        while (v29 >= size);
        v30 = v27
            + size
            + size
            * (((unint64_t)v27 >> 63) + ((v27 & ~(v27 >> 63)) - (v27 + ((unint64_t)v27 >> 63))) / v28);
        do
          v30 -= size;
        while (v30 >= size);
        if (v30 <= v29)
          v31 = v29;
        else
          v31 = v30;
        v32 = size - v31;
        if (v24 >= v32)
          v33 = v32;
        else
          v33 = v24;
        memmove(&v25[v30], &v25[v29], 8 * v33);
        v26 += v33;
        v27 += v33;
        v34 = v24 <= v33;
        v24 -= v33;
      }
      while (!v34);
    }
    v35 = size + p_storage->var0 - 1;
    p_storage->var0 = v35;
    v36 = v35 >= size;
    v37 = v35 - size;
    if (v36)
      p_storage->var0 = v37;
  }
  ++p_storage->state.var0.used;
  v51 = p_storage->var0 + v68;
  v52 = (unint64_t)v66;
  if (v67 <= v51)
    v53 = v67;
  else
    v53 = 0;
  p_storage->list[v51 - v53] = v66;
  if ((v52 & 0x8000000000000000) == 0)
    v54 = (id)v52;
}

- (void)addObject:(id)a3
{
  uint64_t v3;

  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
  -[__NSArrayM insertObject:atIndex:](self, "insertObject:atIndex:", a3, self->storage.state.var0.used);
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  uint64_t v4;
  char v6;
  unsigned int size;
  size_t used;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  NSException *v18;
  uint64_t v19;
  char v20;
  _QWORD v21[6];
  unsigned int v22;
  uint64_t v23;

  v6 = a3;
  v23 = *MEMORY[0x1E0C80C00];
  if (!__cf_tsanReadFunction)
  {
    if (a4)
      goto LABEL_3;
LABEL_14:
    v14 = _os_log_pack_size();
    v16 = (char *)&v19 - ((MEMORY[0x1E0C80A78](v14, v15) + 15) & 0xFFFFFFFFFFFFFFF0);
    v17 = _os_log_pack_fill();
    *(_DWORD *)v17 = 136315138;
    *(_QWORD *)(v17 + 4) = "-[__NSArrayM enumerateObjectsWithOptions:usingBlock:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: block cannot be nil"), "-[__NSArrayM enumerateObjectsWithOptions:usingBlock:]");
    v18 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v16, v14);
    objc_exception_throw(v18);
  }
  __cf_tsanReadFunction(self, v4, __CFTSANTagMutableArray);
  if (!a4)
    goto LABEL_14;
LABEL_3:
  size = self->storage.size;
  used = self->storage.state.var0.used;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = ___deque_enumerateObjectsWithOptionsBlock_block_invoke;
  v21[3] = &unk_1E12E0EE0;
  v22 = size;
  v21[4] = a4;
  v21[5] = &self->storage;
  if ((__NSCollectionHandleConcurrentEnumerationIfSpecified(v6, 1, used, (uint64_t)v21) & 1) == 0)
  {
    if ((v6 & 2) != 0)
    {
      v20 = 0;
      v12 = self->storage.state.var0.used;
      while (v12)
      {
        --v12;
        v13 = (void *)_CFAutoreleasePoolPush();
        __NSARRAY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
        _CFAutoreleasePoolPop(v13);
      }
    }
    else
    {
      v20 = 0;
      if (self->storage.state.var0.used)
      {
        v10 = 0;
        do
        {
          v11 = (void *)_CFAutoreleasePoolPush();
          __NSARRAY_IS_CALLING_OUT_TO_A_BLOCK__((uint64_t)a4);
          _CFAutoreleasePoolPop(v11);
          ++v10;
        }
        while (v10 < self->storage.state.var0.used);
      }
    }
  }
}

- (id)objectAtIndex:(unint64_t)a3
{
  uint64_t v3;
  unint64_t used;
  unsigned int size;
  unsigned int v8;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  NSException *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  used = self->storage.state.var0.used;
  if ((a3 & 0x8000000000000000) != 0 || used <= a3)
  {
    v10 = _os_log_pack_size();
    v12 = (char *)v17 - ((MEMORY[0x1E0C80A78](v10, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
    v13 = _os_log_pack_fill();
    if ((_DWORD)used)
    {
      v14 = used - 1;
      v15 = __os_log_helper_1_2_3_8_32_8_0_8_0(v13, (uint64_t)"-[__NSArrayM objectAtIndex:]", a3, v14);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v15, "-[__NSArrayM objectAtIndex:]", a3, v14);
    }
    else
    {
      *(_DWORD *)v13 = 136315394;
      *(_QWORD *)(v13 + 4) = "-[__NSArrayM objectAtIndex:]";
      *(_WORD *)(v13 + 12) = 2048;
      *(_QWORD *)(v13 + 14) = a3;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty array"), "-[__NSArrayM objectAtIndex:]", a3);
    }
    v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v12, v10);
    objc_exception_throw(v16);
  }
  size = self->storage.size;
  v8 = self->storage.var0 + a3;
  if (size > v8)
    size = 0;
  return self->storage.list[v8 - size];
}

- (void)removeLastObject
{
  uint64_t v2;
  unint64_t v4;
  unint64_t v5;

  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v2, __CFTSANTagMutableArray);
  v4 = -[__NSArrayM count](self, "count");
  if (_CFExecutableLinkedOnOrAfter(7uLL))
  {
    if (!v4)
      return;
    v5 = v4 - 1;
  }
  else if (v4)
  {
    v5 = v4 - 1;
  }
  else
  {
    v5 = 0;
  }
  -[__NSArrayM removeObjectAtIndex:](self, "removeObjectAtIndex:", v5);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  uint64_t v5;
  unint64_t result;
  $572E31AB9BCA8F739E7041A7602167BE *p_storage;
  offset **v10;
  unsigned int size;
  uint64_t var0;
  BOOL v13;
  unint64_t v14;
  id *list;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v5, __CFTSANTagMutableArray);
  atomic_load((unint64_t *)&self->cow);
  result = a3->var0;
  if (a3->var0 == -1)
    return 0;
  p_storage = &self->storage;
  if (result)
  {
    list = (id *)p_storage->list;
    a3->var0 = -1;
    a3->var1 = list;
  }
  else
  {
    a3->var2 = &self->storage.state.mutations;
    result = self->storage.state.var0.used;
    v10 = p_storage->list;
    var0 = self->storage.var0;
    size = self->storage.size;
    a3->var1 = (id *)&v10[var0];
    v13 = (int)var0 + (int)result >= size;
    v14 = (_DWORD)var0 + (_DWORD)result - size;
    if ((_DWORD)v14 != 0 && v13)
    {
      a3->var0 = v14;
      result -= v14;
    }
    else
    {
      a3->var0 = -1;
    }
  }
  return result;
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  uint64_t v3;

  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v3, __CFTSANTagMutableArray);
  -[__NSArrayM removeObjectsInRange:](self, "removeObjectsInRange:", a3, 1);
}

- (void)_mutate
{
  _cow_failure(CFSTR("Attempting to mutate immutable collection!"));
}

- (unint64_t)indexOfObjectIdenticalTo:(id)a3
{
  uint64_t v3;
  offset **list;
  unsigned int used;
  uint64_t var0;
  unsigned int v9;
  unint64_t v10;
  unint64_t result;
  offset **v12;
  uint64_t v13;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  list = self->storage.list;
  used = self->storage.state.var0.used;
  var0 = self->storage.var0;
  v9 = self->storage.size - var0;
  if (used >= v9)
    v10 = v9;
  else
    v10 = used;
  if ((_DWORD)v10)
  {
    result = 0;
    v12 = &list[var0];
    while (v12[result] != a3)
    {
      if (v10 == ++result)
        goto LABEL_10;
    }
  }
  else
  {
LABEL_10:
    if (used <= v9)
    {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      LODWORD(v13) = used - v10;
      if (v13 <= 1)
        v13 = 1;
      else
        v13 = v13;
      while (*list != a3)
      {
        ++v10;
        ++list;
        if (!--v13)
          return 0x7FFFFFFFFFFFFFFFLL;
      }
      return v10;
    }
  }
  return result;
}

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  uint64_t v3;
  unint64_t used;
  unsigned int size;
  unsigned int v8;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  NSException *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  used = self->storage.state.var0.used;
  if ((a3 & 0x8000000000000000) != 0 || used <= a3)
  {
    v10 = _os_log_pack_size();
    v12 = (char *)v17 - ((MEMORY[0x1E0C80A78](v10, v11) + 15) & 0xFFFFFFFFFFFFFFF0);
    v13 = _os_log_pack_fill();
    if ((_DWORD)used)
    {
      v14 = used - 1;
      v15 = __os_log_helper_1_2_3_8_32_8_0_8_0(v13, (uint64_t)"-[__NSArrayM objectAtIndexedSubscript:]", a3, v14);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v15, "-[__NSArrayM objectAtIndexedSubscript:]", a3, v14);
    }
    else
    {
      *(_DWORD *)v13 = 136315394;
      *(_QWORD *)(v13 + 4) = "-[__NSArrayM objectAtIndexedSubscript:]";
      *(_WORD *)(v13 + 12) = 2048;
      *(_QWORD *)(v13 + 14) = a3;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty array"), "-[__NSArrayM objectAtIndexedSubscript:]", a3);
    }
    v16 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v12, v10);
    objc_exception_throw(v16);
  }
  size = self->storage.size;
  v8 = self->storage.var0 + a3;
  if (size > v8)
    size = 0;
  return self->storage.list[v8 - size];
}

- (void)replaceObjectsInRange:(_NSRange)a3 withObjects:(const void *)a4 count:(unint64_t)a5
{
  uint64_t v5;
  NSUInteger length;
  NSUInteger location;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  const void **v14;
  id v15;
  unint64_t v16;
  NSUInteger v17;
  const void **v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  NSException *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSException *v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  NSException *v42;
  _QWORD v43[2];

  length = a3.length;
  location = a3.location;
  v43[1] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
  v11 = -[__NSArrayM count](self, "count");
  if ((location & 0x8000000000000000) != 0 || (length & 0x8000000000000000) != 0 || v11 < location + length)
  {
    if (v11)
    {
      v38 = v11;
      v26 = _os_log_pack_size();
      v28 = (char *)v43 - ((MEMORY[0x1E0C80A78](v26, v39) + 15) & 0xFFFFFFFFFFFFFFF0);
      v40 = _os_log_pack_fill();
      v41 = __os_log_helper_1_2_4_8_32_8_0_8_0_8_0(v40, (uint64_t)"-[__NSArrayM replaceObjectsInRange:withObjects:count:]", location, length, --v38);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds [0 .. %lu]"), v41, "-[__NSArrayM replaceObjectsInRange:withObjects:count:]", location, length, v38);
    }
    else
    {
      v26 = _os_log_pack_size();
      v28 = (char *)v43 - ((MEMORY[0x1E0C80A78](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0);
      v29 = _os_log_pack_fill();
      v30 = __os_log_helper_1_2_3_8_32_8_0_8_0(v29, (uint64_t)"-[__NSArrayM replaceObjectsInRange:withObjects:count:]", location, length);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: range {%lu, %lu} extends beyond bounds for empty array"), v30, "-[__NSArrayM replaceObjectsInRange:withObjects:count:]", location, length);
    }
    v42 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v28, v26);
    objc_exception_throw(v42);
  }
  if (!a4 && a5)
  {
    v31 = _os_log_pack_size();
    v33 = (char *)v43 - ((MEMORY[0x1E0C80A78](v31, v32) + 15) & 0xFFFFFFFFFFFFFFF0);
    v34 = _os_log_pack_fill();
    *(_DWORD *)v34 = 136315394;
    *(_QWORD *)(v34 + 4) = "-[__NSArrayM replaceObjectsInRange:withObjects:count:]";
    *(_WORD *)(v34 + 12) = 2048;
    *(_QWORD *)(v34 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[__NSArrayM replaceObjectsInRange:withObjects:count:]", a5);
    goto LABEL_37;
  }
  if (a5 >> 61)
  {
    v31 = _os_log_pack_size();
    v33 = (char *)v43 - ((MEMORY[0x1E0C80A78](v31, v35) + 15) & 0xFFFFFFFFFFFFFFF0);
    v36 = _os_log_pack_fill();
    *(_DWORD *)v36 = 136315394;
    *(_QWORD *)(v36 + 4) = "-[__NSArrayM replaceObjectsInRange:withObjects:count:]";
    *(_WORD *)(v36 + 12) = 2048;
    *(_QWORD *)(v36 + 14) = a5;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[__NSArrayM replaceObjectsInRange:withObjects:count:]", a5);
LABEL_37:
    v37 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v33, v31);
    objc_exception_throw(v37);
  }
  if (a5)
  {
    v12 = 0;
    do
    {
      if (!a4[v12])
      {
        v21 = _os_log_pack_size();
        v23 = (char *)v43 - ((MEMORY[0x1E0C80A78](v21, v22) + 15) & 0xFFFFFFFFFFFFFFF0);
        v24 = _os_log_pack_fill();
        *(_DWORD *)v24 = 136315394;
        *(_QWORD *)(v24 + 4) = "-[__NSArrayM replaceObjectsInRange:withObjects:count:]";
        *(_WORD *)(v24 + 12) = 2048;
        *(_QWORD *)(v24 + 14) = v12;
        CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: attempt to insert nil object from objects[%lu]"), "-[__NSArrayM replaceObjectsInRange:withObjects:count:]", v12);
        v25 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v23, v21);
        objc_exception_throw(v25);
      }
      ++v12;
    }
    while (a5 != v12);
    v13 = a5;
    v14 = a4;
    do
    {
      if (((unint64_t)*v14 & 0x8000000000000000) == 0)
        v15 = (id)*v14;
      ++v14;
      --v13;
    }
    while (v13);
  }
  if (length >= a5)
    v16 = a5;
  else
    v16 = length;
  if (v16)
  {
    v17 = location;
    v18 = a4;
    v19 = v16;
    do
    {
      v20 = (uint64_t)*v18++;
      -[__NSArrayM replaceObjectAtIndex:withObject:](self, "replaceObjectAtIndex:withObject:", v17++, v20);
      --v19;
    }
    while (v19);
  }
  if (length > a5)
  {
    -[__NSArrayM removeObjectsInRange:](self, "removeObjectsInRange:", v16 + location, length - v16);
    goto LABEL_27;
  }
  if (length >= a5)
  {
LABEL_27:
    if (!a5)
      return;
    goto LABEL_28;
  }
  -[__NSArrayM insertObjects:count:atIndex:](self, "insertObjects:count:atIndex:", &a4[v16], a5 - v16, v16 + location);
  do
  {
LABEL_28:
    if (((unint64_t)*a4 & 0x8000000000000000) == 0)

    ++a4;
    --a5;
  }
  while (a5);
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  uint64_t v4;
  uint64_t v8;
  $572E31AB9BCA8F739E7041A7602167BE *p_storage;
  unsigned int muts;
  unsigned int v11;
  unint64_t used;
  unsigned int size;
  unsigned int v15;
  uint64_t v16;
  offset **list;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  NSException *v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  NSException *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  v8 = atomic_load((unint64_t *)&self->cow);
  p_storage = &self->storage;
  muts = self->storage.state.var0.muts;
  if (muts >> 9 < 0x7D)
    v11 = muts + 1;
  else
    v11 = 0;
  if (v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v8);
    if (!*(_WORD *)(v8 + 6))
      -[__NSArrayM replaceObjectAtIndex:withObject:].cold.1();
    if (*(_WORD *)(v8 + 6) != 1 || *(_WORD *)(v8 + 4) != 0)
    {
      --*(_WORD *)(v8 + 6);
      _cow_mutate_slow((uint64_t)self, v8, (uint64_t)__NSArray_cowCallbacks);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v8);
  }
  self->storage.state.var0.muts = v11;
  if (!a4)
  {
    v20 = _os_log_pack_size();
    v22 = (char *)v32 - ((MEMORY[0x1E0C80A78](v20, v21) + 15) & 0xFFFFFFFFFFFFFFF0);
    v23 = _os_log_pack_fill();
    *(_DWORD *)v23 = 136315138;
    *(_QWORD *)(v23 + 4) = "-[__NSArrayM replaceObjectAtIndex:withObject:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: object cannot be nil"), "-[__NSArrayM replaceObjectAtIndex:withObject:]");
    v24 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v22, v20);
    objc_exception_throw(v24);
  }
  used = self->storage.state.var0.used;
  if ((a3 & 0x8000000000000000) != 0 || used <= a3)
  {
    v25 = _os_log_pack_size();
    v27 = (char *)v32 - ((MEMORY[0x1E0C80A78](v25, v26) + 15) & 0xFFFFFFFFFFFFFFF0);
    v28 = _os_log_pack_fill();
    if ((_DWORD)used)
    {
      v29 = used - 1;
      v30 = __os_log_helper_1_2_3_8_32_8_0_8_0(v28, (uint64_t)"-[__NSArrayM replaceObjectAtIndex:withObject:]", a3, v29);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v30, "-[__NSArrayM replaceObjectAtIndex:withObject:]", a3, v29);
    }
    else
    {
      *(_DWORD *)v28 = 136315394;
      *(_QWORD *)(v28 + 4) = "-[__NSArrayM replaceObjectAtIndex:withObject:]";
      *(_WORD *)(v28 + 12) = 2048;
      *(_QWORD *)(v28 + 14) = a3;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty array"), "-[__NSArrayM replaceObjectAtIndex:withObject:]", a3);
    }
    v31 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v27, v25);
    objc_exception_throw(v31);
  }
  size = self->storage.size;
  v15 = self->storage.var0 + a3;
  if (size > v15)
    size = 0;
  v16 = v15 - size;
  list = p_storage->list;
  v18 = (uint64_t)p_storage->list[v16];
  if ((id)v18 != a4)
  {
    if (((unint64_t)a4 & 0x8000000000000000) == 0)
    {
      v19 = a4;
      list = p_storage->list;
    }
    list[v16] = (offset *)a4;
    if (v18 >= 1)

  }
}

- (void)insertObjects:(const void *)a3 count:(unint64_t)a4 atIndex:(unint64_t)a5
{
  uint64_t v5;
  uint64_t v10;
  $572E31AB9BCA8F739E7041A7602167BE *p_storage;
  unsigned int muts;
  unsigned int v13;
  uint64_t v15;
  unint64_t used;
  uint64_t v17;
  unint64_t v18;
  id v19;
  int64_t size;
  uint64_t v21;
  offset **v22;
  unint64_t v23;
  size_t v24;
  size_t v25;
  offset **v26;
  offset **v27;
  $572E31AB9BCA8F739E7041A7602167BE *v28;
  offset **v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int *p_var0;
  offset **v33;
  offset **v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  offset **v38;
  offset **v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  unsigned int v44;
  int64_t v45;
  uint64_t var0;
  int64_t v47;
  offset **v48;
  uint64_t v49;
  unint64_t v50;
  int64_t v51;
  int64_t v52;
  int64_t v53;
  int64_t v54;
  uint64_t v55;
  BOOL v56;
  offset **list;
  offset **v58;
  uint64_t v59;
  unint64_t v60;
  unint64_t v61;
  offset **v62;
  unint64_t v63;
  int64_t v64;
  unint64_t v65;
  unint64_t v66;
  int64_t v67;
  uint64_t v68;
  int64_t v69;
  int64_t v70;
  int64_t v71;
  uint64_t v72;
  unint64_t v73;
  offset **v74;
  unint64_t v75;
  unint64_t v76;
  int64_t v77;
  unint64_t v78;
  unint64_t v79;
  int64_t v80;
  uint64_t v81;
  int64_t v82;
  int64_t v83;
  int64_t v84;
  unsigned int v85;
  uint64_t v86;
  uint64_t v87;
  unint64_t v88;
  int64_t v89;
  int64_t v90;
  int64_t v91;
  int64_t v92;
  uint64_t v93;
  uint64_t v94;
  $572E31AB9BCA8F739E7041A7602167BE *v95;
  uint64_t v96;
  unint64_t v97;
  unsigned int v98;
  unint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const void **v102;
  const void *v103;
  uint64_t v104;
  uint64_t v105;
  offset **v106;
  uint64_t v107;
  offset **v108;
  offset *v109;
  uint64_t v110;
  offset **v111;
  offset *v112;
  uint64_t v113;
  offset **v114;
  offset *v115;
  uint64_t v116;
  unint64_t v117;
  offset **v118;
  unint64_t v119;
  char *v120;
  offset **v121;
  uint64_t v122;
  unint64_t v123;
  unint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t *v127;
  unint64_t v128;
  uint64_t v129;
  unsigned int v130;
  _QWORD *v131;
  uint64_t v132;
  uint64_t v133;
  _QWORD *v134;
  uint64_t v135;
  uint64_t v136;
  _QWORD *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  char *v142;
  uint64_t v143;
  NSException *v144;
  uint64_t v145;
  uint64_t v146;
  char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  NSException *v151;
  double v152;
  NSException *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  unint64_t v158;
  $572E31AB9BCA8F739E7041A7602167BE *v159;
  uint64_t v160;
  uint64_t v161;

  v161 = *MEMORY[0x1E0C80C00];
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v5, __CFTSANTagMutableArray);
  v10 = atomic_load((unint64_t *)&self->cow);
  p_storage = &self->storage;
  muts = self->storage.state.var0.muts;
  if (muts >> 9 < 0x7D)
    v13 = muts + 1;
  else
    v13 = 0;
  if (v10)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v10);
    if (!*(_WORD *)(v10 + 6))
      -[__NSArrayM insertObjects:count:atIndex:].cold.2();
    if (*(_WORD *)(v10 + 6) != 1 || *(_WORD *)(v10 + 4) != 0)
    {
      --*(_WORD *)(v10 + 6);
      _cow_mutate_slow((uint64_t)self, v10, (uint64_t)__NSArray_cowCallbacks);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v10);
  }
  self->storage.state.var0.muts = v13;
  if (!a3 && a4)
  {
    v145 = _os_log_pack_size();
    v147 = (char *)&v154 - ((MEMORY[0x1E0C80A78](v145, v146) + 15) & 0xFFFFFFFFFFFFFFF0);
    v148 = _os_log_pack_fill();
    *(_DWORD *)v148 = 136315394;
    *(_QWORD *)(v148 + 4) = "-[__NSArrayM insertObjects:count:atIndex:]";
    *(_WORD *)(v148 + 12) = 2048;
    *(_QWORD *)(v148 + 14) = a4;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: pointer to objects array is NULL but length is %lu"), "-[__NSArrayM insertObjects:count:atIndex:]", a4);
    goto LABEL_181;
  }
  if (a4 >> 61)
  {
    v145 = _os_log_pack_size();
    v147 = (char *)&v154 - ((MEMORY[0x1E0C80A78](v145, v149) + 15) & 0xFFFFFFFFFFFFFFF0);
    v150 = _os_log_pack_fill();
    *(_DWORD *)v150 = 136315394;
    *(_QWORD *)(v150 + 4) = "-[__NSArrayM insertObjects:count:atIndex:]";
    *(_WORD *)(v150 + 12) = 2048;
    *(_QWORD *)(v150 + 14) = a4;
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: count (%lu) of objects array is ridiculous"), "-[__NSArrayM insertObjects:count:atIndex:]", a4);
LABEL_181:
    v151 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v147, v145);
    objc_exception_throw(v151);
  }
  if (!a4)
  {
    used = self->storage.state.var0.used;
    if ((a5 & 0x8000000000000000) == 0 && used >= a5)
      return;
LABEL_40:
    v40 = _os_log_pack_size();
    v42 = (char *)&v154 - ((MEMORY[0x1E0C80A78](v40, v41) + 15) & 0xFFFFFFFFFFFFFFF0);
    v43 = _os_log_pack_fill();
    if ((_DWORD)used)
    {
      v152 = __os_log_helper_1_2_3_8_32_8_0_8_0(v43, (uint64_t)"-[__NSArrayM insertObjects:count:atIndex:]", a5, used - 1);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v152, "-[__NSArrayM insertObjects:count:atIndex:]", a5, used - 1);
    }
    else
    {
      *(_DWORD *)v43 = 136315394;
      *(_QWORD *)(v43 + 4) = "-[__NSArrayM insertObjects:count:atIndex:]";
      *(_WORD *)(v43 + 12) = 2048;
      *(_QWORD *)(v43 + 14) = a5;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty array"), "-[__NSArrayM insertObjects:count:atIndex:]", a5);
    }
    v153 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v42, v40);
    objc_exception_throw(v153);
  }
  v15 = 0;
  do
  {
    if (!a3[v15])
    {
      v140 = _os_log_pack_size();
      v142 = (char *)&v154 - ((MEMORY[0x1E0C80A78](v140, v141) + 15) & 0xFFFFFFFFFFFFFFF0);
      v143 = _os_log_pack_fill();
      *(_DWORD *)v143 = 136315394;
      *(_QWORD *)(v143 + 4) = "-[__NSArrayM insertObjects:count:atIndex:]";
      *(_WORD *)(v143 + 12) = 2048;
      *(_QWORD *)(v143 + 14) = v15;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: attempt to insert nil object from objects[%lu]"), "-[__NSArrayM insertObjects:count:atIndex:]", v15);
      v144 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v142, v140);
      objc_exception_throw(v144);
    }
    ++v15;
  }
  while (a4 != v15);
  used = p_storage->state.var0.used;
  if ((a5 & 0x8000000000000000) != 0 || used < a5)
    goto LABEL_40;
  v17 = 0;
  do
  {
    v18 = (unint64_t)a3[v17];
    if ((v18 & 0x8000000000000000) == 0)
      v19 = (id)v18;
    ++v17;
  }
  while (a4 != v17);
  size = p_storage->size;
  v21 = (used + a4);
  if (size >= v21)
  {
    v44 = p_storage->state.var0.used;
    v45 = v44 - a5;
    v158 = a5;
    v159 = p_storage;
    var0 = p_storage->var0;
    v157 = (used + a4);
    if (v45 <= a5)
    {
      if (v44 != (_DWORD)a5)
      {
        list = v159->list;
        if ((a4 & 0x8000000000000000) != 0)
        {
          v86 = var0 + v158;
          v87 = v86 + a4;
          if ((unint64_t)size <= 1)
            v88 = 1;
          else
            v88 = size;
          do
          {
            v89 = v86
                + size
                + size
                * (((v86 & ~(v86 >> 63)) - (v86 + ((unint64_t)v86 >> 63))) / v88 + ((unint64_t)v86 >> 63));
            do
              v89 -= size;
            while (v89 >= size);
            v90 = v87
                + size
                + size
                * (((unint64_t)v87 >> 63) + ((v87 & ~(v87 >> 63)) - (v87 + ((unint64_t)v87 >> 63))) / v88);
            do
              v90 -= size;
            while (v90 >= size);
            if (v90 <= v89)
              v91 = v89;
            else
              v91 = v90;
            v92 = size - v91;
            if (v45 >= v92)
              v93 = v92;
            else
              v93 = v45;
            memmove(&list[v90], &list[v89], 8 * v93);
            v86 += v93;
            v87 += v93;
            v56 = v45 <= v93;
            v45 -= v93;
          }
          while (!v56);
        }
        else
        {
          v58 = list + 1;
          v59 = v158 + v45 + var0 - 1;
          v60 = v59 + a4;
          if ((unint64_t)size <= 1)
            v61 = 1;
          else
            v61 = size;
          v62 = list + 1;
          v160 = (uint64_t)&v58[size];
          do
          {
            v63 = ((v60 & ~((uint64_t)v60 >> 63)) - (v60 + (v60 >> 63))) / v61;
            v64 = v59
                + size
                + size
                * (((v59 & ~(v59 >> 63)) - (v59 + ((unint64_t)v59 >> 63))) / v61 + ((unint64_t)v59 >> 63));
            do
              v64 -= size;
            while (v64 >= size);
            v65 = v60 + (v63 + (v60 >> 63)) * size;
            v66 = size + size * ((v60 >> 63) + v63);
            v67 = v60 + v66;
            v68 = v160 + 8 * v65;
            do
            {
              v67 -= size;
              v66 -= size;
              v68 -= 8 * size;
            }
            while ((uint64_t)(v60 + v66) >= size);
            if (v64 >= (uint64_t)(v60 + v66))
              v69 = v60 + v66;
            else
              v69 = v64;
            if (v45 >= v69 + 1)
              v70 = v69 + 1;
            else
              v70 = v45;
            if (v64 < v67)
              v67 = v64;
            if (v45 >= v67 + 1)
              v71 = v67 + 1;
            else
              v71 = v45;
            memmove((void *)(v68 - 8 * v71), &v62[v64] - v70, 8 * v70);
            v59 -= v70;
            v60 -= v70;
            v56 = v45 <= v70;
            v45 -= v70;
          }
          while (!v56);
        }
      }
    }
    else
    {
      v47 = a5;
      if ((_DWORD)a5)
      {
        v48 = v159->list;
        if ((uint64_t)a4 < 1)
        {
          v72 = a5 + var0 - 1;
          v73 = v72 - a4;
          v74 = v48 + 1;
          if ((unint64_t)size <= 1)
            v75 = 1;
          else
            v75 = size;
          v160 = (uint64_t)&v74[size];
          do
          {
            v76 = ((v73 & ~((uint64_t)v73 >> 63)) - (v73 + (v73 >> 63))) / v75;
            v77 = v72
                + size
                + size
                * (((v72 & ~(v72 >> 63)) - (v72 + ((unint64_t)v72 >> 63))) / v75 + ((unint64_t)v72 >> 63));
            do
              v77 -= size;
            while (v77 >= size);
            v78 = v73 + (v76 + (v73 >> 63)) * size;
            v79 = size + size * ((v73 >> 63) + v76);
            v80 = v73 + v79;
            v81 = v160 + 8 * v78;
            do
            {
              v80 -= size;
              v79 -= size;
              v81 -= 8 * size;
            }
            while ((uint64_t)(v73 + v79) >= size);
            if (v77 >= (uint64_t)(v73 + v79))
              v82 = v73 + v79;
            else
              v82 = v77;
            if (v47 >= v82 + 1)
              v83 = v82 + 1;
            else
              v83 = v47;
            if (v77 < v80)
              v80 = v77;
            if (v47 >= v80 + 1)
              v84 = v80 + 1;
            else
              v84 = v47;
            memmove((void *)(v81 - 8 * v84), &v74[v77] - v83, 8 * v83);
            v72 -= v83;
            v73 -= v83;
            v56 = v47 <= v83;
            v47 -= v83;
          }
          while (!v56);
        }
        else
        {
          v49 = var0 - a4;
          if ((unint64_t)size <= 1)
            v50 = 1;
          else
            v50 = size;
          do
          {
            v51 = var0
                + size
                + size
                * (((var0 & ~(var0 >> 63)) - (var0 + ((unint64_t)var0 >> 63))) / v50
                 + ((unint64_t)var0 >> 63));
            do
              v51 -= size;
            while (v51 >= size);
            v52 = v49
                + size
                + size
                * (((unint64_t)v49 >> 63) + ((v49 & ~(v49 >> 63)) - (v49 + ((unint64_t)v49 >> 63))) / v50);
            do
              v52 -= size;
            while (v52 >= size);
            if (v52 <= v51)
              v53 = v51;
            else
              v53 = v52;
            v54 = size - v53;
            if (v47 >= v54)
              v55 = v54;
            else
              v55 = v47;
            memmove(&v48[v52], &v48[v51], 8 * v55);
            var0 += v55;
            v49 += v55;
            v56 = v47 <= v55;
            v47 -= v55;
          }
          while (!v56);
        }
      }
      v85 = v159->var0 + size - a4;
      v159->var0 = v85;
      if (v85 >= size)
        v159->var0 = v85 - size;
    }
    v94 = 0;
    v95 = v159;
    v96 = v159->size;
    v97 = (unint64_t)&v159->list[v96];
    v98 = v157;
    v99 = (unint64_t)(&v95->list[v95->var0] + v158);
    v100 = -v96;
    do
    {
      if (v97 <= v99)
        v101 = v100;
      else
        v101 = 0;
      v102 = (const void **)(v99 + 8 * v101);
      v103 = a3[v94];
      if (*v102 != v103)
        *v102 = v103;
      v99 = (unint64_t)(v102 + 1);
      ++v94;
    }
    while (a4 > v94);
    v95->state.var0.used = v98;
  }
  else
  {
    v22 = p_storage->list;
    v23 = (unint64_t)((double)used * 1.61803399);
    if (v23 <= v21)
      LODWORD(v23) = used + a4;
    v24 = malloc_good_size(8 * v23);
    if (HIDWORD(v24))
      -[__NSArrayM insertObjects:count:atIndex:].cold.1();
    v25 = v24;
    v26 = (offset **)malloc_type_malloc(v24, 0xB9DF98CuLL);
    v27 = v26;
    if (v22)
    {
      v159 = p_storage;
      if (a5 && v26)
      {
        v28 = p_storage;
        v29 = p_storage->list;
        p_var0 = &v28->var0;
        v31 = v28->var0;
        v30 = p_var0[1];
        v33 = &v29[v30];
        v34 = &v29[v31];
        v35 = -v30;
        if (v30 <= v31)
          v36 = -v30;
        else
          v36 = 0;
        v37 = a5;
        v38 = &v34[v36];
        v158 = v37;
        v39 = v26;
        switch(v37)
        {
          case 1uLL:
            goto LABEL_152;
          case 2uLL:
            goto LABEL_148;
          case 3uLL:
            goto LABEL_144;
          case 4uLL:
            goto LABEL_140;
          default:
            if (v33 - v38 >= v158)
              v104 = v158;
            else
              v104 = v33 - v38;
            v105 = v104;
            if ((_DWORD)v104)
            {
              v160 = v35;
              v155 = v104;
              v156 = v104;
              memmove(v26, v38, 8 * v104);
              LODWORD(v104) = v155;
              v105 = v156;
              v35 = v160;
            }
            if ((_DWORD)v158 != (_DWORD)v104)
            {
              v106 = v29;
              v107 = v35;
              memmove(&v27[v105], v106, 8 * (v158 - v104));
              v35 = v107;
            }
LABEL_140:
            v109 = *v38;
            v108 = v38 + 1;
            *v27 = v109;
            v39 = v27 + 1;
            if (v33 <= v108)
              v110 = v35;
            else
              v110 = 0;
            v38 = &v108[v110];
LABEL_144:
            v112 = *v38;
            v111 = v38 + 1;
            *v39++ = v112;
            if (v33 <= v111)
              v113 = v35;
            else
              v113 = 0;
            v38 = &v111[v113];
LABEL_148:
            v115 = *v38;
            v114 = v38 + 1;
            *v39++ = v115;
            if (v33 <= v114)
              v116 = v35;
            else
              v116 = 0;
            v38 = &v114[v116];
LABEL_152:
            *v39 = *v38;
            a5 = v158;
            p_storage = v159;
            break;
        }
      }
      v117 = a5;
      v118 = &v27[a5];
      memmove(v118, a3, 8 * a4);
      v119 = used - v117;
      if (v119)
      {
        v120 = (char *)&v118[a4];
        v121 = p_storage->list;
        v122 = p_storage->size;
        v123 = (unint64_t)&p_storage->list[v122];
        v124 = (unint64_t)(&p_storage->list[p_storage->var0] + v117);
        v125 = -v122;
        if (v123 <= v124)
          v126 = -v122;
        else
          v126 = 0;
        v127 = (uint64_t *)(v124 + 8 * v126);
        switch(v119)
        {
          case 1uLL:
            goto LABEL_176;
          case 2uLL:
            goto LABEL_172;
          case 3uLL:
            goto LABEL_168;
          case 4uLL:
            goto LABEL_164;
          default:
            v128 = (uint64_t)(v123 - (_QWORD)v127) >> 3;
            if (v128 >= v119)
              v128 = v119;
            v129 = v128;
            if ((_DWORD)v128)
            {
              v160 = v128;
              v158 = v128;
              memmove(v120, v127, 8 * v128);
              LODWORD(v128) = v158;
              v129 = v160;
            }
            v130 = v119 - v128;
            if (v130)
              memmove(&v120[8 * v129], v121, 8 * v130);
LABEL_164:
            v132 = *v127;
            v131 = v127 + 1;
            *(_QWORD *)v120 = v132;
            v120 += 8;
            if (v123 <= (unint64_t)v131)
              v133 = v125;
            else
              v133 = 0;
            v127 = &v131[v133];
LABEL_168:
            v135 = *v127;
            v134 = v127 + 1;
            *(_QWORD *)v120 = v135;
            v120 += 8;
            if (v123 <= (unint64_t)v134)
              v136 = v125;
            else
              v136 = 0;
            v127 = &v134[v136];
LABEL_172:
            v138 = *v127;
            v137 = v127 + 1;
            *(_QWORD *)v120 = v138;
            v120 += 8;
            if (v123 <= (unint64_t)v137)
              v139 = v125;
            else
              v139 = 0;
            v127 = &v137[v139];
LABEL_176:
            *(_QWORD *)v120 = *v127;
            p_storage = v159;
            break;
        }
      }
    }
    else
    {
      memmove(v26, a3, 8 * a4);
    }
    bzero(&v27[v21], v25 - 8 * v21);
    p_storage->list = v27;
    p_storage->var0 = 0;
    p_storage->size = v25 >> 3;
    p_storage->state.var0.used = v21;
    free(v22);
  }
}

- (id)mutableCopy
{
  uint64_t v2;
  unint64_t *p_cow;
  _WORD *v6;
  objc_class *v8;
  id v9;
  os_unfair_lock_s *v10;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableArray);
  p_cow = (unint64_t *)&self->cow;
  if (!atomic_load((unint64_t *)&self->cow))
  {
    v6 = _cow_create((uint64_t)self, 1);
    while (!__ldaxr(p_cow))
    {
      if (!__stlxr((unint64_t)v6, p_cow))
        goto LABEL_9;
    }
    __clrex();
    free(v6);
  }
LABEL_9:
  v8 = (objc_class *)objc_opt_self();
  v9 = __CFAllocateObject(v8, 0);
  v10 = (os_unfair_lock_s *)atomic_load((unint64_t *)&self->cow);
  _cow_copy((uint64_t)self, 1, v10, (uint64_t)__NSArray_cowCallbacks, (uint64_t)v9, 1);
  return v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v3;
  unint64_t *p_cow;
  _WORD *v7;
  objc_class *v9;
  id v10;
  os_unfair_lock_s *v11;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  p_cow = (unint64_t *)&self->cow;
  if (!atomic_load((unint64_t *)&self->cow))
  {
    v7 = _cow_create((uint64_t)self, 1);
    while (!__ldaxr(p_cow))
    {
      if (!__stlxr((unint64_t)v7, p_cow))
        goto LABEL_9;
    }
    __clrex();
    free(v7);
  }
LABEL_9:
  v9 = (objc_class *)objc_opt_self();
  v10 = __CFAllocateObject(v9, 0);
  v11 = (os_unfair_lock_s *)atomic_load((unint64_t *)&self->cow);
  _cow_copy((uint64_t)self, 1, v11, (uint64_t)__NSArray_cowCallbacks, (uint64_t)v10, 1);
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v3, __CFTSANTagMutableArray);
  return (id)__NSArrayM_copy((uint64_t)self);
}

- (void)removeAllObjects
{
  _cow_failure(CFSTR("Attempting to mutate immutable collection!"));
}

- (id)copy
{
  uint64_t v2;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableArray);
  return (id)__NSArrayM_copy((uint64_t)self);
}

- (void)setObject:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v8;
  $572E31AB9BCA8F739E7041A7602167BE *p_storage;
  unsigned int muts;
  unsigned int v11;
  unint64_t used;
  size_t v14;
  unsigned int v15;
  offset **list;
  double v17;
  size_t v18;
  offset **v19;
  offset **v20;
  uint64_t var0;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  int v25;
  id v26;
  offset **v27;
  unsigned int size;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  NSException *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  NSException *v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  v8 = atomic_load((unint64_t *)&self->cow);
  p_storage = &self->storage;
  muts = self->storage.state.var0.muts;
  if (muts >> 9 < 0x7D)
    v11 = muts + 1;
  else
    v11 = 0;
  if (v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v8);
    if (!*(_WORD *)(v8 + 6))
      -[__NSArrayM setObject:atIndex:].cold.2();
    if (*(_WORD *)(v8 + 6) != 1 || *(_WORD *)(v8 + 4) != 0)
    {
      --*(_WORD *)(v8 + 6);
      _cow_mutate_slow((uint64_t)self, v8, (uint64_t)__NSArray_cowCallbacks);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v8);
  }
  self->storage.state.var0.muts = v11;
  if (!a3)
  {
    v33 = _os_log_pack_size();
    v35 = (char *)v47 - ((MEMORY[0x1E0C80A78](v33, v34) + 15) & 0xFFFFFFFFFFFFFFF0);
    v36 = _os_log_pack_fill();
    *(_DWORD *)v36 = 136315138;
    *(_QWORD *)(v36 + 4) = "-[__NSArrayM setObject:atIndex:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: object cannot be nil"), "-[__NSArrayM setObject:atIndex:]");
    v37 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v35, v33);
    objc_exception_throw(v37);
  }
  used = self->storage.state.var0.used;
  if ((a4 & 0x8000000000000000) != 0 || used < a4)
  {
    if (self->storage.state.var0.used)
    {
      v42 = self->storage.state.var0.used;
      v38 = _os_log_pack_size();
      v40 = (char *)v47 - ((MEMORY[0x1E0C80A78](v38, v43) + 15) & 0xFFFFFFFFFFFFFFF0);
      v44 = _os_log_pack_fill();
      v45 = __os_log_helper_1_2_3_8_32_8_0_8_0(v44, (uint64_t)"-[__NSArrayM setObject:atIndex:]", a4, --v42);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v45, "-[__NSArrayM setObject:atIndex:]", a4, v42);
    }
    else
    {
      v38 = _os_log_pack_size();
      v40 = (char *)v47 - ((MEMORY[0x1E0C80A78](v38, v39) + 15) & 0xFFFFFFFFFFFFFFF0);
      v41 = _os_log_pack_fill();
      *(_DWORD *)v41 = 136315394;
      *(_QWORD *)(v41 + 4) = "-[__NSArrayM setObject:atIndex:]";
      *(_WORD *)(v41 + 12) = 2048;
      *(_QWORD *)(v41 + 14) = a4;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty array"), "-[__NSArrayM setObject:atIndex:]", a4);
    }
    v46 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v40, v38);
    objc_exception_throw(v46);
  }
  if ((_DWORD)used == (_DWORD)a4)
  {
    LODWORD(v14) = self->storage.size;
    v15 = used + 1;
    if (v14 < (int)used + 1)
    {
      list = p_storage->list;
      v17 = (double)used * 1.625;
      if (v17 <= (double)v15)
        v17 = (double)v15;
      v18 = malloc_good_size(8 * v17);
      v19 = (offset **)malloc_type_malloc(v18, 0x5944B39DuLL);
      if (!v19)
        -[__NSArrayM setObject:atIndex:].cold.1();
      v20 = v19;
      var0 = p_storage->var0;
      if ((int)v14 - (int)var0 >= used)
        v22 = used;
      else
        v22 = v14 - var0;
      memmove(v19, &list[var0], 8 * v22);
      memmove(&v20[v22], list, 8 * (used - v22));
      bzero(&v20[used], v18 - 8 * used);
      free(list);
      p_storage->list = v20;
      v14 = v18 >> 3;
      p_storage->var0 = 0;
      p_storage->size = v18 >> 3;
    }
    v23 = p_storage->var0;
    ++p_storage->state.var0.used;
    v24 = v23 + used;
    if (v14 <= v24)
      v25 = v14;
    else
      v25 = 0;
    p_storage->list[v24 - v25] = (offset *)a3;
    if (((unint64_t)a3 & 0x8000000000000000) == 0)
      v26 = a3;
  }
  else
  {
    v27 = p_storage->list;
    size = p_storage->size;
    v29 = p_storage->var0 + a4;
    if (size > v29)
      size = 0;
    v30 = v29 - size;
    v31 = (uint64_t)v27[v30];
    if ((id)v31 != a3)
    {
      if (((unint64_t)a3 & 0x8000000000000000) == 0)
      {
        v32 = a3;
        v31 = (uint64_t)v27[v30];
      }
      v27[v30] = (offset *)a3;
      if (v31 >= 1)

    }
  }
}

- (void)setObject:(id)a3 atIndexedSubscript:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v8;
  $572E31AB9BCA8F739E7041A7602167BE *p_storage;
  unsigned int muts;
  unsigned int v11;
  unint64_t used;
  size_t v14;
  unsigned int v15;
  offset **list;
  double v17;
  size_t v18;
  offset **v19;
  offset **v20;
  uint64_t var0;
  unsigned int v22;
  unsigned int v23;
  unsigned int v24;
  int v25;
  id v26;
  offset **v27;
  unsigned int size;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  NSException *v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  NSException *v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  v8 = atomic_load((unint64_t *)&self->cow);
  p_storage = &self->storage;
  muts = self->storage.state.var0.muts;
  if (muts >> 9 < 0x7D)
    v11 = muts + 1;
  else
    v11 = 0;
  if (v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v8);
    if (!*(_WORD *)(v8 + 6))
      -[__NSArrayM setObject:atIndexedSubscript:].cold.2();
    if (*(_WORD *)(v8 + 6) != 1 || *(_WORD *)(v8 + 4) != 0)
    {
      --*(_WORD *)(v8 + 6);
      _cow_mutate_slow((uint64_t)self, v8, (uint64_t)__NSArray_cowCallbacks);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v8);
  }
  self->storage.state.var0.muts = v11;
  if (!a3)
  {
    v33 = _os_log_pack_size();
    v35 = (char *)v47 - ((MEMORY[0x1E0C80A78](v33, v34) + 15) & 0xFFFFFFFFFFFFFFF0);
    v36 = _os_log_pack_fill();
    *(_DWORD *)v36 = 136315138;
    *(_QWORD *)(v36 + 4) = "-[__NSArrayM setObject:atIndexedSubscript:]";
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: object cannot be nil"), "-[__NSArrayM setObject:atIndexedSubscript:]");
    v37 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSInvalidArgumentException"), _CFAutoreleasePoolAddObject(), 0, v35, v33);
    objc_exception_throw(v37);
  }
  used = self->storage.state.var0.used;
  if ((a4 & 0x8000000000000000) != 0 || used < a4)
  {
    if (self->storage.state.var0.used)
    {
      v42 = self->storage.state.var0.used;
      v38 = _os_log_pack_size();
      v40 = (char *)v47 - ((MEMORY[0x1E0C80A78](v38, v43) + 15) & 0xFFFFFFFFFFFFFFF0);
      v44 = _os_log_pack_fill();
      v45 = __os_log_helper_1_2_3_8_32_8_0_8_0(v44, (uint64_t)"-[__NSArrayM setObject:atIndexedSubscript:]", a4, --v42);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v45, "-[__NSArrayM setObject:atIndexedSubscript:]", a4, v42);
    }
    else
    {
      v38 = _os_log_pack_size();
      v40 = (char *)v47 - ((MEMORY[0x1E0C80A78](v38, v39) + 15) & 0xFFFFFFFFFFFFFFF0);
      v41 = _os_log_pack_fill();
      *(_DWORD *)v41 = 136315394;
      *(_QWORD *)(v41 + 4) = "-[__NSArrayM setObject:atIndexedSubscript:]";
      *(_WORD *)(v41 + 12) = 2048;
      *(_QWORD *)(v41 + 14) = a4;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty array"), "-[__NSArrayM setObject:atIndexedSubscript:]", a4);
    }
    v46 = +[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), _CFAutoreleasePoolAddObject(), 0, v40, v38);
    objc_exception_throw(v46);
  }
  if ((_DWORD)used == (_DWORD)a4)
  {
    LODWORD(v14) = self->storage.size;
    v15 = used + 1;
    if (v14 < (int)used + 1)
    {
      list = p_storage->list;
      v17 = (double)used * 1.625;
      if (v17 <= (double)v15)
        v17 = (double)v15;
      v18 = malloc_good_size(8 * v17);
      v19 = (offset **)malloc_type_malloc(v18, 0x5944B39DuLL);
      if (!v19)
        -[__NSArrayM setObject:atIndexedSubscript:].cold.1();
      v20 = v19;
      var0 = p_storage->var0;
      if ((int)v14 - (int)var0 >= used)
        v22 = used;
      else
        v22 = v14 - var0;
      memmove(v19, &list[var0], 8 * v22);
      memmove(&v20[v22], list, 8 * (used - v22));
      bzero(&v20[used], v18 - 8 * used);
      free(list);
      p_storage->list = v20;
      v14 = v18 >> 3;
      p_storage->var0 = 0;
      p_storage->size = v18 >> 3;
    }
    v23 = p_storage->var0;
    ++p_storage->state.var0.used;
    v24 = v23 + used;
    if (v14 <= v24)
      v25 = v14;
    else
      v25 = 0;
    p_storage->list[v24 - v25] = (offset *)a3;
    if (((unint64_t)a3 & 0x8000000000000000) == 0)
      v26 = a3;
  }
  else
  {
    v27 = p_storage->list;
    size = p_storage->size;
    v29 = p_storage->var0 + a4;
    if (size > v29)
      size = 0;
    v30 = v29 - size;
    v31 = (uint64_t)v27[v30];
    if ((id)v31 != a3)
    {
      if (((unint64_t)a3 & 0x8000000000000000) == 0)
      {
        v32 = a3;
        v31 = (uint64_t)v27[v30];
      }
      v27[v30] = (offset *)a3;
      if (v31 >= 1)

    }
  }
}

- (void)exchangeObjectAtIndex:(unint64_t)a3 withObjectAtIndex:(unint64_t)a4
{
  uint64_t v4;
  uint64_t v8;
  $572E31AB9BCA8F739E7041A7602167BE *p_storage;
  unsigned int muts;
  unsigned int v11;
  unint64_t used;
  unsigned int var0;
  unsigned int size;
  unsigned int v16;
  int v17;
  offset **list;
  unsigned int v19;
  unsigned int v20;
  offset *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  if (__cf_tsanWriteFunction)
    __cf_tsanWriteFunction(self, v4, __CFTSANTagMutableArray);
  v8 = atomic_load((unint64_t *)&self->cow);
  p_storage = &self->storage;
  muts = self->storage.state.var0.muts;
  if (muts >> 9 < 0x7D)
    v11 = muts + 1;
  else
    v11 = 0;
  if (v8)
  {
    os_unfair_lock_lock((os_unfair_lock_t)v8);
    if (!*(_WORD *)(v8 + 6))
      -[__NSArrayM exchangeObjectAtIndex:withObjectAtIndex:].cold.1();
    if (*(_WORD *)(v8 + 6) != 1 || *(_WORD *)(v8 + 4) != 0)
    {
      --*(_WORD *)(v8 + 6);
      _cow_mutate_slow((uint64_t)self, v8, (uint64_t)__NSArray_cowCallbacks);
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v8);
  }
  self->storage.state.var0.muts = v11;
  used = self->storage.state.var0.used;
  if ((a3 & 0x8000000000000000) != 0 || used <= a3)
  {
    v22 = _os_log_pack_size();
    v24 = (char *)v37 - ((MEMORY[0x1E0C80A78](v22, v23) + 15) & 0xFFFFFFFFFFFFFFF0);
    v25 = _os_log_pack_fill();
    if ((_DWORD)used)
    {
      v35 = used - 1;
      v36 = __os_log_helper_1_2_3_8_32_8_0_8_0(v25, (uint64_t)"-[__NSArrayM exchangeObjectAtIndex:withObjectAtIndex:]", a3, v35);
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v36, "-[__NSArrayM exchangeObjectAtIndex:withObjectAtIndex:]", a3, v35);
    }
    else
    {
      *(_DWORD *)v25 = 136315394;
      *(_QWORD *)(v25 + 4) = "-[__NSArrayM exchangeObjectAtIndex:withObjectAtIndex:]";
      *(_WORD *)(v25 + 12) = 2048;
      *(_QWORD *)(v25 + 14) = a3;
      CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds for empty array"), "-[__NSArrayM exchangeObjectAtIndex:withObjectAtIndex:]", a3);
    }
    v32 = _CFAutoreleasePoolAddObject();
    v33 = v24;
    v34 = v22;
LABEL_32:
    objc_exception_throw(+[NSException exceptionWithName:reason:userInfo:osLogPack:size:](NSException, "exceptionWithName:reason:userInfo:osLogPack:size:", CFSTR("NSRangeException"), v32, 0, v33, v34));
  }
  if ((a4 & 0x8000000000000000) != 0 || used <= a4)
  {
    v26 = _os_log_pack_size();
    v28 = (char *)v37 - ((MEMORY[0x1E0C80A78](v26, v27) + 15) & 0xFFFFFFFFFFFFFFF0);
    v29 = _os_log_pack_fill();
    v30 = used - 1;
    v31 = __os_log_helper_1_2_3_8_32_8_0_8_0(v29, (uint64_t)"-[__NSArrayM exchangeObjectAtIndex:withObjectAtIndex:]", a4, v30);
    CFStringCreateWithFormat((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, CFSTR("*** %s: index %lu beyond bounds [0 .. %lu]"), v31, "-[__NSArrayM exchangeObjectAtIndex:withObjectAtIndex:]", a4, v30);
    v32 = _CFAutoreleasePoolAddObject();
    v33 = v28;
    v34 = v26;
    goto LABEL_32;
  }
  if (a3 != a4)
  {
    var0 = self->storage.var0;
    size = self->storage.size;
    if (size <= var0 + a3)
      v16 = self->storage.size;
    else
      v16 = 0;
    v17 = var0 + a3 - v16;
    list = p_storage->list;
    v19 = var0 + a4;
    if (size > v19)
      size = 0;
    v20 = v19 - size;
    v21 = list[v20];
    list[v20] = p_storage->list[v17];
    list[v17] = v21;
  }
}

- (id)allObjects
{
  uint64_t v2;

  if (__cf_tsanReadFunction)
    __cf_tsanReadFunction(self, v2, __CFTSANTagMutableArray);
  return (id)__NSArrayM_copy((uint64_t)self);
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  return 0;
}

- (void)insertObject:atIndex:.cold.1()
{
  qword_1EDCD1038 = (uint64_t)"failure to grow array";
  __break(1u);
}

- (void)insertObject:atIndex:.cold.2()
{
  _cow_failure(CFSTR("Attempting to mutate immutable collection!"));
}

- (void)replaceObjectAtIndex:withObject:.cold.1()
{
  _cow_failure(CFSTR("Attempting to mutate immutable collection!"));
}

- (void)exchangeObjectAtIndex:withObjectAtIndex:.cold.1()
{
  _cow_failure(CFSTR("Attempting to mutate immutable collection!"));
}

- (void)insertObjects:count:atIndex:.cold.1()
{
  qword_1EDCD1038 = (uint64_t)"size unreasonably big";
  __break(1u);
}

- (void)insertObjects:count:atIndex:.cold.2()
{
  _cow_failure(CFSTR("Attempting to mutate immutable collection!"));
}

- (void)removeObjectsInRange:.cold.1()
{
  qword_1EDCD1038 = (uint64_t)"size unreasonably big";
  __break(1u);
}

- (void)removeObjectsInRange:.cold.2()
{
  _cow_failure(CFSTR("Attempting to mutate immutable collection!"));
}

- (void)setObject:atIndex:.cold.1()
{
  qword_1EDCD1038 = (uint64_t)"failure to grow array";
  __break(1u);
}

- (void)setObject:atIndex:.cold.2()
{
  _cow_failure(CFSTR("Attempting to mutate immutable collection!"));
}

- (void)setObject:atIndexedSubscript:.cold.1()
{
  qword_1EDCD1038 = (uint64_t)"failure to grow array";
  __break(1u);
}

- (void)setObject:atIndexedSubscript:.cold.2()
{
  _cow_failure(CFSTR("Attempting to mutate immutable collection!"));
}

@end
