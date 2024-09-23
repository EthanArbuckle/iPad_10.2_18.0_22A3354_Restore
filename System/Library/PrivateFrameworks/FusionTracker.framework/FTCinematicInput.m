@implementation FTCinematicInput

- (FTCinematicInput)init
{
  FTCinematicInput *v2;
  FTCinematicInput *v3;
  FTCinematicInput *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FTCinematicInput;
  v2 = -[FTCinematicInput init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[FTCinematicInput setHighPriorityTrackId:](v2, "setHighPriorityTrackId:", -1);
    -[FTCinematicInput setTapPosition:](v3, "setTapPosition:", -1.0, -1.0);
    v4 = v3;
  }

  return v3;
}

- (vector<ft::Observation,)mapToInternalObservations
{
  void *v4;
  unint64_t v5;
  unint64_t v6;
  Observation *var0;
  Observation *var1;
  char *v9;
  Observation *v10;
  Observation *v11;
  char *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  Observation *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  char v31;
  uint64_t v32;
  Observation *v33;
  Observation *v34;
  Observation *v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  char *v40;
  char *v41;
  Observation *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  Observation *v50;
  vector<ft::Observation, std::allocator<ft::Observation>> *result;
  uint64_t v52;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[64];
  __int128 v59;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  -[FTCinematicInput observations](self, "observations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v6 = v5;
  var0 = retstr->var0;
  if (0x86BCA1AF286BCA1BLL * ((retstr->var2.var0 - retstr->var0) >> 3) < v5)
  {
    if (v5 > 0x1AF286BCA1AF286)
      std::vector<long long>::__throw_length_error[abi:ne180100]();
    var1 = retstr->var1;
    v9 = (char *)operator new(152 * v5);
    v10 = (Observation *)&v9[152 * ((var1 - var0) / 152)];
    v11 = v10;
    if (var1 != var0)
    {
      v12 = &v9[152 * ((var1 - var0) / 152)];
      do
      {
        v13 = *(_OWORD *)((char *)var1 - 152);
        *(_OWORD *)(v12 - 136) = *(_OWORD *)((char *)var1 - 136);
        *(_OWORD *)(v12 - 152) = v13;
        v14 = *(_OWORD *)((char *)var1 - 120);
        v15 = *(_OWORD *)((char *)var1 - 104);
        v16 = *(_OWORD *)((char *)var1 - 88);
        *(_OWORD *)(v12 - 72) = *(_OWORD *)((char *)var1 - 72);
        *(_OWORD *)(v12 - 88) = v16;
        *(_OWORD *)(v12 - 104) = v15;
        *(_OWORD *)(v12 - 120) = v14;
        v17 = *(_OWORD *)((char *)var1 - 56);
        v18 = *(_OWORD *)((char *)var1 - 40);
        v19 = *(_OWORD *)((char *)var1 - 24);
        v11 = (Observation *)(v12 - 152);
        *((_QWORD *)v12 - 1) = *((_QWORD *)var1 - 1);
        *(_OWORD *)(v12 - 24) = v19;
        *(_OWORD *)(v12 - 40) = v18;
        *(_OWORD *)(v12 - 56) = v17;
        var1 = (Observation *)((char *)var1 - 152);
        v12 -= 152;
      }
      while (var1 != var0);
    }
    retstr->var0 = v11;
    retstr->var1 = v10;
    retstr->var2.var0 = (Observation *)&v9[152 * v6];
    if (var0)
      operator delete(var0);
  }

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  -[FTCinematicInput observations](self, "observations");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
  if (v21)
  {
    v22 = 0;
    v52 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v62 != v52)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        objc_msgSend(v25, "box");
        *(_QWORD *)&v56 = v26;
        *((_QWORD *)&v56 + 1) = v27;
        *(_QWORD *)&v57 = v28;
        *((_QWORD *)&v57 + 1) = v29;
        *(_QWORD *)v58 = objc_msgSend(v25, "objectKind");
        objc_msgSend(v25, "confidence");
        *(_DWORD *)&v58[8] = v30;
        if (v25)
        {
          objc_msgSend(v25, "frameTimestamp");
          objc_msgSend(v25, "lastDetectionTimestamp");
        }
        else
        {
          memset(&v58[12], 0, 48);
        }
        v31 = objc_opt_respondsToSelector();
        v32 = -1;
        if ((v31 & 1) != 0)
          v32 = objc_msgSend(v25, "identifier");
        *(_QWORD *)&v59 = v32;
        BYTE8(v59) = 1;
        -[FTCinematicInput sourceFrameTimestamp](self, "sourceFrameTimestamp");
        *((_QWORD *)&v55 + 1) = v22;
        LOBYTE(v60) = 1;
        v34 = retstr->var1;
        v33 = retstr->var2.var0;
        if (v34 < v33)
        {
          *(_OWORD *)v34 = v56;
          *((_OWORD *)v34 + 1) = v57;
          *((_OWORD *)v34 + 4) = *(_OWORD *)&v58[32];
          *((_OWORD *)v34 + 5) = *(_OWORD *)&v58[48];
          *((_OWORD *)v34 + 2) = *(_OWORD *)v58;
          *((_OWORD *)v34 + 3) = *(_OWORD *)&v58[16];
          *((_QWORD *)v34 + 18) = v60;
          *((_OWORD *)v34 + 7) = v54;
          *((_OWORD *)v34 + 8) = v55;
          *((_OWORD *)v34 + 6) = v59;
          v24 = (Observation *)((char *)v34 + 152);
        }
        else
        {
          v35 = retstr->var0;
          v36 = 0x86BCA1AF286BCA1BLL * ((v34 - retstr->var0) >> 3);
          v37 = v36 + 1;
          if (v36 + 1 > 0x1AF286BCA1AF286)
            std::vector<long long>::__throw_length_error[abi:ne180100]();
          v38 = 0x86BCA1AF286BCA1BLL * ((v33 - v35) >> 3);
          if (2 * v38 > v37)
            v37 = 2 * v38;
          if (v38 >= 0xD79435E50D7943)
            v39 = 0x1AF286BCA1AF286;
          else
            v39 = v37;
          if (v39)
          {
            if (v39 > 0x1AF286BCA1AF286)
              std::__throw_bad_array_new_length[abi:ne180100]();
            v40 = (char *)operator new(152 * v39);
          }
          else
          {
            v40 = 0;
          }
          v41 = &v40[152 * v36];
          *((_OWORD *)v41 + 6) = v59;
          *((_OWORD *)v41 + 7) = v54;
          *((_OWORD *)v41 + 8) = v55;
          *((_QWORD *)v41 + 18) = v60;
          *((_OWORD *)v41 + 2) = *(_OWORD *)v58;
          *((_OWORD *)v41 + 3) = *(_OWORD *)&v58[16];
          *((_OWORD *)v41 + 4) = *(_OWORD *)&v58[32];
          *((_OWORD *)v41 + 5) = *(_OWORD *)&v58[48];
          *(_OWORD *)v41 = v56;
          *((_OWORD *)v41 + 1) = v57;
          v42 = (Observation *)v41;
          if (v34 != v35)
          {
            do
            {
              v43 = *(_OWORD *)((char *)v34 - 152);
              *(_OWORD *)((char *)v42 - 136) = *(_OWORD *)((char *)v34 - 136);
              *(_OWORD *)((char *)v42 - 152) = v43;
              v44 = *(_OWORD *)((char *)v34 - 120);
              v45 = *(_OWORD *)((char *)v34 - 104);
              v46 = *(_OWORD *)((char *)v34 - 88);
              *(_OWORD *)((char *)v42 - 72) = *(_OWORD *)((char *)v34 - 72);
              *(_OWORD *)((char *)v42 - 88) = v46;
              *(_OWORD *)((char *)v42 - 104) = v45;
              *(_OWORD *)((char *)v42 - 120) = v44;
              v47 = *(_OWORD *)((char *)v34 - 56);
              v48 = *(_OWORD *)((char *)v34 - 40);
              v49 = *(_OWORD *)((char *)v34 - 24);
              *((_QWORD *)v42 - 1) = *((_QWORD *)v34 - 1);
              *(_OWORD *)((char *)v42 - 24) = v49;
              *(_OWORD *)((char *)v42 - 40) = v48;
              *(_OWORD *)((char *)v42 - 56) = v47;
              v42 = (Observation *)((char *)v42 - 152);
              v34 = (Observation *)((char *)v34 - 152);
            }
            while (v34 != v35);
            v34 = v35;
          }
          v50 = (Observation *)&v40[152 * v39];
          v24 = (Observation *)(v41 + 152);
          retstr->var0 = v42;
          retstr->var1 = (Observation *)(v41 + 152);
          retstr->var2.var0 = v50;
          if (v34)
            operator delete(v34);
        }
        retstr->var1 = v24;
        ++v22;
      }
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
    }
    while (v21);
  }

  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)sourceFrameTimestamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 56);
  return self;
}

- (void)setSourceFrameTimestamp:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  self->_sourceFrameTimestamp.epoch = a3->var3;
  *(_OWORD *)&self->_sourceFrameTimestamp.value = v3;
}

- (CGPoint)tapPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_tapPosition.x;
  y = self->_tapPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setTapPosition:(CGPoint)a3
{
  self->_tapPosition = a3;
}

- (FTCinematicTapRequest)tapRequest
{
  return self->_tapRequest;
}

- (void)setTapRequest:(id)a3
{
  objc_storeStrong((id *)&self->_tapRequest, a3);
}

- (NSArray)observations
{
  return self->_observations;
}

- (void)setObservations:(id)a3
{
  objc_storeStrong((id *)&self->_observations, a3);
}

- (BOOL)detectorDidRun
{
  return self->_detectorDidRun;
}

- (void)setDetectorDidRun:(BOOL)a3
{
  self->_detectorDidRun = a3;
}

- (int64_t)highPriorityTrackId
{
  return self->_highPriorityTrackId;
}

- (void)setHighPriorityTrackId:(int64_t)a3
{
  self->_highPriorityTrackId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observations, 0);
  objc_storeStrong((id *)&self->_tapRequest, 0);
}

@end
