@implementation APReceiverStatsCollectorEnableHUD

uint64_t __APReceiverStatsCollectorEnableHUD_block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  const __CFDictionary *v3;
  BOOL v4;
  id v5;
  int v6;
  void *Value;
  void *v8;
  int Int32IfPresent;
  APHUDLayer *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  const void *v17;
  APGraphLayer *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  APLatencyVisualizationLayer *v31;
  double v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;

  v1 = result;
  v3 = *(const __CFDictionary **)(result + 32);
  v2 = *(_QWORD *)(result + 40);
  if (!v3)
    v3 = *(const __CFDictionary **)(v2 + 48);
  if (*(_BYTE *)(v2 + 256))
    v4 = 1;
  else
    v4 = v3 == 0;
  if (!v4)
  {
    v5 = objc_alloc_init(MEMORY[0x24BDD1460]);
    v6 = *(_DWORD *)(v2 + 260);
    Value = (void *)CFDictionaryGetValue(v3, CFSTR("PresentationLayer"));
    if (Value)
    {
      v8 = Value;
      Int32IfPresent = FigCFDictionaryGetInt32IfPresent();
      *(_QWORD *)(v2 + 24) = v8;
      objc_msgSend(MEMORY[0x24BDE57D8], "begin");
      objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
      v10 = objc_alloc_init(APHUDLayer);
      *(_QWORD *)(v2 + 32) = v10;
      -[APHUDLayer setName:](v10, "setName:", CFSTR("HUDLayer"));
      objc_msgSend(*(id *)(v2 + 32), "setFrame:", 40.0, 40.0, 400.0, 470.0);
      objc_msgSend(*(id *)(v2 + 32), "setEdgeAntialiasingMask:", 0);
      if (Int32IfPresent)
        objc_msgSend(*(id *)(v2 + 32), "setZPosition:", (double)0);
      objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" Version:\t"), 14);
      objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" Interface:\t"), 14);
      v11 = *(void **)(v2 + 32);
      if (v6)
      {
        v12 = CFSTR(" TReg(R):\t");
      }
      else
      {
        objc_msgSend(v11, "addLine:withColorIndex:", CFSTR(" TReg(S):\t"), 14);
        objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" TReg(R):\t"), 14);
        v11 = *(void **)(v2 + 32);
        v12 = CFSTR(" S WxH:\t");
      }
      objc_msgSend(v11, "addLine:withColorIndex:", v12, 14);
      objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" D WxH:\t"), 14);
      objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" Codec:\t"), 14);
      v13 = *(void **)(v2 + 32);
      if (v6)
      {
        objc_msgSend(v13, "addLine:withColorIndex:", CFSTR(" TV-FPS:\t"), 0);
        objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" TV-DPS:\t"), 14);
        objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" RSSI(R):\t"), 14);
        objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" Chan(R):\t"), 14);
        objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" Seq(R1):\t"), 14);
        v14 = *(void **)(v2 + 32);
        v15 = CFSTR(" Seq(R2):\t");
        v16 = 14;
      }
      else
      {
        objc_msgSend(v13, "addLine:withColorIndex:", CFSTR(" Chroma:\t"), 14);
        objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" P-FPS:\t"), 14);
        objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" W-FPS:\t"), 14);
        objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" SubS:\t"), 14);
        objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" B4En:\t"), 1);
        objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" FPS Th:\t"), 14);
        objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" Q-FPS:\t"), 14);
        objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" S-FPS:\t"), 14);
        objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" R-FPS:\t"), 14);
        objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" TV-FPS:\t"), 0);
        objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" TV-DPS:\t"), 14);
        objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" Est BW:\t"), 3);
        objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" Act BW:\t"), 4);
        objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" Loss:\t"), 14);
        objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" RTT:\t"), 14);
        objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" Latency:\t"), 14);
        objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" Ahead:\t"), 2);
        objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" EnDp:\t"), 14);
        objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" IdEn:\t"), 14);
        objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" IdDp:\t"), 14);
        objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" CPU:\t"), 14);
        objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" RSSI(S):\t"), 14);
        objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" RSSI(R):\t"), 14);
        objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" Chan(S):\t"), 14);
        objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" Chan(R):\t"), 14);
        objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" Seq(S1):\t"), 14);
        objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" Seq(S2):\t"), 14);
        objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" Seq(R1):\t"), 14);
        objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" Seq(R2):\t"), 14);
        v14 = *(void **)(v2 + 32);
        v15 = CFSTR(" SO Drops:\t");
        v16 = 5;
      }
      objc_msgSend(v14, "addLine:withColorIndex:", v15, v16);
      objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" A Buff\t"), 14);
      objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" A Lost:\t"), 14);
      objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" A Unrec:\t"), 14);
      objc_msgSend(*(id *)(v2 + 32), "addLine:withColorIndex:", CFSTR(" A Late:\t"), 14);
      v17 = (const void *)CGColorCreateWithRGB();
      objc_msgSend(*(id *)(v2 + 32), "setBackgroundColor:", v17);
      CFRelease(v17);
      objc_msgSend(*(id *)(v2 + 32), "setGeometryFlipped:", objc_msgSend(*(id *)(v2 + 24), "contentsAreFlipped") ^ 1);
      objc_msgSend(*(id *)(v2 + 24), "addSublayer:", *(_QWORD *)(v2 + 32));
      v18 = objc_alloc_init(APGraphLayer);
      *(_QWORD *)(v2 + 40) = v18;
      -[APGraphLayer setName:](v18, "setName:", CFSTR("GraphLayer"));
      objc_msgSend(*(id *)(v2 + 40), "setFrame:", 40.0, 520.0, 195.0, 150.0);
      objc_msgSend(*(id *)(v2 + 40), "setBorderWidth:", 1.0);
      objc_msgSend(*(id *)(v2 + 40), "setEdgeAntialiasingMask:", 0);
      if (Int32IfPresent)
        objc_msgSend(*(id *)(v2 + 40), "setZPosition:", (double)0);
      objc_msgSend(*(id *)(v2 + 40), "setUpGraphs:", 6);
      LODWORD(v19) = 1116471296;
      LODWORD(v20) = 0;
      objc_msgSend(*(id *)(v2 + 40), "setUpGraph:min:max:numValues:", 0, 30, v20, v19);
      if (!v6)
      {
        LODWORD(v22) = 1116471296;
        LODWORD(v21) = 0;
        objc_msgSend(*(id *)(v2 + 40), "setUpGraph:min:max:numValues:", 1, 30, v21, v22);
        LODWORD(v23) = 1120403456;
        LODWORD(v24) = -20.0;
        objc_msgSend(*(id *)(v2 + 40), "setUpGraph:min:max:numValues:", 2, 30, v24, v23);
        LODWORD(v25) = 0;
        LODWORD(v26) = 20.0;
        objc_msgSend(*(id *)(v2 + 40), "setUpGraph:min:max:numValues:", 3, 30, v25, v26);
        LODWORD(v27) = 0;
        LODWORD(v28) = 25.0;
        objc_msgSend(*(id *)(v2 + 40), "setUpGraph:min:max:numValues:", 4, 30, v27, v28);
        LODWORD(v29) = 0;
        LODWORD(v30) = 30.0;
        objc_msgSend(*(id *)(v2 + 40), "setUpGraph:min:max:numValues:", 5, 30, v29, v30);
      }
      objc_msgSend(*(id *)(v2 + 40), "setGeometryFlipped:", objc_msgSend(*(id *)(v2 + 24), "contentsAreFlipped") ^ 1);
      objc_msgSend(*(id *)(v2 + 24), "addSublayer:", *(_QWORD *)(v2 + 40));
      if (FigGetCFPreferenceNumberWithDefault())
      {
        v31 = [APLatencyVisualizationLayer alloc];
        objc_msgSend(*(id *)(v2 + 40), "zPosition");
        v33 = -[APLatencyVisualizationLayer init:timeContext:zPosition:](v31, "init:timeContext:zPosition:", aprstats_getSynchronizedNetworkTime, v2, (int)(v32 + 3.0));
        objc_msgSend(v33, "setFrame:", *(double *)(v2 + 160), *(double *)(v2 + 168), *(double *)(v2 + 176), *(double *)(v2 + 184));
        objc_msgSend(*(id *)(v2 + 24), "addSublayer:", v33);
        *(_QWORD *)(v2 + 264) = -[APLatencyVisualizationTrackingController init:]([APLatencyVisualizationTrackingController alloc], "init:", v33);

        if (gLogCategory_APReceiverStatsCollector <= 30
          && (gLogCategory_APReceiverStatsCollector != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
      objc_msgSend(MEMORY[0x24BDE57D8], "commit");
      if (gLogCategory_APReceiverStatsCollector <= 30
        && (gLogCategory_APReceiverStatsCollector != -1 || _LogCategory_Initialize()))
      {
        objc_msgSend(*(id *)(v2 + 32), "frame");
        v35 = v34;
        objc_msgSend(*(id *)(v2 + 32), "frame");
        v37 = v36;
        objc_msgSend(*(id *)(v2 + 32), "frame");
        v39 = v38;
        objc_msgSend(*(id *)(v2 + 32), "frame");
        v43 = v39;
        v44 = v40;
        v41 = v35;
        v42 = v37;
        LogPrintF();
      }
      result = objc_msgSend(v5, "drain", v41, v42, v43, v44);
      *(_BYTE *)(*(_QWORD *)(v1 + 40) + 256) = 1;
    }
    else
    {
      APSLogErrorAt();
      return objc_msgSend(v5, "drain");
    }
  }
  return result;
}

@end
