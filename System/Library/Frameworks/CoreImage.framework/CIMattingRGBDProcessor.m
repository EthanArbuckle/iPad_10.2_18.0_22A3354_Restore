@implementation CIMattingRGBDProcessor

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  void *v9;
  void *v10;
  XMattingSolver *v11;
  XMattingSolver *v12;
  int v13;
  int v14;
  double v15;
  float v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  char v23;
  int v24;
  double v25;
  unsigned int v26;
  double v27;
  BOOL v28;
  _QWORD v31[5];
  _DWORD v32[6];
  char v33;
  __int16 v34;
  char v35;
  int v36;
  int v37;
  int v38;
  int v39;
  _QWORD block[7];

  v9 = (void *)objc_msgSend(a5, "metalCommandBuffer");
  v10 = (void *)objc_msgSend(v9, "device");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__CIMattingRGBDProcessor_processWithInputs_arguments_output_error___block_invoke;
  block[3] = &unk_1E2EC2EE0;
  block[4] = a1;
  block[5] = v10;
  if (processWithInputs_arguments_output_error__onceToken_0 != -1)
    dispatch_once(&processWithInputs_arguments_output_error__onceToken_0, block);
  if (processWithInputs_arguments_output_error__library
    && (void *)objc_msgSend((id)processWithInputs_arguments_output_error__library, "device") != v10)
  {
    processWithInputs_arguments_output_error__library = objc_msgSend(v10, "newDefaultLibraryWithBundle:error:", objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), 0);
  }
  v11 = [XMattingSolver alloc];
  v12 = -[XMattingSolver initWithDevice:library:](v11, "initWithDevice:library:", v10, processWithInputs_arguments_output_error__library);
  v35 = 0;
  v34 = 0;
  v13 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("inputRadius")), "intValue");
  v14 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("inputSubsampling")), "intValue");
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("inputEPS")), "doubleValue");
  v16 = v15;
  v17 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("inputNumIterations")), "intValue");
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("fgThresholdValue")), "floatValue");
  v19 = v18;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("bgThresholdValue")), "floatValue");
  v21 = v20;
  v22 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("erosionKernelSize")), "intValue");
  v23 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("useDepthFilter")), "BOOLValue");
  v24 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("resolutionMode")), "intValue");
  objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 2), "region");
  v26 = v25;
  objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 2), "region");
  v32[0] = v26;
  v32[1] = v27;
  v32[2] = v13;
  v32[3] = v14;
  *(float *)&v32[4] = v16;
  v32[5] = v17;
  v33 = v23;
  v36 = v19;
  v37 = v21;
  v38 = v22;
  v39 = v24;
  if (-[XMattingSolver allocateResources:](v12, "allocateResources:", v32))
  {
    NSLog(CFSTR("Unable to allocate resources for matting solver."));
    v28 = 0;
  }
  else
  {
    v28 = -[XMattingSolver enqueueSolveOn:constraints:colorGuide:extraGuide:inputTexture:outputTexture:](v12, "enqueueSolveOn:constraints:colorGuide:extraGuide:inputTexture:outputTexture:", objc_msgSend(v9, "commandQueue"), 0, objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 1), "metalTexture"), objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "metalTexture"), objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 2), "metalTexture"), objc_msgSend(a5, "metalTexture")) == 0;
  }
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __67__CIMattingRGBDProcessor_processWithInputs_arguments_output_error___block_invoke_2;
  v31[3] = &unk_1E2EC2D30;
  v31[4] = v12;
  objc_msgSend(v9, "addCompletedHandler:", v31);
  return v28;
}

uint64_t __67__CIMattingRGBDProcessor_processWithInputs_arguments_output_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "newDefaultLibraryWithBundle:error:", objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), 0);
  processWithInputs_arguments_output_error__library = result;
  return result;
}

void __67__CIMattingRGBDProcessor_processWithInputs_arguments_output_error___block_invoke_2(uint64_t a1)
{

}

+ (int)formatForInputAtIndex:(int)a3
{
  if (a3 >= 3)
    +[CIMattingRGBDProcessor formatForInputAtIndex:].cold.1();
  return *off_1E2EC4930[a3];
}

+ (int)outputFormat
{
  return 2053;
}

+ (BOOL)synchronizeInputs
{
  return 1;
}

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect result;

  if (!objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("imageExtents"), a5.origin.x, a5.origin.y, a5.size.width, a5.size.height))+[CIMattingRGBDProcessor roiForInput:arguments:outputRect:].cold.1();
  if (objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("imageExtents")), "count") <= (unint64_t)a3)
    +[CIMattingRGBDProcessor roiForInput:arguments:outputRect:].cold.2();
  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("imageExtents")), "objectAtIndexedSubscript:", a3), "CGRectValue");
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

+ (void)formatForInputAtIndex:.cold.1()
{
  __assert_rtn("+[CIMattingRGBDProcessor formatForInputAtIndex:]", "CIMattingSolver.m", 101, "0");
}

+ (void)roiForInput:arguments:outputRect:.cold.1()
{
  __assert_rtn("+[CIMattingRGBDProcessor roiForInput:arguments:outputRect:]", "CIMattingSolver.m", 127, "arguments[@\"imageExtents\"]");
}

+ (void)roiForInput:arguments:outputRect:.cold.2()
{
  __assert_rtn("+[CIMattingRGBDProcessor roiForInput:arguments:outputRect:]", "CIMattingSolver.m", 128, "[arguments[@\"imageExtents\"] count] > input");
}

@end
