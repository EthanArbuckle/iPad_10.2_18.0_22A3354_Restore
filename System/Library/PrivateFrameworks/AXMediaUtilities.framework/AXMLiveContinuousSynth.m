@implementation AXMLiveContinuousSynth

- (void)renderInBuffer:(void *)a3 atFrame:(unint64_t)a4 numSamples:(unint64_t)a5
{
  uint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  char v12;
  unint64_t v13;
  unint64_t v14;
  double v15;
  double v16;
  unint64_t v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  unint64_t v26;
  unint64_t v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  id obj;
  uint64_t v50;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  -[AXMSynth bypassEnvelopes](self, "bypassEnvelopes");
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  -[AXMSynth allOscillators](self, "allOscillators");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
  if (v8)
  {
    v50 = *(_QWORD *)v54;
    do
    {
      v52 = v8;
      for (i = 0; i != v52; ++i)
      {
        if (*(_QWORD *)v54 != v50)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        objc_msgSend(v10, "updateCache");
        v11 = objc_msgSend(v10, "isBypassed");
        if (a5 + a4 <= a4)
          v12 = 1;
        else
          v12 = v11;
        v13 = a5;
        v14 = a4;
        if ((v12 & 1) == 0)
        {
          do
          {
            objc_msgSend(v10, "getNextSample");
            v16 = v15;
            v17 = -[AXMLiveContinuousSynth framesRendered](self, "framesRendered");
            -[AXMSynth sampleRate](self, "sampleRate");
            v19 = v18;
            -[AXMSynth envelope](self, "envelope");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "attackMS");
            v21 = (double)v17 / v19 * 1000.0;
            LODWORD(v17) = v21 < v22;

            if ((_DWORD)v17)
            {
              -[AXMSynth envelope](self, "envelope");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "levelForTime:", v21);
              v25 = v24;

              v16 = v16 * v25;
            }
            if (-[AXMLiveContinuousSynth releasing](self, "releasing"))
            {
              v26 = -[AXMLiveContinuousSynth framesRendered](self, "framesRendered");
              v27 = -[AXMLiveContinuousSynth releaseFrame](self, "releaseFrame");
              -[AXMSynth sampleRate](self, "sampleRate");
              v29 = v28;
              -[AXMSynth envelope](self, "envelope");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "releaseMS");
              v31 = (double)(v26 - v27) / v29 * 1000.0;
              LOBYTE(v26) = v31 > v32;

              v33 = 0.0;
              if ((v26 & 1) == 0)
              {
                -[AXMSynth envelope](self, "envelope");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "attackMS");
                v36 = v35;
                -[AXMSynth envelope](self, "envelope");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "decayMS");
                v39 = v38;
                -[AXMSynth envelope](self, "envelope");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "sustainMS");
                v42 = v41;

                -[AXMSynth envelope](self, "envelope");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v43, "levelForTime:", v31 + v36 + v39 + v42);
                v45 = v44;

                v33 = v16 * v45;
              }
            }
            else if (-[AXMLiveContinuousSynth muted](self, "muted"))
            {
              v33 = 0.0;
            }
            else
            {
              v33 = v16;
            }
            v47 = *(_QWORD *)a3;
            v46 = *((_QWORD *)a3 + 1);
            -[AXMSynth gain](self, "gain");
            *(_DWORD *)(*(_QWORD *)a3 + 4 * (v14 % ((v46 - v47) >> 2))) += (int)(v33 * 32500.0 * v48);
            if (!-[AXMLiveContinuousSynth muted](self, "muted")
              || -[AXMLiveContinuousSynth releasing](self, "releasing"))
            {
              -[AXMLiveContinuousSynth setFramesRendered:](self, "setFramesRendered:", -[AXMLiveContinuousSynth framesRendered](self, "framesRendered") + 1);
            }
            ++v14;
            --v13;
          }
          while (v13);
        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
    }
    while (v8);
  }

}

- (void)startRelease
{
  if (!-[AXMLiveContinuousSynth muted](self, "muted"))
  {
    self->_releaseFrame = -[AXMLiveContinuousSynth framesRendered](self, "framesRendered");
    self->_releasing = 1;
  }
}

- (BOOL)muted
{
  return self->_muted;
}

- (void)setMuted:(BOOL)a3
{
  self->_muted = a3;
}

- (unint64_t)framesRendered
{
  return self->_framesRendered;
}

- (void)setFramesRendered:(unint64_t)a3
{
  self->_framesRendered = a3;
}

- (BOOL)releasing
{
  return self->_releasing;
}

- (void)setReleasing:(BOOL)a3
{
  self->_releasing = a3;
}

- (unint64_t)releaseFrame
{
  return self->_releaseFrame;
}

- (void)setReleaseFrame:(unint64_t)a3
{
  self->_releaseFrame = a3;
}

@end
