@implementation HapticCommandConverter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverConfig, 0);
}

- (HapticCommandConverter)initWithServerConfig:(id)a3
{
  id v5;
  HapticCommandConverter *v6;
  HapticCommandConverter *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HapticCommandConverter;
  v6 = -[HapticCommandConverter init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_serverConfig, a3);

  return v7;
}

- (id)eventForEventEntry:(id)a3 engine:(id)a4 privileged:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  float v16;
  float v17;
  id v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  int v22;
  __CFString *v23;
  __CFString *v24;
  void *v25;
  int v26;
  uint64_t v27;
  id v28;
  void *v29;
  int v30;
  NSObject *v31;
  id v32;
  void *v34;
  int v35;
  const CALog::Scope *v36;
  uint64_t v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  int v41;
  const CALog::Scope *v42;
  const CALog::Scope *v43;
  const CALog::Scope *v44;
  NSObject *v45;
  NSObject *v46;
  double v47;
  uint64_t v48;
  double v49;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  int v53;
  NSObject *v54;
  NSObject *v55;
  id v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  int v61;
  const CALog::Scope *v62;
  NSObject *v63;
  void *v64;
  int v65;
  const char *v66;
  __int16 v67;
  int v68;
  __int16 v69;
  const char *v70;
  __int16 v71;
  double v72;
  uint64_t v73;

  v5 = a5;
  v73 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "eventParameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "relativeTime");
  v12 = v11;
  objc_msgSend(v8, "duration");
  v14 = v13;
  objc_msgSend(v9, "serverConfig");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "hapticContinuousTimeLimit");
  v17 = v16;

  if (kHAPIScope)
  {
    if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
    {
      v18 = *(id *)kHAPIScope;
      if (v18)
      {
        v19 = v18;
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v8, "type");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = 136315906;
          v66 = "HapticCommandConverter.mm";
          v67 = 1024;
          v68 = 479;
          v69 = 2080;
          v70 = "-[HapticCommandConverter eventForEventEntry:engine:privileged:]";
          v71 = 2112;
          v72 = *(double *)&v20;
          _os_log_impl(&dword_1B573F000, v19, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Event type '%@':", (uint8_t *)&v65, 0x26u);

        }
      }
    }
  }
  if (v12 < 0.0)
  {
    if (kHAPIScope)
    {
      v21 = *(id *)kHAPIScope;
      if (!v21)
      {
        v22 = -4822;
        v23 = CFSTR("Illegal time value");
        v24 = CFSTR("CoreHapticInvalidEventTimeException");
        goto LABEL_35;
      }
    }
    else
    {
      v21 = MEMORY[0x1E0C81028];
      v28 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v65 = 136315906;
      v66 = "HapticCommandConverter.mm";
      v67 = 1024;
      v68 = 481;
      v69 = 2080;
      v70 = "-[HapticCommandConverter eventForEventEntry:engine:privileged:]";
      v71 = 2048;
      v72 = v12;
      _os_log_impl(&dword_1B573F000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Illegal time value: %f", (uint8_t *)&v65, 0x26u);
    }
    v22 = -4822;
    v23 = CFSTR("Illegal time value");
    v24 = CFSTR("CoreHapticInvalidEventTimeException");
    goto LABEL_34;
  }
  if (v14 < 0.0)
  {
    if (kHAPIScope)
    {
      v21 = *(id *)kHAPIScope;
      if (!v21)
      {
        v22 = -4823;
        v23 = CFSTR("Illegal event duration");
        v24 = CFSTR("CoreHapticInvalidEventDurationException");
        goto LABEL_35;
      }
    }
    else
    {
      v21 = MEMORY[0x1E0C81028];
      v32 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v65 = 136315906;
      v66 = "HapticCommandConverter.mm";
      v67 = 1024;
      v68 = 486;
      v69 = 2080;
      v70 = "-[HapticCommandConverter eventForEventEntry:engine:privileged:]";
      v71 = 2048;
      v72 = v14;
      _os_log_impl(&dword_1B573F000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Illegal duration value: %f", (uint8_t *)&v65, 0x26u);
    }
    v22 = -4823;
    v23 = CFSTR("Illegal event duration");
    v24 = CFSTR("CoreHapticInvalidEventDurationException");
LABEL_34:

LABEL_35:
    Haptic_RaiseException(&v24->isa, &v23->isa, v22);
  }
  objc_msgSend(v8, "type");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isEqualToString:", CHHapticEventTypeHapticTransient);

  if (!v26)
  {
    objc_msgSend(v8, "type");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "isEqualToString:", CHHapticEventTypeHapticContinuous);

    if (!v30)
    {
      objc_msgSend(v8, "type");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "isEqualToString:", CHHapticEventTypeAudioContinuous);

      if (v35)
      {
        v37 = -[HapticCommandConverter eventTypeForBuiltInAudioEventType:](self, "eventTypeForBuiltInAudioEventType:", 32513);
        if (v10 && objc_msgSend(v10, "indexOfObjectPassingTest:", &__block_literal_global_30) != 0x7FFFFFFFFFFFFFFFLL)
        {
          v37 = -[HapticCommandConverter eventTypeForBuiltInAudioEventType:](self, "eventTypeForBuiltInAudioEventType:", 32514);
        }
        else if (v14 == 0.0)
        {
          CALog::LogObjIfEnabled((CALog *)1, kHAPIScope, v36);
          v38 = objc_claimAutoreleasedReturnValue();
          v39 = v38;
          if (v38 && os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            v65 = 136315650;
            v66 = "HapticCommandConverter.mm";
            v67 = 1024;
            v68 = 535;
            v69 = 2080;
            v70 = "-[HapticCommandConverter eventForEventEntry:engine:privileged:]";
            _os_log_impl(&dword_1B573F000, v39, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Continuous audio event has a missing or zero-length duration", (uint8_t *)&v65, 0x1Cu);
          }

          Haptic_RaiseException(CFSTR("CoreHapticInvalidEventDurationException"), CFSTR("Illegal or missing event duration"), -4823);
        }
      }
      else
      {
        objc_msgSend(v8, "type");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "isEqualToString:", CHHapticEventTypeAudioCustom);

        if (!v41)
        {
          if (v5)
          {
            objc_msgSend(v8, "type");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = objc_msgSend(v52, "isEqualToString:", CHHapticEventTypeWheelsOfTime);

            if (v53)
            {
              -[HapticCommandConverter eventForSPIEventType:time:eventParams:duration:](self, "eventForSPIEventType:time:eventParams:duration:", -[HapticCommandConverter eventTypeForBuiltInAudioEventType:](self, "eventTypeForBuiltInAudioEventType:", 32556), v10, v12, v14);
              v27 = objc_claimAutoreleasedReturnValue();
              goto LABEL_79;
            }
            objc_msgSend(v8, "type");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = objc_msgSend(v60, "isEqualToString:", CHHapticEventTypeAudioClick);

            if (v61)
            {
              -[HapticCommandConverter eventForSPIEventType:time:eventParams:duration:](self, "eventForSPIEventType:time:eventParams:duration:", -[HapticCommandConverter eventTypeForBuiltInAudioEventType:](self, "eventTypeForBuiltInAudioEventType:", 32555), v10, v12, v14);
              v27 = objc_claimAutoreleasedReturnValue();
              goto LABEL_79;
            }
            CALog::LogObjIfEnabled((CALog *)1, kHAPIScope, v62);
            v63 = objc_claimAutoreleasedReturnValue();
            v21 = v63;
            if (v63)
            {
              v21 = v63;
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v8, "type");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                v65 = 136315906;
                v66 = "HapticCommandConverter.mm";
                v67 = 1024;
                v68 = 573;
                v69 = 2080;
                v70 = "-[HapticCommandConverter eventForEventEntry:engine:privileged:]";
                v71 = 2112;
                v72 = *(double *)&v64;
                _os_log_impl(&dword_1B573F000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unknown privileged event type: %@", (uint8_t *)&v65, 0x26u);

              }
            }
            v22 = -4821;
            v23 = CFSTR("Unknown privileged event type");
          }
          else
          {
            CALog::LogObjIfEnabled((CALog *)1, kHAPIScope, v42);
            v58 = objc_claimAutoreleasedReturnValue();
            v21 = v58;
            if (v58)
            {
              v21 = v58;
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v8, "type");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                v65 = 136315906;
                v66 = "HapticCommandConverter.mm";
                v67 = 1024;
                v68 = 579;
                v69 = 2080;
                v70 = "-[HapticCommandConverter eventForEventEntry:engine:privileged:]";
                v71 = 2112;
                v72 = *(double *)&v59;
                _os_log_impl(&dword_1B573F000, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unknown event type: %@", (uint8_t *)&v65, 0x26u);

              }
            }
            v22 = -4821;
            v23 = CFSTR("Unknown event type");
          }
          v24 = CFSTR("CoreHapticInvalidEventTypeException");
          goto LABEL_34;
        }
        v37 = objc_msgSend(v8, "audioResID");
        if (v37 == -1
          || !+[CHHapticEngine resourceIsRegistered:](CHHapticEngine, "resourceIsRegistered:", v37))
        {
          CALog::LogObjIfEnabled((CALog *)1, kHAPIScope, v43);
          v54 = objc_claimAutoreleasedReturnValue();
          v55 = v54;
          if (v54 && os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
          {
            v65 = 136315906;
            v66 = "HapticCommandConverter.mm";
            v67 = 1024;
            v68 = 559;
            v69 = 2080;
            v70 = "-[HapticCommandConverter eventForEventEntry:engine:privileged:]";
            v71 = 1024;
            LODWORD(v72) = v37;
            _os_log_impl(&dword_1B573F000, v55, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Invalid or missing audio resource with ID %u", (uint8_t *)&v65, 0x22u);
          }

          Haptic_RaiseException(CFSTR("CoreHapticInvalidAudioResourceException"), CFSTR("Invalid or missing audio resource"), -4824);
        }
        if (v14 == 0.0 && objc_msgSend(v9, "isResourceLoopEnabled:", v37))
        {
          CALog::LogObjIfEnabled((CALog *)1, kHAPIScope, v44);
          v45 = objc_claimAutoreleasedReturnValue();
          v46 = v45;
          if (v45 && os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            v65 = 136315906;
            v66 = "HapticCommandConverter.mm";
            v67 = 1024;
            v68 = 548;
            v69 = 2080;
            v70 = "-[HapticCommandConverter eventForEventEntry:engine:privileged:]";
            v71 = 1024;
            LODWORD(v72) = v37;
            _os_log_impl(&dword_1B573F000, v46, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Audio resource with ID %u has looping enabled but the event does not specify a duration", (uint8_t *)&v65, 0x22u);
          }

          Haptic_RaiseException(CFSTR("CoreHapticInvalidEventDurationException"), CFSTR("Looped custom audio event missing duration"), -4823);
        }
        if (v14 < 0.000000999999997)
        {
          objc_msgSend(v9, "getDurationForResource:", v37);
          objc_msgSend(v8, "setDuration:");
          objc_msgSend(v8, "duration");
          v14 = v47;
        }
      }
      -[HapticCommandConverter eventForAudioEventType:time:eventParams:duration:](self, "eventForAudioEventType:time:eventParams:duration:", v37, v10, v12, v14);
      v27 = objc_claimAutoreleasedReturnValue();
      goto LABEL_79;
    }
    if (v10 && objc_msgSend(v10, "indexOfObjectPassingTest:", &__block_literal_global) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v48 = 2;
    }
    else
    {
      if (v14 == 0.0)
      {
        if (kHAPIScope)
        {
          v31 = *(id *)kHAPIScope;
          if (!v31)
            goto LABEL_76;
        }
        else
        {
          v31 = MEMORY[0x1E0C81028];
          v56 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          v65 = 136315650;
          v66 = "HapticCommandConverter.mm";
          v67 = 1024;
          v68 = 510;
          v69 = 2080;
          v70 = "-[HapticCommandConverter eventForEventEntry:engine:privileged:]";
          _os_log_impl(&dword_1B573F000, v31, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Continuous haptic event has a missing or zero-length duration", (uint8_t *)&v65, 0x1Cu);
        }

LABEL_76:
        Haptic_RaiseException(CFSTR("CoreHapticInvalidEventDurationException"), CFSTR("Illegal or missing event duration"), -4823);
      }
      v48 = 1;
      if (v17 > 0.0)
      {
        v49 = v17;
        if (v14 > v49)
        {
          CALog::LogObjIfEnabled((CALog *)6, kHAPIScope, (const CALog::Scope *)1);
          v50 = objc_claimAutoreleasedReturnValue();
          v51 = v50;
          if (v50 && os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
          {
            v65 = 136315906;
            v66 = "HapticCommandConverter.mm";
            v67 = 1024;
            v68 = 516;
            v69 = 2080;
            v70 = "-[HapticCommandConverter eventForEventEntry:engine:privileged:]";
            v71 = 2048;
            v72 = v49;
            _os_log_impl(&dword_1B573F000, v51, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Haptic event duration capped at %f seconds", (uint8_t *)&v65, 0x26u);
          }

          v48 = 1;
          v14 = v49;
        }
      }
    }
    -[HapticCommandConverter eventForContinuousHapticEventType:time:params:duration:](self, "eventForContinuousHapticEventType:time:params:duration:", v48, v10, v12, v14);
    v27 = objc_claimAutoreleasedReturnValue();
    goto LABEL_79;
  }
  if (v5)
    -[HapticCommandConverter eventForLegacyTransientHapticAtTime:params:duration:](self, "eventForLegacyTransientHapticAtTime:params:duration:", v10, v12, v14);
  else
    -[HapticCommandConverter eventForTransientHapticAtTime:params:duration:](self, "eventForTransientHapticAtTime:params:duration:", v10, v12, v14);
  v27 = objc_claimAutoreleasedReturnValue();
LABEL_79:
  v57 = (void *)v27;

  return v57;
}

- (id)eventForLegacyTransientHapticAtTime:(double)a3 params:(id)a4 duration:(double)a5
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  float v17;
  void *v18;
  int v19;
  int v20;
  int v21;
  void *v22;
  double v23;
  int v24;
  int v25;
  char *v26;
  char *v27;
  void *v28;
  int v29;
  float v30;
  float v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  int v35;
  float v36;
  float v37;
  NSObject *v38;
  char *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  char *v44;
  void *v45;
  int v46;
  char *v47;
  char *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  NSObject *v53;
  void *v54;
  uint64_t v55;
  int v56;
  int v57;
  NSObject *v58;
  NSObject *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  NSObject *v63;
  int v64;
  __CFString *v65;
  id v66;
  id v67;
  id v69;
  id v70;
  id v71;
  void *v72;
  char v73;
  id v74;
  int v75;
  int v76;
  char v77;
  void *v79;
  id obj;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  void *__p;
  char *v86;
  char *v87;
  uint8_t v88[128];
  uint8_t buf[4];
  const char *v90;
  __int16 v91;
  int v92;
  __int16 v93;
  const char *v94;
  __int16 v95;
  double v96;
  __int16 v97;
  double v98;
  __int16 v99;
  int v100;
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v74 = a4;
  if (kHAPIScope)
  {
    if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
    {
      v7 = *(id *)kHAPIScope;
      if (v7)
      {
        v8 = v7;
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136316418;
          v90 = "HapticCommandConverter.mm";
          v91 = 1024;
          v92 = 270;
          v93 = 2080;
          v94 = "-[HapticCommandConverter eventForLegacyTransientHapticAtTime:params:duration:]";
          v95 = 2048;
          v96 = a3;
          v97 = 2048;
          v98 = a5;
          v99 = 1024;
          v100 = objc_msgSend(v74, "count");
          _os_log_impl(&dword_1B573F000, v8, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Time: %.2f secs dur %.2f secs %u event params", buf, 0x36u);
        }

      }
    }
  }
  __p = 0;
  v86 = 0;
  v87 = 0;
  +[CHHapticEngine capabilitiesForHardware](CHHapticEngine, "capabilitiesForHardware");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  obj = v74;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v88, 16);
  if (!v9)
  {

    v57 = 1;
    v56 = 3;
    goto LABEL_90;
  }
  v10 = 0;
  v11 = *(_QWORD *)v82;
  v76 = 3;
  v77 = 0;
  v75 = 1;
  do
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v82 != v11)
        objc_enumerationMutation(obj);
      v13 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v12);
      if (kHAPIScope)
      {
        if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
        {
          v14 = *(id *)kHAPIScope;
          if (v14)
          {
            v15 = v14;
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v13, "parameterID");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "value");
              *(_DWORD *)buf = 136316162;
              v90 = "HapticCommandConverter.mm";
              v91 = 1024;
              v92 = 276;
              v93 = 2080;
              v94 = "-[HapticCommandConverter eventForLegacyTransientHapticAtTime:params:duration:]";
              v95 = 2112;
              v96 = *(double *)&v16;
              v97 = 2048;
              v98 = v17;
              _os_log_impl(&dword_1B573F000, v15, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Fixed Param '%@': value: %f", buf, 0x30u);

            }
          }
        }
      }
      objc_msgSend(v13, "parameterID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToString:", CHHapticEventParameterIDHapticIntensity);

      if (v19)
      {
        objc_msgSend(v13, "value");
        v21 = v20;
        objc_msgSend(v13, "parameterID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v23) = v21;
        -[HapticCommandConverter limitEventParameter:value:parameter:eventType:](self, "limitEventParameter:value:parameter:eventType:", v79, v22, CHHapticEventTypeHapticTransient, v23);
        v25 = v24;

        v26 = v86;
        if (v86 >= v87)
        {
          v39 = (char *)__p;
          v40 = (v86 - (_BYTE *)__p) >> 4;
          v41 = v40 + 1;
          if ((unint64_t)(v40 + 1) >> 60)
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          v42 = v87 - (_BYTE *)__p;
          if ((v87 - (_BYTE *)__p) >> 3 > v41)
            v41 = v42 >> 3;
          if ((unint64_t)v42 >= 0x7FFFFFFFFFFFFFF0)
            v43 = 0xFFFFFFFFFFFFFFFLL;
          else
            v43 = v41;
          if (v43)
          {
            v44 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AVHapticPlayerFixedParameter>>((uint64_t)&v87, v43);
            v39 = (char *)__p;
            v26 = v86;
          }
          else
          {
            v44 = 0;
          }
          v47 = &v44[16 * v40];
          *(_QWORD *)v47 = 2000;
          *((_DWORD *)v47 + 2) = v25;
          v48 = v47;
          if (v26 != v39)
          {
            do
            {
              *((_OWORD *)v48 - 1) = *((_OWORD *)v26 - 1);
              v48 -= 16;
              v26 -= 16;
            }
            while (v26 != v39);
            v39 = (char *)__p;
          }
          v27 = v47 + 16;
          __p = v48;
          v86 = v47 + 16;
          v87 = &v44[16 * v43];
          if (v39)
            operator delete(v39);
        }
        else
        {
          *(_QWORD *)v86 = 2000;
          *((_DWORD *)v26 + 2) = v25;
          v27 = v26 + 16;
        }
        v86 = v27;
        goto LABEL_64;
      }
      objc_msgSend(v13, "parameterID");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "isEqualToString:", CHHapticEventParameterIDHapticSharpnessSelect);

      if (v29)
      {
        if ((v10 & 1) == 0)
        {
          objc_msgSend(v13, "value");
          if (v30 > 1.0)
            v30 = 1.0;
          if (v30 < -1.0)
            v30 = -1.0;
          v31 = (v30 + 1.0) * 0.5;
          v76 = (int)((float)(v31 * 7.0) + 0.5);
          if (kHAPIScope)
          {
            if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
            {
              v32 = *(id *)kHAPIScope;
              if (v32)
              {
                v33 = v32;
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136316162;
                  v90 = "HapticCommandConverter.mm";
                  v91 = 1024;
                  v92 = 291;
                  v93 = 2080;
                  v94 = "-[HapticCommandConverter eventForLegacyTransientHapticAtTime:params:duration:]";
                  v95 = 2048;
                  v96 = v31;
                  v97 = 1024;
                  LODWORD(v98) = (int)((float)(v31 * 7.0) + 0.5);
                  _os_log_impl(&dword_1B573F000, v33, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Normalized value %f -> sharpness index %d", buf, 0x2Cu);
                }
                goto LABEL_44;
              }
            }
          }
          goto LABEL_45;
        }
        if (kHAPIScope)
        {
          v63 = *(id *)kHAPIScope;
          if (!v63)
          {
LABEL_97:
            v64 = -4830;
            v65 = CFSTR("Cannot mix privileged and unprivileged Sharpness parameters");
            goto LABEL_114;
          }
        }
        else
        {
          v63 = MEMORY[0x1E0C81028];
          v66 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v90 = "HapticCommandConverter.mm";
          v91 = 1024;
          v92 = 283;
          v93 = 2080;
          v94 = "-[HapticCommandConverter eventForLegacyTransientHapticAtTime:params:duration:]";
          goto LABEL_104;
        }
        goto LABEL_105;
      }
      objc_msgSend(v13, "parameterID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "isEqualToString:", CHHapticEventParameterIDHapticFullnessSelect);

      if (v35)
      {
        if ((v10 & 1) != 0)
        {
          if (kHAPIScope)
          {
            v63 = *(id *)kHAPIScope;
            if (!v63)
            {
              v64 = -4830;
              v65 = CFSTR("Cannot mix Fullness with unprivileged Sharpness parameter");
              goto LABEL_114;
            }
          }
          else
          {
            v63 = MEMORY[0x1E0C81028];
            v67 = MEMORY[0x1E0C81028];
          }
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315650;
            v90 = "HapticCommandConverter.mm";
            v91 = 1024;
            v92 = 296;
            v93 = 2080;
            v94 = "-[HapticCommandConverter eventForLegacyTransientHapticAtTime:params:duration:]";
            _os_log_impl(&dword_1B573F000, v63, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Cannot mix Fullness with unprivileged Sharpness parameter", buf, 0x1Cu);
          }
          v64 = -4830;
          v65 = CFSTR("Cannot mix Fullness with unprivileged Sharpness parameter");
          goto LABEL_113;
        }
        objc_msgSend(v13, "value");
        if (v36 > 1.0)
          v36 = 1.0;
        if (v36 < -1.0)
          v36 = -1.0;
        v37 = (v36 + 1.0) * 0.5;
        v75 = (int)((float)(v37 + v37) + 0.5);
        if (kHAPIScope)
        {
          if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
          {
            v38 = *(id *)kHAPIScope;
            if (v38)
            {
              v33 = v38;
              if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136316162;
                v90 = "HapticCommandConverter.mm";
                v91 = 1024;
                v92 = 304;
                v93 = 2080;
                v94 = "-[HapticCommandConverter eventForLegacyTransientHapticAtTime:params:duration:]";
                v95 = 2048;
                v96 = v37;
                v97 = 1024;
                LODWORD(v98) = (int)((float)(v37 + v37) + 0.5);
                _os_log_impl(&dword_1B573F000, v33, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Normalized value %f -> fullness index %d", buf, 0x2Cu);
              }
LABEL_44:

            }
          }
        }
LABEL_45:
        v10 = 0;
        v77 = 1;
        goto LABEL_64;
      }
      objc_msgSend(v13, "parameterID");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "isEqualToString:", CHHapticEventParameterIDHapticSharpness);

      if (v46)
      {
        if ((v77 & 1) == 0)
        {
          v77 = 0;
          v10 = 1;
          goto LABEL_64;
        }
        if (kHAPIScope)
        {
          v63 = *(id *)kHAPIScope;
          if (!v63)
            goto LABEL_97;
        }
        else
        {
          v63 = MEMORY[0x1E0C81028];
          v69 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v90 = "HapticCommandConverter.mm";
          v91 = 1024;
          v92 = 309;
          v93 = 2080;
          v94 = "-[HapticCommandConverter eventForLegacyTransientHapticAtTime:params:duration:]";
LABEL_104:
          _os_log_impl(&dword_1B573F000, v63, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Cannot mix privileged and unprivileged Sharpness parameters", buf, 0x1Cu);
        }
LABEL_105:
        v64 = -4830;
        v65 = CFSTR("Cannot mix privileged and unprivileged Sharpness parameters");
        goto LABEL_113;
      }
      objc_msgSend(v13, "parameterID");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v49, "isEqualToString:", CHHapticEventParameterIDAttackTime) & 1) == 0)
      {
        objc_msgSend(v13, "parameterID");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v50, "isEqualToString:", CHHapticEventParameterIDDecayTime) & 1) == 0)
        {
          objc_msgSend(v13, "parameterID");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v51, "isEqualToString:", CHHapticEventParameterIDReleaseTime))
          {
            objc_msgSend(v13, "parameterID");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = objc_msgSend(v54, "isEqualToString:", CHHapticEventParameterIDSustained);

            if ((v73 & 1) == 0)
            {
              if (kHAPIScope)
              {
                v70 = *(id *)kHAPIScope;
                if (!v70)
                {
                  v64 = -4820;
                  v65 = CFSTR("Unknown event parameter type");
LABEL_114:
                  Haptic_RaiseException(CFSTR("CoreHapticsBadEventEntryException"), &v65->isa, v64);
                }
              }
              else
              {
                v70 = (id)MEMORY[0x1E0C81028];
                v71 = MEMORY[0x1E0C81028];
              }
              v63 = v70;
              if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v13, "parameterID");
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 136315906;
                v90 = "HapticCommandConverter.mm";
                v91 = 1024;
                v92 = 324;
                v93 = 2080;
                v94 = "-[HapticCommandConverter eventForLegacyTransientHapticAtTime:params:duration:]";
                v95 = 2112;
                v96 = *(double *)&v72;
                _os_log_impl(&dword_1B573F000, v63, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unknown event parameter type: %@", buf, 0x26u);

              }
              v64 = -4820;
              v65 = CFSTR("Unknown event parameter type");
LABEL_113:

              goto LABEL_114;
            }
            goto LABEL_72;
          }

        }
      }

LABEL_72:
      if (kHAPIScope)
      {
        if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
        {
          v52 = *(id *)kHAPIScope;
          if (v52)
          {
            v53 = v52;
            if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315650;
              v90 = "HapticCommandConverter.mm";
              v91 = 1024;
              v92 = 321;
              v93 = 2080;
              v94 = "-[HapticCommandConverter eventForLegacyTransientHapticAtTime:params:duration:]";
              _os_log_impl(&dword_1B573F000, v53, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Ignoring for HapticTransient", buf, 0x1Cu);
            }

          }
        }
      }
LABEL_64:
      ++v12;
    }
    while (v12 != v9);
    v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v88, 16);
    v9 = v55;
  }
  while (v55);

  v56 = v76;
  v57 = v75;
  if ((v10 & 1) == 0)
  {
LABEL_90:
    if (v86 == __p)
      v61 = 0;
    else
      v61 = __p;
    objc_msgSend(MEMORY[0x1E0CFF740], "eventWithEventType:time:parameters:count:duration:", sLegacyHapticTapTypes[8 * (uint64_t)v57 + v56], v61, (v86 - (_BYTE *)__p) >> 4, a3, a5);
    v60 = objc_claimAutoreleasedReturnValue();
    goto LABEL_94;
  }
  if (kHAPIScope)
  {
    if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
    {
      v58 = *(id *)kHAPIScope;
      if (v58)
      {
        v59 = v58;
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v90 = "HapticCommandConverter.mm";
          v91 = 1024;
          v92 = 333;
          v93 = 2080;
          v94 = "-[HapticCommandConverter eventForLegacyTransientHapticAtTime:params:duration:]";
          _os_log_impl(&dword_1B573F000, v59, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Handling as a non-privileged event", buf, 0x1Cu);
        }

      }
    }
  }
  -[HapticCommandConverter eventForTransientHapticAtTime:params:duration:](self, "eventForTransientHapticAtTime:params:duration:", obj, a3, a5);
  v60 = objc_claimAutoreleasedReturnValue();
LABEL_94:
  v62 = (void *)v60;

  if (__p)
  {
    v86 = (char *)__p;
    operator delete(__p);
  }

  return v62;
}

- (id)eventForTransientHapticAtTime:(double)a3 params:(id)a4 duration:(double)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  float v11;
  float v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  double v19;
  float v20;
  int v21;
  int v22;
  void *v23;
  double v24;
  float v25;
  float v26;
  void *v27;
  char v28;
  void *v29;
  int v30;
  double v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  char v39;
  uint64_t v40;
  NSObject *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  float *v45;
  char *v46;
  char *v47;
  uint64_t v48;
  float *v49;
  float *v50;
  id v51;
  float *v52;
  void *v53;
  id v54;
  NSObject *v55;
  double v56;
  id v58;
  char v59;
  unint64_t v60;
  id obj;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  void *__p;
  char *v68;
  float *v69;
  uint8_t v70[128];
  uint8_t buf[4];
  const char *v72;
  __int16 v73;
  int v74;
  __int16 v75;
  const char *v76;
  __int16 v77;
  double v78;
  __int16 v79;
  double v80;
  __int16 v81;
  int v82;
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v58 = a4;
  if (kHAPIScope)
  {
    if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
    {
      v8 = *(id *)kHAPIScope;
      if (v8)
      {
        v9 = v8;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136316418;
          v72 = "HapticCommandConverter.mm";
          v73 = 1024;
          v74 = 212;
          v75 = 2080;
          v76 = "-[HapticCommandConverter eventForTransientHapticAtTime:params:duration:]";
          v77 = 2048;
          v78 = a3;
          v79 = 2048;
          v80 = a5;
          v81 = 1024;
          v82 = objc_msgSend(v58, "count");
          _os_log_impl(&dword_1B573F000, v9, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Time: %.2f secs dur %.2f secs %u event params", buf, 0x36u);
        }

      }
    }
  }
  __p = 0;
  v68 = 0;
  v69 = 0;
  +[CHHapticEngine capabilitiesForHardware](CHHapticEngine, "capabilitiesForHardware");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[HapticCommandConverter serverConfig](self, "serverConfig");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "defaultHapticTransientEventIntensity");
  v12 = v11;

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = v58;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
  if (v13)
  {
    v60 = 0;
    v59 = 0;
    v14 = *(_QWORD *)v64;
    while (1)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v64 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * v15);
        if (kHAPIScope)
        {
          if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
          {
            v17 = *(id *)kHAPIScope;
            if (v17)
            {
              v18 = v17;
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v16, "parameterID");
                v19 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                objc_msgSend(v16, "value");
                *(_DWORD *)buf = 136316162;
                v72 = "HapticCommandConverter.mm";
                v73 = 1024;
                v74 = 221;
                v75 = 2080;
                v76 = "-[HapticCommandConverter eventForTransientHapticAtTime:params:duration:]";
                v77 = 2112;
                v78 = v19;
                v79 = 2048;
                v80 = v20;
                _os_log_impl(&dword_1B573F000, v18, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Fixed Param '%@': value: %f", buf, 0x30u);

              }
            }
          }
        }
        objc_msgSend(v16, "value");
        v22 = v21;
        objc_msgSend(v16, "parameterID");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v24) = v22;
        -[HapticCommandConverter limitEventParameter:value:parameter:eventType:](self, "limitEventParameter:value:parameter:eventType:", v62, v23, CHHapticEventTypeHapticTransient, v24);
        v26 = v25;

        objc_msgSend(v16, "parameterID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "isEqualToString:", CHHapticEventParameterIDHapticIntensity);

        if ((v28 & 1) != 0)
        {
          v12 = v26;
          goto LABEL_40;
        }
        objc_msgSend(v16, "parameterID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "isEqualToString:", CHHapticEventParameterIDHapticSharpness);

        if (v30)
        {
          *(float *)&v31 = v26;
          v60 = -[HapticCommandConverter transientHapticEventTypeFromSharpness:](self, "transientHapticEventTypeFromSharpness:", v31);
          if (kHAPIScope)
          {
            if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
            {
              v32 = *(id *)kHAPIScope;
              if (v32)
              {
                v33 = v32;
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136316162;
                  v72 = "HapticCommandConverter.mm";
                  v73 = 1024;
                  v74 = 229;
                  v75 = 2080;
                  v76 = "-[HapticCommandConverter eventForTransientHapticAtTime:params:duration:]";
                  v77 = 2048;
                  v78 = v26;
                  v79 = 1024;
                  LODWORD(v80) = v60;
                  _os_log_impl(&dword_1B573F000, v33, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Normalized sharpness %f -> event type %u", buf, 0x2Cu);
                }
                v59 = 1;
LABEL_38:

                goto LABEL_40;
              }
            }
          }
          v59 = 1;
          goto LABEL_40;
        }
        objc_msgSend(v16, "parameterID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v34, "isEqualToString:", CHHapticEventParameterIDAttackTime) & 1) != 0)
          goto LABEL_32;
        objc_msgSend(v16, "parameterID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v35, "isEqualToString:", CHHapticEventParameterIDDecayTime) & 1) != 0)
          goto LABEL_31;
        objc_msgSend(v16, "parameterID");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v36, "isEqualToString:", CHHapticEventParameterIDReleaseTime))
        {

LABEL_31:
LABEL_32:

          goto LABEL_33;
        }
        objc_msgSend(v16, "parameterID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "isEqualToString:", CHHapticEventParameterIDSustained);

        if ((v39 & 1) == 0)
        {
          if (kHAPIScope)
          {
            v51 = *(id *)kHAPIScope;
            if (!v51)
              goto LABEL_79;
          }
          else
          {
            v51 = (id)MEMORY[0x1E0C81028];
            v54 = MEMORY[0x1E0C81028];
          }
          v55 = v51;
          if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v16, "parameterID");
            v56 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            *(_DWORD *)buf = 136315906;
            v72 = "HapticCommandConverter.mm";
            v73 = 1024;
            v74 = 239;
            v75 = 2080;
            v76 = "-[HapticCommandConverter eventForTransientHapticAtTime:params:duration:]";
            v77 = 2112;
            v78 = v56;
            _os_log_impl(&dword_1B573F000, v55, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unknown event param type: %@", buf, 0x26u);

          }
LABEL_79:
          Haptic_RaiseException(CFSTR("CoreHapticInvalidParamException"), CFSTR("Unknown event param type"), -4820);
        }
LABEL_33:
        if (kHAPIScope)
        {
          if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
          {
            v37 = *(id *)kHAPIScope;
            if (v37)
            {
              v33 = v37;
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136315650;
                v72 = "HapticCommandConverter.mm";
                v73 = 1024;
                v74 = 236;
                v75 = 2080;
                v76 = "-[HapticCommandConverter eventForTransientHapticAtTime:params:duration:]";
                _os_log_impl(&dword_1B573F000, v33, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Ignoring for HapticTransient", buf, 0x1Cu);
              }
              goto LABEL_38;
            }
          }
        }
LABEL_40:
        ++v15;
      }
      while (v13 != v15);
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v70, 16);
      v13 = v40;
      if (!v40)
      {

        if ((v59 & 1) != 0)
          goto LABEL_54;
        goto LABEL_48;
      }
    }
  }

LABEL_48:
  v60 = -[HapticCommandConverter transientHapticEventTypeForDefaultSharpness](self, "transientHapticEventTypeForDefaultSharpness");
  if (kHAPIScope)
  {
    if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
    {
      v41 = *(id *)kHAPIScope;
      if (v41)
      {
        v42 = v41;
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          v72 = "HapticCommandConverter.mm";
          v73 = 1024;
          v74 = 246;
          v75 = 2080;
          v76 = "-[HapticCommandConverter eventForTransientHapticAtTime:params:duration:]";
          v77 = 1024;
          LODWORD(v78) = v60;
          _os_log_impl(&dword_1B573F000, v42, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Event has no HapticSharpness EventParameter. Default event type: %u", buf, 0x22u);
        }

      }
    }
  }
LABEL_54:
  if (v12 == 1.0)
  {
    v45 = 0;
    v50 = 0;
  }
  else
  {
    if (kHAPIScope)
    {
      if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
      {
        v43 = *(id *)kHAPIScope;
        if (v43)
        {
          v44 = v43;
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315906;
            v72 = "HapticCommandConverter.mm";
            v73 = 1024;
            v74 = 250;
            v75 = 2080;
            v76 = "-[HapticCommandConverter eventForTransientHapticAtTime:params:duration:]";
            v77 = 2048;
            v78 = v12;
            _os_log_impl(&dword_1B573F000, v44, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Adding event param for haptic gain: %.2f", buf, 0x26u);
          }

        }
      }
    }
    v45 = (float *)std::__allocate_at_least[abi:ne180100]<std::allocator<AVHapticPlayerFixedParameter>>((uint64_t)&v69, 1uLL);
    v46 = (char *)__p;
    v47 = v68;
    v49 = &v45[4 * v48];
    *(_QWORD *)v45 = 2000;
    v45[2] = v12;
    v50 = v45 + 4;
    if (v47 != v46)
    {
      do
      {
        *((_OWORD *)v45 - 1) = *((_OWORD *)v47 - 1);
        v45 -= 4;
        v47 -= 16;
      }
      while (v47 != v46);
      v46 = (char *)__p;
    }
    __p = v45;
    v68 = (char *)v50;
    v69 = v49;
    if (v46)
    {
      operator delete(v46);
      v45 = (float *)__p;
    }
    v68 = (char *)v50;
  }
  if (v50 == v45)
    v52 = 0;
  else
    v52 = v45;
  objc_msgSend(MEMORY[0x1E0CFF740], "eventWithEventType:time:parameters:count:duration:", v60, v52, ((char *)v50 - (char *)v45) >> 4, a3, a5);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (__p)
  {
    v68 = (char *)__p;
    operator delete(__p);
  }

  return v53;
}

- (float)limitEventParameter:(id)a3 value:(float)a4 parameter:(id)a5 eventType:(id)a6
{
  void *v7;
  void *v8;
  float v9;
  float v10;
  float v11;
  float v12;
  NSObject *v13;
  id v14;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "attributesForEventParameter:eventType:error:", a5, a6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
  {
    if (kHAPIScope)
    {
      v13 = *(id *)kHAPIScope;
      if (!v13)
      {
LABEL_14:
        v12 = 0.0;
        goto LABEL_15;
      }
    }
    else
    {
      v13 = MEMORY[0x1E0C81028];
      v14 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v16 = 136315650;
      v17 = "HapticCommandConverter.mm";
      v18 = 1024;
      v19 = 99;
      v20 = 2080;
      v21 = "-[HapticCommandConverter limitEventParameter:value:parameter:eventType:]";
      _os_log_impl(&dword_1B573F000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Invalid event parameter ID.", (uint8_t *)&v16, 0x1Cu);
    }

    goto LABEL_14;
  }
  objc_msgSend(v7, "minValue");
  v10 = v9;
  objc_msgSend(v8, "maxValue");
  if (v11 >= a4)
    v11 = a4;
  if (v11 >= v10)
    v12 = v11;
  else
    v12 = v10;
LABEL_15:

  return v12;
}

- (unint64_t)transientHapticEventTypeFromSharpness:(float)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v9;
  _BYTE *v10;

  -[HapticCommandConverter serverConfig](self, "serverConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "hapticTransientIDs");
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }

  if (v9 != (_QWORD *)v10)
  {
    v6 = v9[(int)((float)((float)(unint64_t)(((v10 - (_BYTE *)v9) >> 3) - 1) * a3) + 0.5)];
LABEL_7:
    operator delete(v9);
    return v6;
  }
  v6 = 0;
  v7 = 0;
  if (v9)
    goto LABEL_7;
  return v7;
}

- (HapticServerConfig)serverConfig
{
  return (HapticServerConfig *)objc_getProperty(self, a2, 8, 1);
}

- (float)limitDynamicParameter:(id)a3 value:(float)a4 parameter:(id)a5
{
  void *v6;
  void *v7;
  float v8;
  float v9;
  float v10;
  float v11;
  NSObject *v12;
  id v13;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "attributesForDynamicParameter:error:", a5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    if (kHAPIScope)
    {
      v12 = *(id *)kHAPIScope;
      if (!v12)
      {
LABEL_14:
        v11 = 0.0;
        goto LABEL_15;
      }
    }
    else
    {
      v12 = MEMORY[0x1E0C81028];
      v13 = MEMORY[0x1E0C81028];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15 = 136315650;
      v16 = "HapticCommandConverter.mm";
      v17 = 1024;
      v18 = 117;
      v19 = 2080;
      v20 = "-[HapticCommandConverter limitDynamicParameter:value:parameter:]";
      _os_log_impl(&dword_1B573F000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Invalid dynamic parameter ID", (uint8_t *)&v15, 0x1Cu);
    }

    goto LABEL_14;
  }
  objc_msgSend(v6, "minValue");
  v9 = v8;
  objc_msgSend(v7, "maxValue");
  if (v10 >= a4)
    v10 = a4;
  if (v10 >= v9)
    v11 = v10;
  else
    v11 = v9;
LABEL_15:

  return v11;
}

- (id)eventForAudioEventType:(unint64_t)a3 time:(double)a4 eventParams:(id)a5 duration:(double)a6
{
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  float v20;
  int v21;
  int v22;
  void *v23;
  double v24;
  int v25;
  int v26;
  void *v27;
  int v28;
  _DWORD *v29;
  uint64_t v30;
  void *v31;
  int v32;
  _DWORD *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  void *v39;
  int v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  void *v44;
  int v45;
  char *v46;
  char *v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  void *v51;
  int v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  void *v56;
  int v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  void *v61;
  int v62;
  _BYTE *v63;
  uint64_t v64;
  unint64_t v65;
  uint64_t v66;
  void *v67;
  int v68;
  const CALog::Scope *v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  void *v73;
  void *v74;
  void *v76;
  void *v77;
  NSObject *v78;
  void *v79;
  unint64_t v80;
  id v81;
  id obj;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  void *__p;
  _BYTE *v88;
  char *v89;
  uint8_t v90[128];
  uint8_t buf[4];
  const char *v92;
  __int16 v93;
  int v94;
  __int16 v95;
  const char *v96;
  __int16 v97;
  _BYTE v98[24];
  __int16 v99;
  int v100;
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v81 = a5;
  if (kHAPIScope)
  {
    if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
    {
      v10 = *(id *)kHAPIScope;
      if (v10)
      {
        v11 = v10;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136316674;
          v92 = "HapticCommandConverter.mm";
          v93 = 1024;
          v94 = 129;
          v95 = 2080;
          v96 = "-[HapticCommandConverter eventForAudioEventType:time:eventParams:duration:]";
          v97 = 1024;
          *(_DWORD *)v98 = a3;
          *(_WORD *)&v98[4] = 2048;
          *(double *)&v98[6] = a4;
          *(_WORD *)&v98[14] = 2048;
          *(double *)&v98[16] = a6;
          v99 = 1024;
          v100 = objc_msgSend(v81, "count");
          _os_log_impl(&dword_1B573F000, v11, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Type %u time: %.2f secs dur: %.2f secs %u event params", buf, 0x3Cu);
        }

      }
    }
  }
  if (!objc_msgSend(v81, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CFF740], "eventWithEventType:time:duration:", a3, a4, a6);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_138;
  }
  v80 = a3;
  __p = 0;
  v88 = 0;
  v89 = 0;
  +[CHHapticEngine capabilitiesForHardware](CHHapticEngine, "capabilitiesForHardware");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  obj = v81;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v90, 16);
  if (!v13)
    goto LABEL_132;
  v14 = *(_QWORD *)v84;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v84 != v14)
        objc_enumerationMutation(obj);
      v16 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
      if (kHAPIScope)
      {
        if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
        {
          v17 = *(id *)kHAPIScope;
          if (v17)
          {
            v18 = v17;
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend(v16, "parameterID");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "value");
              *(_DWORD *)buf = 136316162;
              v92 = "HapticCommandConverter.mm";
              v93 = 1024;
              v94 = 134;
              v95 = 2080;
              v96 = "-[HapticCommandConverter eventForAudioEventType:time:eventParams:duration:]";
              v97 = 2112;
              *(_QWORD *)v98 = v19;
              *(_WORD *)&v98[8] = 2048;
              *(double *)&v98[10] = v20;
              _os_log_impl(&dword_1B573F000, v18, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Fixed Param '%@': value %f", buf, 0x30u);

            }
          }
        }
      }
      objc_msgSend(v16, "value");
      v22 = v21;
      objc_msgSend(v16, "parameterID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v24) = v22;
      -[HapticCommandConverter limitEventParameter:value:parameter:eventType:](self, "limitEventParameter:value:parameter:eventType:", v12, v23, CHHapticEventTypeAudioContinuous, v24);
      v26 = v25;

      objc_msgSend(v16, "parameterID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "isEqualToString:", CHHapticEventParameterIDAudioVolume);

      if (v28)
      {
        v29 = v88;
        if (v88 < v89)
        {
          v30 = 1000;
          goto LABEL_92;
        }
        v33 = __p;
        v34 = (v88 - (_BYTE *)__p) >> 4;
        v35 = v34 + 1;
        if ((unint64_t)(v34 + 1) >> 60)
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        v36 = v89 - (_BYTE *)__p;
        if ((v89 - (_BYTE *)__p) >> 3 > v35)
          v35 = v36 >> 3;
        if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFF0)
          v37 = 0xFFFFFFFFFFFFFFFLL;
        else
          v37 = v35;
        if (v37)
        {
          v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AVHapticPlayerFixedParameter>>((uint64_t)&v89, v37);
          v33 = __p;
          v29 = v88;
        }
        else
        {
          v38 = 0;
        }
        v46 = &v38[16 * v34];
        *(_QWORD *)v46 = 1000;
        *((_DWORD *)v46 + 2) = v26;
        v47 = v46;
        if (v29 != v33)
        {
          do
          {
            *((_OWORD *)v47 - 1) = *((_OWORD *)v29 - 1);
            v47 -= 16;
            v29 -= 4;
          }
          while (v29 != v33);
          goto LABEL_126;
        }
LABEL_127:
        v63 = v46 + 16;
        __p = v47;
        v88 = v46 + 16;
        v89 = &v38[16 * v37];
        if (v33)
          operator delete(v33);
LABEL_129:
        v88 = v63;
        continue;
      }
      objc_msgSend(v16, "parameterID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "isEqualToString:", CHHapticEventParameterIDAudioPan);

      if (v32)
      {
        v29 = v88;
        if (v88 < v89)
        {
          v30 = 1015;
LABEL_92:
          *(_QWORD *)v29 = v30;
          v29[2] = v26;
          v63 = v29 + 4;
          goto LABEL_129;
        }
        v33 = __p;
        v41 = (v88 - (_BYTE *)__p) >> 4;
        v42 = v41 + 1;
        if ((unint64_t)(v41 + 1) >> 60)
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        v43 = v89 - (_BYTE *)__p;
        if ((v89 - (_BYTE *)__p) >> 3 > v42)
          v42 = v43 >> 3;
        if ((unint64_t)v43 >= 0x7FFFFFFFFFFFFFF0)
          v37 = 0xFFFFFFFFFFFFFFFLL;
        else
          v37 = v42;
        if (v37)
        {
          v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AVHapticPlayerFixedParameter>>((uint64_t)&v89, v37);
          v33 = __p;
          v29 = v88;
        }
        else
        {
          v38 = 0;
        }
        v46 = &v38[16 * v41];
        *(_QWORD *)v46 = 1015;
        *((_DWORD *)v46 + 2) = v26;
        v47 = v46;
        if (v29 == v33)
          goto LABEL_127;
        do
        {
          *((_OWORD *)v47 - 1) = *((_OWORD *)v29 - 1);
          v47 -= 16;
          v29 -= 4;
        }
        while (v29 != v33);
        goto LABEL_126;
      }
      objc_msgSend(v16, "parameterID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "isEqualToString:", CHHapticEventParameterIDAudioBrightness);

      if (v40)
      {
        v29 = v88;
        if (v88 < v89)
        {
          v30 = 1013;
          goto LABEL_92;
        }
        v33 = __p;
        v48 = (v88 - (_BYTE *)__p) >> 4;
        v49 = v48 + 1;
        if ((unint64_t)(v48 + 1) >> 60)
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        v50 = v89 - (_BYTE *)__p;
        if ((v89 - (_BYTE *)__p) >> 3 > v49)
          v49 = v50 >> 3;
        if ((unint64_t)v50 >= 0x7FFFFFFFFFFFFFF0)
          v37 = 0xFFFFFFFFFFFFFFFLL;
        else
          v37 = v49;
        if (v37)
        {
          v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AVHapticPlayerFixedParameter>>((uint64_t)&v89, v37);
          v33 = __p;
          v29 = v88;
        }
        else
        {
          v38 = 0;
        }
        v46 = &v38[16 * v48];
        *(_QWORD *)v46 = 1013;
        *((_DWORD *)v46 + 2) = v26;
        v47 = v46;
        if (v29 == v33)
          goto LABEL_127;
        do
        {
          *((_OWORD *)v47 - 1) = *((_OWORD *)v29 - 1);
          v47 -= 16;
          v29 -= 4;
        }
        while (v29 != v33);
LABEL_126:
        v33 = __p;
        goto LABEL_127;
      }
      objc_msgSend(v16, "parameterID");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = objc_msgSend(v44, "isEqualToString:", CHHapticEventParameterIDAudioPitch);

      if (v45)
      {
        v29 = v88;
        if (v88 < v89)
        {
          v30 = 1001;
          goto LABEL_92;
        }
        v33 = __p;
        v53 = (v88 - (_BYTE *)__p) >> 4;
        v54 = v53 + 1;
        if ((unint64_t)(v53 + 1) >> 60)
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        v55 = v89 - (_BYTE *)__p;
        if ((v89 - (_BYTE *)__p) >> 3 > v54)
          v54 = v55 >> 3;
        if ((unint64_t)v55 >= 0x7FFFFFFFFFFFFFF0)
          v37 = 0xFFFFFFFFFFFFFFFLL;
        else
          v37 = v54;
        if (v37)
        {
          v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AVHapticPlayerFixedParameter>>((uint64_t)&v89, v37);
          v33 = __p;
          v29 = v88;
        }
        else
        {
          v38 = 0;
        }
        v46 = &v38[16 * v53];
        *(_QWORD *)v46 = 1001;
        *((_DWORD *)v46 + 2) = v26;
        v47 = v46;
        if (v29 == v33)
          goto LABEL_127;
        do
        {
          *((_OWORD *)v47 - 1) = *((_OWORD *)v29 - 1);
          v47 -= 16;
          v29 -= 4;
        }
        while (v29 != v33);
        goto LABEL_126;
      }
      objc_msgSend(v16, "parameterID");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend(v51, "isEqualToString:", CHHapticEventParameterIDAttackTime);

      if (v52)
      {
        v29 = v88;
        if (v88 < v89)
        {
          v30 = 1010;
          goto LABEL_92;
        }
        v33 = __p;
        v58 = (v88 - (_BYTE *)__p) >> 4;
        v59 = v58 + 1;
        if ((unint64_t)(v58 + 1) >> 60)
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        v60 = v89 - (_BYTE *)__p;
        if ((v89 - (_BYTE *)__p) >> 3 > v59)
          v59 = v60 >> 3;
        if ((unint64_t)v60 >= 0x7FFFFFFFFFFFFFF0)
          v37 = 0xFFFFFFFFFFFFFFFLL;
        else
          v37 = v59;
        if (v37)
        {
          v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AVHapticPlayerFixedParameter>>((uint64_t)&v89, v37);
          v33 = __p;
          v29 = v88;
        }
        else
        {
          v38 = 0;
        }
        v46 = &v38[16 * v58];
        *(_QWORD *)v46 = 1010;
        *((_DWORD *)v46 + 2) = v26;
        v47 = v46;
        if (v29 == v33)
          goto LABEL_127;
        do
        {
          *((_OWORD *)v47 - 1) = *((_OWORD *)v29 - 1);
          v47 -= 16;
          v29 -= 4;
        }
        while (v29 != v33);
        goto LABEL_126;
      }
      objc_msgSend(v16, "parameterID");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v56, "isEqualToString:", CHHapticEventParameterIDDecayTime);

      if (v57)
      {
        v29 = v88;
        if (v88 < v89)
        {
          v30 = 1011;
          goto LABEL_92;
        }
        v33 = __p;
        v64 = (v88 - (_BYTE *)__p) >> 4;
        v65 = v64 + 1;
        if ((unint64_t)(v64 + 1) >> 60)
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        v66 = v89 - (_BYTE *)__p;
        if ((v89 - (_BYTE *)__p) >> 3 > v65)
          v65 = v66 >> 3;
        if ((unint64_t)v66 >= 0x7FFFFFFFFFFFFFF0)
          v37 = 0xFFFFFFFFFFFFFFFLL;
        else
          v37 = v65;
        if (v37)
        {
          v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AVHapticPlayerFixedParameter>>((uint64_t)&v89, v37);
          v33 = __p;
          v29 = v88;
        }
        else
        {
          v38 = 0;
        }
        v46 = &v38[16 * v64];
        *(_QWORD *)v46 = 1011;
        *((_DWORD *)v46 + 2) = v26;
        v47 = v46;
        if (v29 == v33)
          goto LABEL_127;
        do
        {
          *((_OWORD *)v47 - 1) = *((_OWORD *)v29 - 1);
          v47 -= 16;
          v29 -= 4;
        }
        while (v29 != v33);
        goto LABEL_126;
      }
      objc_msgSend(v16, "parameterID");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v61, "isEqualToString:", CHHapticEventParameterIDReleaseTime);

      if (v62)
      {
        v29 = v88;
        if (v88 < v89)
        {
          v30 = 1012;
          goto LABEL_92;
        }
        v33 = __p;
        v70 = (v88 - (_BYTE *)__p) >> 4;
        v71 = v70 + 1;
        if ((unint64_t)(v70 + 1) >> 60)
          std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
        v72 = v89 - (_BYTE *)__p;
        if ((v89 - (_BYTE *)__p) >> 3 > v71)
          v71 = v72 >> 3;
        if ((unint64_t)v72 >= 0x7FFFFFFFFFFFFFF0)
          v37 = 0xFFFFFFFFFFFFFFFLL;
        else
          v37 = v71;
        if (v37)
        {
          v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AVHapticPlayerFixedParameter>>((uint64_t)&v89, v37);
          v33 = __p;
          v29 = v88;
        }
        else
        {
          v38 = 0;
        }
        v46 = &v38[16 * v70];
        *(_QWORD *)v46 = 1012;
        *((_DWORD *)v46 + 2) = v26;
        v47 = v46;
        if (v29 == v33)
          goto LABEL_127;
        do
        {
          *((_OWORD *)v47 - 1) = *((_OWORD *)v29 - 1);
          v47 -= 16;
          v29 -= 4;
        }
        while (v29 != v33);
        goto LABEL_126;
      }
      objc_msgSend(v16, "parameterID");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v67, "isEqualToString:", CHHapticEventParameterIDSustained);

      if ((v68 & 1) == 0)
      {
        CALog::LogObjIfEnabled((CALog *)1, kHAPIScope, v69);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = v76;
        if (v76)
        {
          v78 = v76;
          if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v16, "parameterID");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315906;
            v92 = "HapticCommandConverter.mm";
            v93 = 1024;
            v94 = 164;
            v95 = 2080;
            v96 = "-[HapticCommandConverter eventForAudioEventType:time:eventParams:duration:]";
            v97 = 2112;
            *(_QWORD *)v98 = v79;
            _os_log_impl(&dword_1B573F000, v78, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unknown event param type: %@", buf, 0x26u);

          }
        }

        Haptic_RaiseException(CFSTR("CoreHapticInvalidParamException"), CFSTR("Unknown event param type"), -4820);
      }
    }
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v90, 16);
  }
  while (v13);
LABEL_132:

  if (v88 == __p)
    v73 = 0;
  else
    v73 = __p;
  objc_msgSend(MEMORY[0x1E0CFF740], "eventWithEventType:time:parameters:count:duration:", v80, v73, (v88 - (_BYTE *)__p) >> 4, a4, a6);
  v74 = (void *)objc_claimAutoreleasedReturnValue();

  if (__p)
  {
    v88 = __p;
    operator delete(__p);
  }
LABEL_138:

  return v74;
}

- (unint64_t)transientHapticEventTypeForDefaultSharpness
{
  void *v3;
  unint64_t v4;

  -[HapticCommandConverter serverConfig](self, "serverConfig");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultHapticTransientEventSharpness");
  v4 = -[HapticCommandConverter transientHapticEventTypeFromSharpness:](self, "transientHapticEventTypeFromSharpness:");

  return v4;
}

- (unint64_t)eventTypeForBuiltInAudioEventType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[HapticCommandConverter serverConfig](self, "serverConfig");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "builtInAudioEventIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    a3 = objc_msgSend(v7, "unsignedIntegerValue");
  }
  else if (kHAPIScope)
  {
    if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
    {
      v9 = *(id *)kHAPIScope;
      if (v9)
      {
        v10 = v9;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          v11 = 136316162;
          v12 = "HapticCommandConverter.mm";
          v14 = 203;
          v15 = 2080;
          v13 = 1024;
          v16 = "-[HapticCommandConverter eventTypeForBuiltInAudioEventType:]";
          v17 = 1024;
          v18 = a3;
          v19 = 1024;
          v20 = a3;
          _os_log_impl(&dword_1B573F000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: No altered event ID for original event ID %u. Returning original event ID %u", (uint8_t *)&v11, 0x28u);
        }

      }
    }
  }

  return a3;
}

- (unint64_t)continuousHapticEventTypeFromSharpness:(float)a3 sustained:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v11;
  _BYTE *v12;

  v4 = a4;
  -[HapticCommandConverter serverConfig](self, "serverConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    if (v6)
    {
      objc_msgSend(v6, "hapticContinuousSustainedIDs");
      goto LABEL_7;
    }
  }
  else if (v6)
  {
    objc_msgSend(v6, "hapticContinuousNonsustainedIDs");
    goto LABEL_7;
  }
  v11 = 0;
  v12 = 0;
LABEL_7:

  if (v11 != (_QWORD *)v12)
  {
    v8 = v11[(int)((float)((float)(unint64_t)(((v12 - (_BYTE *)v11) >> 3) - 1) * a3) + 0.5)];
LABEL_10:
    operator delete(v11);
    return v8;
  }
  v8 = 0;
  v9 = 0;
  if (v11)
    goto LABEL_10;
  return v9;
}

- (unint64_t)continuousHapticEventTypeForDefaultSharpness:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  unint64_t v6;

  v3 = a3;
  -[HapticCommandConverter serverConfig](self, "serverConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultHapticContinuousEventSharpness");
  v6 = -[HapticCommandConverter continuousHapticEventTypeFromSharpness:sustained:](self, "continuousHapticEventTypeFromSharpness:sustained:", v3);

  return v6;
}

- (id)eventForContinuousHapticEventType:(int)a3 time:(double)a4 params:(id)a5 duration:(double)a6
{
  id v9;
  NSObject *v10;
  void *v11;
  float v12;
  float v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  float v22;
  int v23;
  int v24;
  void *v25;
  double v26;
  float v27;
  float v28;
  void *v29;
  char v30;
  void *v31;
  int v32;
  double v33;
  void *v34;
  int v35;
  float *v36;
  uint64_t v37;
  void *v38;
  int v39;
  float *v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  unint64_t v44;
  char *v45;
  void *v46;
  int v47;
  char *v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  void *v52;
  int v53;
  char *v54;
  char *v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  NSObject *v59;
  NSObject *v60;
  NSObject *v61;
  NSObject *v62;
  float *v63;
  char *v64;
  id v65;
  float *v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  unint64_t v70;
  char *v71;
  id v72;
  NSObject *v73;
  void *v74;
  float *v75;
  char *v76;
  void *v77;
  void *v78;
  id v80;
  id v81;
  char v82;
  id obj;
  void *v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  void *__p;
  char *v91;
  char *v92;
  uint8_t v93[128];
  uint8_t buf[4];
  const char *v95;
  __int16 v96;
  int v97;
  __int16 v98;
  const char *v99;
  __int16 v100;
  _BYTE v101[24];
  __int16 v102;
  int v103;
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v80 = a5;
  if (kHAPIScope)
  {
    if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
    {
      v9 = *(id *)kHAPIScope;
      if (v9)
      {
        v10 = v9;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136316674;
          v95 = "HapticCommandConverter.mm";
          v96 = 1024;
          v97 = 372;
          v98 = 2080;
          v99 = "-[HapticCommandConverter eventForContinuousHapticEventType:time:params:duration:]";
          v100 = 1024;
          *(_DWORD *)v101 = a3;
          *(_WORD *)&v101[4] = 2048;
          *(double *)&v101[6] = a4;
          *(_WORD *)&v101[14] = 2048;
          *(double *)&v101[16] = a6;
          v102 = 1024;
          v103 = objc_msgSend(v80, "count");
          _os_log_impl(&dword_1B573F000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Type %u time: %.2f secs duration: %.2f secs %u client event params", buf, 0x3Cu);
        }

      }
    }
  }
  __p = 0;
  v91 = 0;
  v92 = 0;
  +[CHHapticEngine capabilitiesForHardware](CHHapticEngine, "capabilitiesForHardware", v80);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  -[HapticCommandConverter serverConfig](self, "serverConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "defaultHapticContinuousEventIntensity");
  v13 = v12;

  v88 = 0u;
  v89 = 0u;
  v86 = 0u;
  v87 = 0u;
  obj = v81;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v93, 16);
  if (v14)
  {
    v82 = 0;
    v15 = 0;
    v16 = *(_QWORD *)v87;
    while (1)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v87 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * i);
        if (kHAPIScope)
        {
          if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
          {
            v19 = *(id *)kHAPIScope;
            if (v19)
            {
              v20 = v19;
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v18, "parameterID");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "value");
                *(_DWORD *)buf = 136316162;
                v95 = "HapticCommandConverter.mm";
                v96 = 1024;
                v97 = 381;
                v98 = 2080;
                v99 = "-[HapticCommandConverter eventForContinuousHapticEventType:time:params:duration:]";
                v100 = 2112;
                *(_QWORD *)v101 = v21;
                *(_WORD *)&v101[8] = 2048;
                *(double *)&v101[10] = v22;
                _os_log_impl(&dword_1B573F000, v20, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Fixed Param '%@': value %f", buf, 0x30u);

              }
            }
          }
        }
        objc_msgSend(v18, "value");
        v24 = v23;
        objc_msgSend(v18, "parameterID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v26) = v24;
        -[HapticCommandConverter limitEventParameter:value:parameter:eventType:](self, "limitEventParameter:value:parameter:eventType:", v85, v25, CHHapticEventTypeHapticContinuous, v26);
        v28 = v27;

        objc_msgSend(v18, "parameterID");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "isEqualToString:", CHHapticEventParameterIDHapticIntensity);

        if ((v30 & 1) != 0)
        {
          v13 = v28;
          continue;
        }
        objc_msgSend(v18, "parameterID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "isEqualToString:", CHHapticEventParameterIDHapticSharpness);

        if (v32)
        {
          *(float *)&v33 = v28;
          v15 = -[HapticCommandConverter continuousHapticEventTypeFromSharpness:sustained:](self, "continuousHapticEventTypeFromSharpness:sustained:", a3 == 1, v33);
          v82 = 1;
          continue;
        }
        objc_msgSend(v18, "parameterID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "isEqualToString:", CHHapticEventParameterIDAttackTime);

        if (v35)
        {
          v36 = (float *)v91;
          if (v91 < v92)
          {
            v37 = 2010;
            goto LABEL_39;
          }
          v40 = (float *)__p;
          v41 = (v91 - (_BYTE *)__p) >> 4;
          v42 = v41 + 1;
          if ((unint64_t)(v41 + 1) >> 60)
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          v43 = v92 - (_BYTE *)__p;
          if ((v92 - (_BYTE *)__p) >> 3 > v42)
            v42 = v43 >> 3;
          if ((unint64_t)v43 >= 0x7FFFFFFFFFFFFFF0)
            v44 = 0xFFFFFFFFFFFFFFFLL;
          else
            v44 = v42;
          if (v44)
          {
            v45 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AVHapticPlayerFixedParameter>>((uint64_t)&v92, v44);
            v40 = (float *)__p;
            v36 = (float *)v91;
          }
          else
          {
            v45 = 0;
          }
          v54 = &v45[16 * v41];
          *(_QWORD *)v54 = 2010;
          *((float *)v54 + 2) = v28;
          v55 = v54;
          if (v36 != v40)
          {
            do
            {
              *((_OWORD *)v55 - 1) = *((_OWORD *)v36 - 1);
              v55 -= 16;
              v36 -= 4;
            }
            while (v36 != v40);
            goto LABEL_69;
          }
LABEL_70:
          v48 = v54 + 16;
          __p = v55;
          v91 = v54 + 16;
          v92 = &v45[16 * v44];
          if (v40)
            operator delete(v40);
LABEL_72:
          v91 = v48;
          continue;
        }
        objc_msgSend(v18, "parameterID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "isEqualToString:", CHHapticEventParameterIDDecayTime);

        if (v39)
        {
          v36 = (float *)v91;
          if (v91 < v92)
          {
            v37 = 2011;
LABEL_39:
            *(_QWORD *)v36 = v37;
            v36[2] = v28;
            v48 = (char *)(v36 + 4);
            goto LABEL_72;
          }
          v40 = (float *)__p;
          v49 = (v91 - (_BYTE *)__p) >> 4;
          v50 = v49 + 1;
          if ((unint64_t)(v49 + 1) >> 60)
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          v51 = v92 - (_BYTE *)__p;
          if ((v92 - (_BYTE *)__p) >> 3 > v50)
            v50 = v51 >> 3;
          if ((unint64_t)v51 >= 0x7FFFFFFFFFFFFFF0)
            v44 = 0xFFFFFFFFFFFFFFFLL;
          else
            v44 = v50;
          if (v44)
          {
            v45 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AVHapticPlayerFixedParameter>>((uint64_t)&v92, v44);
            v40 = (float *)__p;
            v36 = (float *)v91;
          }
          else
          {
            v45 = 0;
          }
          v54 = &v45[16 * v49];
          *(_QWORD *)v54 = 2011;
          *((float *)v54 + 2) = v28;
          v55 = v54;
          if (v36 == v40)
            goto LABEL_70;
          do
          {
            *((_OWORD *)v55 - 1) = *((_OWORD *)v36 - 1);
            v55 -= 16;
            v36 -= 4;
          }
          while (v36 != v40);
          goto LABEL_69;
        }
        objc_msgSend(v18, "parameterID");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v46, "isEqualToString:", CHHapticEventParameterIDReleaseTime);

        if (v47)
        {
          v36 = (float *)v91;
          if (v91 < v92)
          {
            v37 = 2012;
            goto LABEL_39;
          }
          v40 = (float *)__p;
          v56 = (v91 - (_BYTE *)__p) >> 4;
          v57 = v56 + 1;
          if ((unint64_t)(v56 + 1) >> 60)
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          v58 = v92 - (_BYTE *)__p;
          if ((v92 - (_BYTE *)__p) >> 3 > v57)
            v57 = v58 >> 3;
          if ((unint64_t)v58 >= 0x7FFFFFFFFFFFFFF0)
            v44 = 0xFFFFFFFFFFFFFFFLL;
          else
            v44 = v57;
          if (v44)
          {
            v45 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AVHapticPlayerFixedParameter>>((uint64_t)&v92, v44);
            v40 = (float *)__p;
            v36 = (float *)v91;
          }
          else
          {
            v45 = 0;
          }
          v54 = &v45[16 * v56];
          *(_QWORD *)v54 = 2012;
          *((float *)v54 + 2) = v28;
          v55 = v54;
          if (v36 == v40)
            goto LABEL_70;
          do
          {
            *((_OWORD *)v55 - 1) = *((_OWORD *)v36 - 1);
            v55 -= 16;
            v36 -= 4;
          }
          while (v36 != v40);
LABEL_69:
          v40 = (float *)__p;
          goto LABEL_70;
        }
        objc_msgSend(v18, "parameterID");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v52, "isEqualToString:", CHHapticEventParameterIDSustained);

        if ((v53 & 1) == 0)
        {
          if (kHAPIScope)
          {
            v65 = *(id *)kHAPIScope;
            if (!v65)
              goto LABEL_109;
          }
          else
          {
            v65 = (id)MEMORY[0x1E0C81028];
            v72 = MEMORY[0x1E0C81028];
          }
          v73 = v65;
          if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v18, "parameterID");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315906;
            v95 = "HapticCommandConverter.mm";
            v96 = 1024;
            v97 = 404;
            v98 = 2080;
            v99 = "-[HapticCommandConverter eventForContinuousHapticEventType:time:params:duration:]";
            v100 = 2112;
            *(_QWORD *)v101 = v74;
            _os_log_impl(&dword_1B573F000, v73, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unknown event param type: %@", buf, 0x26u);

          }
LABEL_109:
          Haptic_RaiseException(CFSTR("CoreHapticInvalidParamException"), CFSTR("Unknown event param type"), -4820);
        }
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v86, v93, 16);
      if (!v14)
      {

        if ((v82 & 1) != 0)
          goto LABEL_84;
        goto LABEL_78;
      }
    }
  }

LABEL_78:
  v15 = -[HapticCommandConverter continuousHapticEventTypeForDefaultSharpness:](self, "continuousHapticEventTypeForDefaultSharpness:", a3 == 1);
  if (kHAPIScope)
  {
    if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
    {
      v59 = *(id *)kHAPIScope;
      if (v59)
      {
        v60 = v59;
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          v95 = "HapticCommandConverter.mm";
          v96 = 1024;
          v97 = 411;
          v98 = 2080;
          v99 = "-[HapticCommandConverter eventForContinuousHapticEventType:time:params:duration:]";
          v100 = 1024;
          *(_DWORD *)v101 = v15;
          _os_log_impl(&dword_1B573F000, v60, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Event has no HapticSharpness EventParameter. Using default event ID %u", buf, 0x22u);
        }

      }
    }
  }
LABEL_84:
  if (v13 == 1.0)
  {
    v64 = v91;
  }
  else
  {
    if (kHAPIScope)
    {
      if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
      {
        v61 = *(id *)kHAPIScope;
        if (v61)
        {
          v62 = v61;
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315906;
            v95 = "HapticCommandConverter.mm";
            v96 = 1024;
            v97 = 414;
            v98 = 2080;
            v99 = "-[HapticCommandConverter eventForContinuousHapticEventType:time:params:duration:]";
            v100 = 2048;
            *(double *)v101 = v13;
            _os_log_impl(&dword_1B573F000, v62, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Adding event param for continuous haptic intensity: %.2f", buf, 0x26u);
          }

        }
      }
    }
    v63 = (float *)v91;
    if (v91 >= v92)
    {
      v66 = (float *)__p;
      v67 = (v91 - (_BYTE *)__p) >> 4;
      v68 = v67 + 1;
      if ((unint64_t)(v67 + 1) >> 60)
        std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
      v69 = v92 - (_BYTE *)__p;
      if ((v92 - (_BYTE *)__p) >> 3 > v68)
        v68 = v69 >> 3;
      if ((unint64_t)v69 >= 0x7FFFFFFFFFFFFFF0)
        v70 = 0xFFFFFFFFFFFFFFFLL;
      else
        v70 = v68;
      if (v70)
      {
        v71 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AVHapticPlayerFixedParameter>>((uint64_t)&v92, v70);
        v66 = (float *)__p;
        v63 = (float *)v91;
      }
      else
      {
        v71 = 0;
      }
      v75 = (float *)&v71[16 * v67];
      v76 = &v71[16 * v70];
      *(_QWORD *)v75 = 2000;
      v75[2] = v13;
      v64 = (char *)(v75 + 4);
      if (v63 != v66)
      {
        do
        {
          *((_OWORD *)v75 - 1) = *((_OWORD *)v63 - 1);
          v75 -= 4;
          v63 -= 4;
        }
        while (v63 != v66);
        v66 = (float *)__p;
      }
      __p = v75;
      v91 = v64;
      v92 = v76;
      if (v66)
        operator delete(v66);
    }
    else
    {
      *(_QWORD *)v91 = 2000;
      v63[2] = v13;
      v64 = (char *)(v63 + 4);
    }
    v91 = v64;
  }
  if (v64 == __p)
    v77 = 0;
  else
    v77 = __p;
  objc_msgSend(MEMORY[0x1E0CFF740], "eventWithEventType:time:parameters:count:duration:", v15, v77, (v64 - (_BYTE *)__p) >> 4, a4, a6);
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  if (__p)
  {
    v91 = (char *)__p;
    operator delete(__p);
  }

  return v78;
}

- (id)eventForSPIEventType:(unint64_t)a3 time:(double)a4 eventParams:(id)a5 duration:(double)a6
{
  id v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  float v19;
  void *v20;
  int v21;
  int v22;
  int v23;
  void *v24;
  double v25;
  int v26;
  int v27;
  _DWORD *v28;
  uint64_t v29;
  void *v30;
  int v31;
  int v32;
  int v33;
  void *v34;
  double v35;
  int v36;
  void *v37;
  int v38;
  int v39;
  int v40;
  void *v41;
  double v42;
  int v43;
  _BYTE *v44;
  _DWORD *v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  char *v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  unint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  NSObject *v63;
  void *v64;
  id v66;
  id obj;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  void *__p;
  _BYTE *v74;
  char *v75;
  uint8_t v76[128];
  uint8_t buf[4];
  const char *v78;
  __int16 v79;
  int v80;
  __int16 v81;
  const char *v82;
  __int16 v83;
  _BYTE v84[24];
  __int16 v85;
  int v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v66 = a5;
  if (kHAPIScope)
  {
    if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
    {
      v9 = *(id *)kHAPIScope;
      if (v9)
      {
        v10 = v9;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136316674;
          v78 = "HapticCommandConverter.mm";
          v79 = 1024;
          v80 = 433;
          v81 = 2080;
          v82 = "-[HapticCommandConverter eventForSPIEventType:time:eventParams:duration:]";
          v83 = 1024;
          *(_DWORD *)v84 = a3;
          *(_WORD *)&v84[4] = 2048;
          *(double *)&v84[6] = a4;
          *(_WORD *)&v84[14] = 2048;
          *(double *)&v84[16] = a6;
          v85 = 1024;
          v86 = objc_msgSend(v66, "count");
          _os_log_impl(&dword_1B573F000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Type %u time: %.2f secs dur: %.2f secs %u event params", buf, 0x3Cu);
        }

      }
    }
  }
  __p = 0;
  v74 = 0;
  v75 = 0;
  if (objc_msgSend(v66, "count"))
  {
    +[CHHapticEngine capabilitiesForHardware](CHHapticEngine, "capabilitiesForHardware");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v71 = 0u;
    v72 = 0u;
    v69 = 0u;
    v70 = 0u;
    obj = v66;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
    if (!v12)
      goto LABEL_71;
    v13 = *(_QWORD *)v70;
    while (1)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v70 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * i);
        if (kHAPIScope)
        {
          if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
          {
            v16 = *(id *)kHAPIScope;
            if (v16)
            {
              v17 = v16;
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v15, "parameterID");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "value");
                *(_DWORD *)buf = 136316162;
                v78 = "HapticCommandConverter.mm";
                v79 = 1024;
                v80 = 438;
                v81 = 2080;
                v82 = "-[HapticCommandConverter eventForSPIEventType:time:eventParams:duration:]";
                v83 = 2112;
                *(_QWORD *)v84 = v18;
                *(_WORD *)&v84[8] = 2048;
                *(double *)&v84[10] = v19;
                _os_log_impl(&dword_1B573F000, v17, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Fixed Param '%@': value %f", buf, 0x30u);

              }
            }
          }
        }
        objc_msgSend(v15, "parameterID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", CHHapticEventParameterIDAudioVolume);

        if (v21)
        {
          objc_msgSend(v15, "value");
          v23 = v22;
          objc_msgSend(v15, "parameterID");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v25) = v23;
          -[HapticCommandConverter limitEventParameter:value:parameter:eventType:](self, "limitEventParameter:value:parameter:eventType:", v11, v24, CHHapticEventTypeAudioContinuous, v25);
          v27 = v26;

          v28 = v74;
          if (v74 < v75)
          {
            v29 = 1000;
            goto LABEL_29;
          }
          v45 = __p;
          v46 = (v74 - (_BYTE *)__p) >> 4;
          v47 = v46 + 1;
          if ((unint64_t)(v46 + 1) >> 60)
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          v48 = v75 - (_BYTE *)__p;
          if ((v75 - (_BYTE *)__p) >> 3 > v47)
            v47 = v48 >> 3;
          if ((unint64_t)v48 >= 0x7FFFFFFFFFFFFFF0)
            v49 = 0xFFFFFFFFFFFFFFFLL;
          else
            v49 = v47;
          if (v49)
          {
            v50 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AVHapticPlayerFixedParameter>>((uint64_t)&v75, v49);
            v45 = __p;
            v28 = v74;
          }
          else
          {
            v50 = 0;
          }
          v54 = &v50[16 * v46];
          *(_QWORD *)v54 = 1000;
          *((_DWORD *)v54 + 2) = v27;
          v55 = v54;
          if (v28 != v45)
          {
            do
            {
              *((_OWORD *)v55 - 1) = *((_OWORD *)v28 - 1);
              v55 -= 16;
              v28 -= 4;
            }
            while (v28 != v45);
            goto LABEL_65;
          }
          goto LABEL_66;
        }
        objc_msgSend(v15, "parameterID");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "isEqualToString:", CHHapticEventParameterIDAudioPitch);

        if (v31)
        {
          objc_msgSend(v15, "value");
          v33 = v32;
          objc_msgSend(v15, "parameterID");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v35) = v33;
          -[HapticCommandConverter limitEventParameter:value:parameter:eventType:](self, "limitEventParameter:value:parameter:eventType:", v11, v34, CHHapticEventTypeAudioContinuous, v35);
          v27 = v36;

          v28 = v74;
          if (v74 < v75)
          {
            v29 = 1001;
            goto LABEL_29;
          }
          v45 = __p;
          v51 = (v74 - (_BYTE *)__p) >> 4;
          v52 = v51 + 1;
          if ((unint64_t)(v51 + 1) >> 60)
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          v53 = v75 - (_BYTE *)__p;
          if ((v75 - (_BYTE *)__p) >> 3 > v52)
            v52 = v53 >> 3;
          if ((unint64_t)v53 >= 0x7FFFFFFFFFFFFFF0)
            v49 = 0xFFFFFFFFFFFFFFFLL;
          else
            v49 = v52;
          if (v49)
          {
            v50 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AVHapticPlayerFixedParameter>>((uint64_t)&v75, v49);
            v45 = __p;
            v28 = v74;
          }
          else
          {
            v50 = 0;
          }
          v54 = &v50[16 * v51];
          *(_QWORD *)v54 = 1001;
          *((_DWORD *)v54 + 2) = v27;
          v55 = v54;
          if (v28 != v45)
          {
            do
            {
              *((_OWORD *)v55 - 1) = *((_OWORD *)v28 - 1);
              v55 -= 16;
              v28 -= 4;
            }
            while (v28 != v45);
            goto LABEL_65;
          }
          goto LABEL_66;
        }
        objc_msgSend(v15, "parameterID");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v37, "isEqualToString:", CHHapticEventParameterIDHapticIntensity);

        if (!v38)
        {
          if (kHAPIScope)
          {
            v61 = *(id *)kHAPIScope;
            if (!v61)
              goto LABEL_83;
          }
          else
          {
            v61 = (id)MEMORY[0x1E0C81028];
            v62 = MEMORY[0x1E0C81028];
          }
          v63 = v61;
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v15, "parameterID");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315906;
            v78 = "HapticCommandConverter.mm";
            v79 = 1024;
            v80 = 456;
            v81 = 2080;
            v82 = "-[HapticCommandConverter eventForSPIEventType:time:eventParams:duration:]";
            v83 = 2112;
            *(_QWORD *)v84 = v64;
            _os_log_impl(&dword_1B573F000, v63, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unsupported event param type: %@", buf, 0x26u);

          }
LABEL_83:
          Haptic_RaiseException(CFSTR("CoreHapticInvalidParamException"), CFSTR("Unsupported event param type"), -4820);
        }
        if (-[HapticCommandConverter eventTypeForBuiltInAudioEventType:](self, "eventTypeForBuiltInAudioEventType:", 32556) != a3)
        {
          objc_msgSend(v15, "value");
          v40 = v39;
          objc_msgSend(v15, "parameterID");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v42) = v40;
          -[HapticCommandConverter limitEventParameter:value:parameter:eventType:](self, "limitEventParameter:value:parameter:eventType:", v11, v41, CHHapticEventTypeHapticTransient, v42);
          v27 = v43;

          v28 = v74;
          if (v74 < v75)
          {
            v29 = 2000;
LABEL_29:
            *(_QWORD *)v28 = v29;
            v28[2] = v27;
            v44 = v28 + 4;
LABEL_68:
            v74 = v44;
            continue;
          }
          v45 = __p;
          v56 = (v74 - (_BYTE *)__p) >> 4;
          v57 = v56 + 1;
          if ((unint64_t)(v56 + 1) >> 60)
            std::vector<unsigned long>::__throw_length_error[abi:ne180100]();
          v58 = v75 - (_BYTE *)__p;
          if ((v75 - (_BYTE *)__p) >> 3 > v57)
            v57 = v58 >> 3;
          if ((unint64_t)v58 >= 0x7FFFFFFFFFFFFFF0)
            v49 = 0xFFFFFFFFFFFFFFFLL;
          else
            v49 = v57;
          if (v49)
          {
            v50 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<AVHapticPlayerFixedParameter>>((uint64_t)&v75, v49);
            v45 = __p;
            v28 = v74;
          }
          else
          {
            v50 = 0;
          }
          v54 = &v50[16 * v56];
          *(_QWORD *)v54 = 2000;
          *((_DWORD *)v54 + 2) = v27;
          v55 = v54;
          if (v28 != v45)
          {
            do
            {
              *((_OWORD *)v55 - 1) = *((_OWORD *)v28 - 1);
              v55 -= 16;
              v28 -= 4;
            }
            while (v28 != v45);
LABEL_65:
            v45 = __p;
          }
LABEL_66:
          v44 = v54 + 16;
          __p = v55;
          v74 = v54 + 16;
          v75 = &v50[16 * v49];
          if (v45)
            operator delete(v45);
          goto LABEL_68;
        }
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v76, 16);
      if (!v12)
      {
LABEL_71:

        break;
      }
    }
  }
  if (v74 == __p)
    v59 = 0;
  else
    v59 = __p;
  objc_msgSend(MEMORY[0x1E0CFF740], "eventWithEventType:time:parameters:count:duration:", a3, v59, (v74 - (_BYTE *)__p) >> 4, a4, a6);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (__p)
  {
    v74 = __p;
    operator delete(__p);
  }

  return v60;
}

uint64_t __63__HapticCommandConverter_eventForEventEntry_engine_privileged___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v5;
  void *v6;
  float v7;
  float v8;
  uint64_t v9;

  v5 = a2;
  objc_msgSend(v5, "parameterID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqualToString:", CHHapticEventParameterIDSustained))
  {

    goto LABEL_5;
  }
  objc_msgSend(v5, "value");
  v8 = v7;

  if (v8 != 0.0)
  {
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  v9 = 1;
  *a4 = 1;
LABEL_6:

  return v9;
}

uint64_t __63__HapticCommandConverter_eventForEventEntry_engine_privileged___block_invoke_29(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v5;
  void *v6;
  float v7;
  float v8;
  uint64_t v9;

  v5 = a2;
  objc_msgSend(v5, "parameterID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "isEqualToString:", CHHapticEventParameterIDSustained))
  {

    goto LABEL_5;
  }
  objc_msgSend(v5, "value");
  v8 = v7;

  if (v8 != 0.0)
  {
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  v9 = 1;
  *a4 = 1;
LABEL_6:

  return v9;
}

- (id)eventForDynamicParameterEntry:(id)a3
{
  id v4;
  float v5;
  float v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  double v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  double v19;
  uint64_t v20;
  void *v21;
  int v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  double v26;
  void *v27;
  int v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  double v32;
  void *v33;
  int v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  double v38;
  void *v39;
  int v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  double v44;
  void *v45;
  int v46;
  const CALog::Scope *v47;
  NSObject *v48;
  NSObject *v49;
  void *v50;
  double v51;
  void *v52;
  int v53;
  const CALog::Scope *v54;
  NSObject *v55;
  NSObject *v56;
  void *v57;
  double v58;
  void *v59;
  int v60;
  const CALog::Scope *v61;
  NSObject *v62;
  NSObject *v63;
  void *v64;
  double v65;
  void *v66;
  int v67;
  const CALog::Scope *v68;
  NSObject *v69;
  NSObject *v70;
  void *v71;
  double v72;
  void *v73;
  int v74;
  const CALog::Scope *v75;
  NSObject *v76;
  NSObject *v77;
  void *v78;
  double v79;
  void *v80;
  int v81;
  const CALog::Scope *v82;
  NSObject *v83;
  NSObject *v84;
  void *v85;
  double v86;
  void *v87;
  int v88;
  const CALog::Scope *v89;
  NSObject *v90;
  NSObject *v91;
  void *v92;
  double v93;
  void *v94;
  void *v96;
  void *v97;
  NSObject *v98;
  uint64_t v99;
  void *v100;
  int v101;
  const char *v102;
  __int16 v103;
  int v104;
  __int16 v105;
  const char *v106;
  __int16 v107;
  double v108;
  __int16 v109;
  uint64_t v110;
  uint64_t v111;

  v111 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "value");
  v6 = v5;
  objc_msgSend(v4, "relativeTime");
  v8 = v7;
  if (kHAPIScope)
  {
    if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
    {
      v9 = *(id *)kHAPIScope;
      if (v9)
      {
        v10 = v9;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v4, "parameterID");
          v11 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          v101 = 136315906;
          v102 = "HapticCommandConverter.mm";
          v103 = 1024;
          v104 = 590;
          v105 = 2080;
          v106 = "-[HapticCommandConverter eventForDynamicParameterEntry:]";
          v107 = 2112;
          v108 = v11;
          _os_log_impl(&dword_1B573F000, v10, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Dynamic parameter ID '%@':", (uint8_t *)&v101, 0x26u);

        }
      }
    }
  }
  +[CHHapticEngine capabilitiesForHardware](CHHapticEngine, "capabilitiesForHardware");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parameterID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CHHapticDynamicParameterIDHapticIntensityControl);

  if (v14)
  {
    if (kHAPIScope)
    {
      if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
      {
        v15 = *(id *)kHAPIScope;
        if (v15)
        {
          v16 = v15;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            v101 = 136316162;
            v102 = "HapticCommandConverter.mm";
            v103 = 1024;
            v104 = 593;
            v105 = 2080;
            v106 = "-[HapticCommandConverter eventForDynamicParameterEntry:]";
            v107 = 2048;
            v108 = v6;
            v109 = 2048;
            v110 = v8;
            _os_log_impl(&dword_1B573F000, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating event for haptic volume %f for time %f seconds", (uint8_t *)&v101, 0x30u);
          }

        }
      }
    }
    v17 = (void *)MEMORY[0x1E0CFF740];
    objc_msgSend(v4, "parameterID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v19 = v6;
    -[HapticCommandConverter limitDynamicParameter:value:parameter:](self, "limitDynamicParameter:value:parameter:", v12, v18, v19);
    objc_msgSend(v17, "eventWithParameter:value:time:", 2000);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "parameterID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isEqualToString:", CHHapticDynamicParameterIDHapticSharpnessControl);

    if (v22)
    {
      if (kHAPIScope)
      {
        if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
        {
          v23 = *(id *)kHAPIScope;
          if (v23)
          {
            v24 = v23;
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
            {
              v101 = 136316162;
              v102 = "HapticCommandConverter.mm";
              v103 = 1024;
              v104 = 597;
              v105 = 2080;
              v106 = "-[HapticCommandConverter eventForDynamicParameterEntry:]";
              v107 = 2048;
              v108 = v6;
              v109 = 2048;
              v110 = v8;
              _os_log_impl(&dword_1B573F000, v24, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating event for haptic transposition %f for time %f seconds", (uint8_t *)&v101, 0x30u);
            }

          }
        }
      }
      v25 = (void *)MEMORY[0x1E0CFF740];
      objc_msgSend(v4, "parameterID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v26 = v6;
      -[HapticCommandConverter limitDynamicParameter:value:parameter:](self, "limitDynamicParameter:value:parameter:", v12, v18, v26);
      objc_msgSend(v25, "eventWithParameter:value:time:", 2001);
      v20 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v4, "parameterID");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "isEqualToString:", CHHapticDynamicParameterIDHapticAttackTimeControl);

      if (v28)
      {
        if (kHAPIScope)
        {
          if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
          {
            v29 = *(id *)kHAPIScope;
            if (v29)
            {
              v30 = v29;
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
              {
                v101 = 136316162;
                v102 = "HapticCommandConverter.mm";
                v103 = 1024;
                v104 = 601;
                v105 = 2080;
                v106 = "-[HapticCommandConverter eventForDynamicParameterEntry:]";
                v107 = 2048;
                v108 = v6;
                v109 = 2048;
                v110 = v8;
                _os_log_impl(&dword_1B573F000, v30, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating event for haptic attack time %f for time %f seconds", (uint8_t *)&v101, 0x30u);
              }

            }
          }
        }
        v31 = (void *)MEMORY[0x1E0CFF740];
        objc_msgSend(v4, "parameterID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(float *)&v32 = v6;
        -[HapticCommandConverter limitDynamicParameter:value:parameter:](self, "limitDynamicParameter:value:parameter:", v12, v18, v32);
        objc_msgSend(v31, "eventWithParameter:value:time:", 2010);
        v20 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v4, "parameterID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "isEqualToString:", CHHapticDynamicParameterIDHapticDecayTimeControl);

        if (v34)
        {
          if (kHAPIScope)
          {
            if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
            {
              v35 = *(id *)kHAPIScope;
              if (v35)
              {
                v36 = v35;
                if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
                {
                  v101 = 136316162;
                  v102 = "HapticCommandConverter.mm";
                  v103 = 1024;
                  v104 = 605;
                  v105 = 2080;
                  v106 = "-[HapticCommandConverter eventForDynamicParameterEntry:]";
                  v107 = 2048;
                  v108 = v6;
                  v109 = 2048;
                  v110 = v8;
                  _os_log_impl(&dword_1B573F000, v36, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating event for haptic decay time %f for time %f seconds", (uint8_t *)&v101, 0x30u);
                }

              }
            }
          }
          v37 = (void *)MEMORY[0x1E0CFF740];
          objc_msgSend(v4, "parameterID");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(float *)&v38 = v6;
          -[HapticCommandConverter limitDynamicParameter:value:parameter:](self, "limitDynamicParameter:value:parameter:", v12, v18, v38);
          objc_msgSend(v37, "eventWithParameter:value:time:", 2011);
          v20 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v4, "parameterID");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "isEqualToString:", CHHapticDynamicParameterIDHapticReleaseTimeControl);

          if (v40)
          {
            if (kHAPIScope)
            {
              if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
              {
                v41 = *(id *)kHAPIScope;
                if (v41)
                {
                  v42 = v41;
                  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
                  {
                    v101 = 136316162;
                    v102 = "HapticCommandConverter.mm";
                    v103 = 1024;
                    v104 = 609;
                    v105 = 2080;
                    v106 = "-[HapticCommandConverter eventForDynamicParameterEntry:]";
                    v107 = 2048;
                    v108 = v6;
                    v109 = 2048;
                    v110 = v8;
                    _os_log_impl(&dword_1B573F000, v42, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating event for haptic release time %f for time %f seconds", (uint8_t *)&v101, 0x30u);
                  }

                }
              }
            }
            v43 = (void *)MEMORY[0x1E0CFF740];
            objc_msgSend(v4, "parameterID");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(float *)&v44 = v6;
            -[HapticCommandConverter limitDynamicParameter:value:parameter:](self, "limitDynamicParameter:value:parameter:", v12, v18, v44);
            objc_msgSend(v43, "eventWithParameter:value:time:", 2012);
            v20 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v4, "parameterID");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v45, "isEqualToString:", CHHapticDynamicParameterIDAudioVolumeControl);

            if (v46)
            {
              CALog::LogObjIfEnabled((CALog *)6, kHAPIScope, v47);
              v48 = objc_claimAutoreleasedReturnValue();
              v49 = v48;
              if (v48 && os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
              {
                v101 = 136316162;
                v102 = "HapticCommandConverter.mm";
                v103 = 1024;
                v104 = 613;
                v105 = 2080;
                v106 = "-[HapticCommandConverter eventForDynamicParameterEntry:]";
                v107 = 2048;
                v108 = v6;
                v109 = 2048;
                v110 = v8;
                _os_log_impl(&dword_1B573F000, v49, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating event for audio volume %f for time %f seconds", (uint8_t *)&v101, 0x30u);
              }

              v50 = (void *)MEMORY[0x1E0CFF740];
              objc_msgSend(v4, "parameterID");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(float *)&v51 = v6;
              -[HapticCommandConverter limitDynamicParameter:value:parameter:](self, "limitDynamicParameter:value:parameter:", v12, v18, v51);
              objc_msgSend(v50, "eventWithParameter:value:time:", 1000);
              v20 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              objc_msgSend(v4, "parameterID");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v53 = objc_msgSend(v52, "isEqualToString:", CHHapticDynamicParameterIDAudioBrightnessControl);

              if (v53)
              {
                CALog::LogObjIfEnabled((CALog *)6, kHAPIScope, v54);
                v55 = objc_claimAutoreleasedReturnValue();
                v56 = v55;
                if (v55 && os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
                {
                  v101 = 136316162;
                  v102 = "HapticCommandConverter.mm";
                  v103 = 1024;
                  v104 = 617;
                  v105 = 2080;
                  v106 = "-[HapticCommandConverter eventForDynamicParameterEntry:]";
                  v107 = 2048;
                  v108 = v6;
                  v109 = 2048;
                  v110 = v8;
                  _os_log_impl(&dword_1B573F000, v56, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating event for audio brightness %f for time %f seconds", (uint8_t *)&v101, 0x30u);
                }

                v57 = (void *)MEMORY[0x1E0CFF740];
                objc_msgSend(v4, "parameterID");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                *(float *)&v58 = v6;
                -[HapticCommandConverter limitDynamicParameter:value:parameter:](self, "limitDynamicParameter:value:parameter:", v12, v18, v58);
                objc_msgSend(v57, "eventWithParameter:value:time:", 1013);
                v20 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                objc_msgSend(v4, "parameterID");
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                v60 = objc_msgSend(v59, "isEqualToString:", CHHapticDynamicParameterIDAudioPanControl);

                if (v60)
                {
                  CALog::LogObjIfEnabled((CALog *)6, kHAPIScope, v61);
                  v62 = objc_claimAutoreleasedReturnValue();
                  v63 = v62;
                  if (v62 && os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
                  {
                    v101 = 136316162;
                    v102 = "HapticCommandConverter.mm";
                    v103 = 1024;
                    v104 = 621;
                    v105 = 2080;
                    v106 = "-[HapticCommandConverter eventForDynamicParameterEntry:]";
                    v107 = 2048;
                    v108 = v6;
                    v109 = 2048;
                    v110 = v8;
                    _os_log_impl(&dword_1B573F000, v63, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating event for audio pan %f for time %f seconds", (uint8_t *)&v101, 0x30u);
                  }

                  v64 = (void *)MEMORY[0x1E0CFF740];
                  objc_msgSend(v4, "parameterID");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  *(float *)&v65 = v6;
                  -[HapticCommandConverter limitDynamicParameter:value:parameter:](self, "limitDynamicParameter:value:parameter:", v12, v18, v65);
                  objc_msgSend(v64, "eventWithParameter:value:time:", 1015);
                  v20 = objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  objc_msgSend(v4, "parameterID");
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  v67 = objc_msgSend(v66, "isEqualToString:", CHHapticDynamicParameterIDAudioPitchControl);

                  if (v67)
                  {
                    CALog::LogObjIfEnabled((CALog *)6, kHAPIScope, v68);
                    v69 = objc_claimAutoreleasedReturnValue();
                    v70 = v69;
                    if (v69 && os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
                    {
                      v101 = 136316162;
                      v102 = "HapticCommandConverter.mm";
                      v103 = 1024;
                      v104 = 625;
                      v105 = 2080;
                      v106 = "-[HapticCommandConverter eventForDynamicParameterEntry:]";
                      v107 = 2048;
                      v108 = v6;
                      v109 = 2048;
                      v110 = v8;
                      _os_log_impl(&dword_1B573F000, v70, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating event for audio transposition %f for time %f seconds", (uint8_t *)&v101, 0x30u);
                    }

                    v71 = (void *)MEMORY[0x1E0CFF740];
                    objc_msgSend(v4, "parameterID");
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                    *(float *)&v72 = v6;
                    -[HapticCommandConverter limitDynamicParameter:value:parameter:](self, "limitDynamicParameter:value:parameter:", v12, v18, v72);
                    objc_msgSend(v71, "eventWithParameter:value:time:", 1001);
                    v20 = objc_claimAutoreleasedReturnValue();
                  }
                  else
                  {
                    objc_msgSend(v4, "parameterID");
                    v73 = (void *)objc_claimAutoreleasedReturnValue();
                    v74 = objc_msgSend(v73, "isEqualToString:", CHHapticDynamicParameterIDAudioAttackTimeControl);

                    if (v74)
                    {
                      CALog::LogObjIfEnabled((CALog *)6, kHAPIScope, v75);
                      v76 = objc_claimAutoreleasedReturnValue();
                      v77 = v76;
                      if (v76 && os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
                      {
                        v101 = 136316162;
                        v102 = "HapticCommandConverter.mm";
                        v103 = 1024;
                        v104 = 629;
                        v105 = 2080;
                        v106 = "-[HapticCommandConverter eventForDynamicParameterEntry:]";
                        v107 = 2048;
                        v108 = v6;
                        v109 = 2048;
                        v110 = v8;
                        _os_log_impl(&dword_1B573F000, v77, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating event for audio attack time %f for time %f seconds", (uint8_t *)&v101, 0x30u);
                      }

                      v78 = (void *)MEMORY[0x1E0CFF740];
                      objc_msgSend(v4, "parameterID");
                      v18 = (void *)objc_claimAutoreleasedReturnValue();
                      *(float *)&v79 = v6;
                      -[HapticCommandConverter limitDynamicParameter:value:parameter:](self, "limitDynamicParameter:value:parameter:", v12, v18, v79);
                      objc_msgSend(v78, "eventWithParameter:value:time:", 1010);
                      v20 = objc_claimAutoreleasedReturnValue();
                    }
                    else
                    {
                      objc_msgSend(v4, "parameterID");
                      v80 = (void *)objc_claimAutoreleasedReturnValue();
                      v81 = objc_msgSend(v80, "isEqualToString:", CHHapticDynamicParameterIDAudioDecayTimeControl);

                      if (v81)
                      {
                        CALog::LogObjIfEnabled((CALog *)6, kHAPIScope, v82);
                        v83 = objc_claimAutoreleasedReturnValue();
                        v84 = v83;
                        if (v83 && os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG))
                        {
                          v101 = 136316162;
                          v102 = "HapticCommandConverter.mm";
                          v103 = 1024;
                          v104 = 633;
                          v105 = 2080;
                          v106 = "-[HapticCommandConverter eventForDynamicParameterEntry:]";
                          v107 = 2048;
                          v108 = v6;
                          v109 = 2048;
                          v110 = v8;
                          _os_log_impl(&dword_1B573F000, v84, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating event for audio decay time %f for time %f seconds", (uint8_t *)&v101, 0x30u);
                        }

                        v85 = (void *)MEMORY[0x1E0CFF740];
                        objc_msgSend(v4, "parameterID");
                        v18 = (void *)objc_claimAutoreleasedReturnValue();
                        *(float *)&v86 = v6;
                        -[HapticCommandConverter limitDynamicParameter:value:parameter:](self, "limitDynamicParameter:value:parameter:", v12, v18, v86);
                        objc_msgSend(v85, "eventWithParameter:value:time:", 1011);
                        v20 = objc_claimAutoreleasedReturnValue();
                      }
                      else
                      {
                        objc_msgSend(v4, "parameterID");
                        v87 = (void *)objc_claimAutoreleasedReturnValue();
                        v88 = objc_msgSend(v87, "isEqualToString:", CHHapticDynamicParameterIDAudioReleaseTimeControl);

                        if (!v88)
                        {
                          CALog::LogObjIfEnabled((CALog *)1, kHAPIScope, v89);
                          v96 = (void *)objc_claimAutoreleasedReturnValue();
                          v97 = v96;
                          if (v96)
                          {
                            v98 = v96;
                            if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
                            {
                              objc_msgSend(v4, "parameterID");
                              *(double *)&v99 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                              v101 = 136315906;
                              v102 = "HapticCommandConverter.mm";
                              v103 = 1024;
                              v104 = 640;
                              v105 = 2080;
                              v106 = "-[HapticCommandConverter eventForDynamicParameterEntry:]";
                              v107 = 2112;
                              v108 = *(double *)&v99;
                              v100 = (void *)v99;
                              _os_log_impl(&dword_1B573F000, v98, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: Unrecognized dynamic parameter: %@", (uint8_t *)&v101, 0x26u);

                            }
                          }

                          Haptic_RaiseException(CFSTR("CoreHapticInvalidParamException"), CFSTR("Unknown dynamic parameter"), -4820);
                        }
                        CALog::LogObjIfEnabled((CALog *)6, kHAPIScope, v89);
                        v90 = objc_claimAutoreleasedReturnValue();
                        v91 = v90;
                        if (v90 && os_log_type_enabled(v90, OS_LOG_TYPE_DEBUG))
                        {
                          v101 = 136316162;
                          v102 = "HapticCommandConverter.mm";
                          v103 = 1024;
                          v104 = 637;
                          v105 = 2080;
                          v106 = "-[HapticCommandConverter eventForDynamicParameterEntry:]";
                          v107 = 2048;
                          v108 = v6;
                          v109 = 2048;
                          v110 = v8;
                          _os_log_impl(&dword_1B573F000, v91, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Creating event for audio release time %f for time %f seconds", (uint8_t *)&v101, 0x30u);
                        }

                        v92 = (void *)MEMORY[0x1E0CFF740];
                        objc_msgSend(v4, "parameterID");
                        v18 = (void *)objc_claimAutoreleasedReturnValue();
                        *(float *)&v93 = v6;
                        -[HapticCommandConverter limitDynamicParameter:value:parameter:](self, "limitDynamicParameter:value:parameter:", v12, v18, v93);
                        objc_msgSend(v92, "eventWithParameter:value:time:", 1012);
                        v20 = objc_claimAutoreleasedReturnValue();
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  v94 = (void *)v20;

  return v94;
}

- (id)eventForParameterCurveEntry:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (kHAPIScope)
  {
    if ((*(_BYTE *)(kHAPIScope + 8) & 1) != 0)
    {
      v5 = *(id *)kHAPIScope;
      if (v5)
      {
        v6 = v5;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v4, "parameterID");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "relativeTime");
          v12 = 136316162;
          v13 = "HapticCommandConverter.mm";
          v14 = 1024;
          v15 = 647;
          v16 = 2080;
          v17 = "-[HapticCommandConverter eventForParameterCurveEntry:]";
          v18 = 2112;
          v19 = v7;
          v20 = 2048;
          v21 = v8;
          _os_log_impl(&dword_1B573F000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d %s: Parameter curve ID: '%@', relative time: %f", (uint8_t *)&v12, 0x30u);

        }
      }
    }
  }
  -[HapticCommandConverter CHtoAVParameterCurve:](self, "CHtoAVParameterCurve:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CFF740], "eventWithParameterCurve:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)CHtoAVParameterCurve:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unsigned int v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  int v17;
  int v18;
  void *v19;
  double v20;
  int v21;
  int v22;
  id v23;
  double v24;
  void *v25;
  void *v27;
  char v28;
  uint64_t v29;
  void *v30;
  char v31;
  void *v32;
  char v33;
  void *v34;
  char v35;
  void *v36;
  char v37;
  void *v38;
  char v39;
  const CALog::Scope *v40;
  id v41;
  void *v42;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  int v48;
  const char *v49;
  __int16 v50;
  int v51;
  __int16 v52;
  const char *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "controlPoints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v6);
  +[CHHapticEngine capabilitiesForHardware](CHHapticEngine, "capabilitiesForHardware");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v9 = 0;
    v10 = 1;
    do
    {
      objc_msgSend(v4, "controlPoints");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndex:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "relativeTime");
      v14 = v13;

      objc_msgSend(v4, "controlPoints");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectAtIndex:", v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "value");
      v18 = v17;

      objc_msgSend(v4, "parameterID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v20) = v18;
      -[HapticCommandConverter limitDynamicParameter:value:parameter:](self, "limitDynamicParameter:value:parameter:", v8, v19, v20);
      v22 = v21;

      v23 = objc_alloc(MEMORY[0x1E0CFF750]);
      LODWORD(v24) = v22;
      v25 = (void *)objc_msgSend(v23, "initWithTime:value:", v14, v24);
      objc_msgSend(v7, "addObject:", v25);

      v9 = v10;
    }
    while (v6 > v10++);
  }
  objc_msgSend(v4, "parameterID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isEqualToString:", CHHapticDynamicParameterIDAudioVolumeControl);

  if ((v28 & 1) != 0)
  {
    v29 = 1000;
  }
  else
  {
    objc_msgSend(v4, "parameterID");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "isEqualToString:", CHHapticDynamicParameterIDAudioPanControl);

    if ((v31 & 1) != 0)
    {
      v29 = 1015;
    }
    else
    {
      objc_msgSend(v4, "parameterID");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = objc_msgSend(v32, "isEqualToString:", CHHapticDynamicParameterIDAudioBrightnessControl);

      if ((v33 & 1) != 0)
      {
        v29 = 1013;
      }
      else
      {
        objc_msgSend(v4, "parameterID");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "isEqualToString:", CHHapticDynamicParameterIDAudioPitchControl);

        if ((v35 & 1) != 0)
        {
          v29 = 1001;
        }
        else
        {
          objc_msgSend(v4, "parameterID");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "isEqualToString:", CHHapticDynamicParameterIDHapticIntensityControl);

          if ((v37 & 1) != 0)
          {
            v29 = 2000;
          }
          else
          {
            objc_msgSend(v4, "parameterID");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = objc_msgSend(v38, "isEqualToString:", CHHapticDynamicParameterIDHapticSharpnessControl);

            if ((v39 & 1) == 0)
            {
              CALog::LogObjIfEnabled((CALog *)1, kHAPIScope, v40);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              v45 = v44;
              if (v44)
              {
                v46 = v44;
                if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v4, "parameterID");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  v48 = 136315906;
                  v49 = "HapticCommandConverter.mm";
                  v50 = 1024;
                  v51 = 691;
                  v52 = 2080;
                  v53 = "-[HapticCommandConverter CHtoAVParameterCurve:]";
                  v54 = 2112;
                  v55 = v47;
                  _os_log_impl(&dword_1B573F000, v46, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: ERROR: ID %@ is not supported by parameter curves", (uint8_t *)&v48, 0x26u);

                }
              }

              Haptic_RaiseException(CFSTR("CoreHapticInvalidParamException"), CFSTR("Invalid dynamic parameter for curve"), -4820);
            }
            v29 = 2001;
          }
        }
      }
    }
  }
  v41 = objc_alloc(MEMORY[0x1E0CFF748]);
  objc_msgSend(v4, "relativeTime");
  v42 = (void *)objc_msgSend(v41, "initWithType:relativeTime:shape:controlPoints:", v29, 1, v7);

  return v42;
}

@end
