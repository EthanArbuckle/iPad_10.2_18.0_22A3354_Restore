@implementation NUUtilities

+ (BOOL)runningUnderDebugger
{
  if (runningUnderDebugger_onceToken != -1)
    dispatch_once(&runningUnderDebugger_onceToken, &__block_literal_global_24245);
  return runningUnderDebugger_runningUnderDebugger;
}

uint64_t __35__NUUtilities_runningUnderDebugger__block_invoke()
{
  uint64_t result;
  size_t v1;
  _OWORD v2[2];
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  int v33[2];
  int v34;
  pid_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v5 = 0u;
  v6 = 0u;
  v3 = 0u;
  v4 = 0u;
  memset(v2, 0, sizeof(v2));
  LODWORD(v3) = 0;
  *(_QWORD *)v33 = 0xE00000001;
  v34 = 1;
  v35 = getpid();
  v1 = 648;
  result = sysctl(v33, 4u, v2, &v1, 0, 0);
  runningUnderDebugger_runningUnderDebugger = (v3 & 0x800) != 0;
  return result;
}

@end
