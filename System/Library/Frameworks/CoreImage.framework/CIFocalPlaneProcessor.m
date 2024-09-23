@implementation CIFocalPlaneProcessor

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  XFocalPlane *v13;
  XFocalPlane *v14;
  void *v15;
  double v16;
  float v17;
  double v18;
  float v19;
  double v20;
  float v21;
  double v22;
  float v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  id v43;
  double v44;
  double v45;
  unint64_t v46;
  double v47;
  double v48;
  id v49;
  double v50;
  double v51;
  unint64_t v52;
  uint64_t v53;
  double v54;
  unint64_t v55;
  double v56;
  uint64_t v57;
  double v58;
  unint64_t v59;
  double v60;
  int v62;
  _QWORD v63[5];
  _DWORD v64[7];
  uint64_t v65;
  uint64_t v66;
  _QWORD v67[3];
  _QWORD v68[3];
  _QWORD v69[3];
  _DWORD v70[5];
  _QWORD block[7];

  v10 = (void *)objc_msgSend(a5, "metalCommandBuffer");
  v11 = objc_msgSend(v10, "device");
  v12 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__CIFocalPlaneProcessor_processWithInputs_arguments_output_error___block_invoke;
  block[3] = &unk_1E2EC2EE0;
  block[4] = a1;
  block[5] = v11;
  if (+[CIFocalPlaneProcessor processWithInputs:arguments:output:error:]::onceToken != -1)
    dispatch_once(&+[CIFocalPlaneProcessor processWithInputs:arguments:output:error:]::onceToken, block);
  v13 = [XFocalPlane alloc];
  v14 = -[XFocalPlane initWithDevice:library:](v13, "initWithDevice:library:", v11, +[CIFocalPlaneProcessor processWithInputs:arguments:output:error:]::library);
  v15 = (void *)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("inputFocusRect"));
  objc_msgSend(v15, "X");
  v17 = v16;
  objc_msgSend(v15, "Y");
  v19 = v18;
  objc_msgSend(v15, "Z");
  v21 = v20;
  objc_msgSend(v15, "W");
  v23 = v22;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("inputZeroShiftPercentile")), "floatValue");
  v25 = v24;
  *(float *)v70 = v17;
  *(float *)&v70[1] = v19;
  *(float *)&v70[2] = v21;
  *(float *)&v70[3] = v23;
  v70[4] = v24;
  -[XFocalPlane setConfig:](v14, "setConfig:", v70);
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("inputAlphaThreshold")), "floatValue");
  v27 = v26;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("inputAmplitude")), "floatValue");
  v29 = v28;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("inputExponent")), "floatValue");
  v31 = v30;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("inputGamma")), "floatValue");
  v33 = v32;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("inputMinFactor")), "floatValue");
  v35 = v34;
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("inputMaxFactor")), "floatValue");
  v37 = v36;
  v38 = -[XFocalPlane allocateResources](v14, "allocateResources");
  if (!v38)
  {
    v62 = v27;
    v39 = (void *)objc_msgSend((id)objc_msgSend(v10, "commandQueue"), "commandBuffer");
    v40 = (void *)objc_msgSend(v39, "blitCommandEncoder");
    objc_msgSend(a5, "region");
    v42 = v41;
    objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "region");
    v43 = a5;
    if (v42 >= v44)
      v43 = (id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
    objc_msgSend(v43, "region");
    v46 = (unint64_t)v45;
    objc_msgSend(a5, "region");
    v48 = v47;
    objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "region");
    v49 = a5;
    if (v48 >= v50)
      v49 = (id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0);
    objc_msgSend(v49, "region");
    v52 = (unint64_t)v51;
    v53 = objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "metalTexture");
    objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "region");
    v55 = (unint64_t)v54;
    objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 0), "region");
    v69[0] = v55;
    v69[1] = (unint64_t)v56;
    v69[2] = 0;
    v68[0] = v46;
    v68[1] = v52;
    v68[2] = 1;
    v57 = objc_msgSend(a5, "metalTexture");
    objc_msgSend(a5, "region");
    v59 = (unint64_t)v58;
    objc_msgSend(a5, "region");
    v67[0] = v59;
    v67[1] = (unint64_t)v60;
    v67[2] = 0;
    objc_msgSend(v40, "copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:", v53, 0, 0, v69, v68, v57, 0, 0, v67);
    objc_msgSend(v40, "endEncoding");
    objc_msgSend(v39, "commit");
    v64[0] = v25;
    v64[1] = v62;
    v64[2] = v29;
    v64[3] = v31;
    v64[4] = v33;
    v64[5] = v35;
    v64[6] = v37;
    v65 = 0;
    v66 = 0;
    v38 = -[XFocalPlane encodeDisparityRefinementPreprocessingOn:alphaTexture:inputDisparityTexture:outputDisparityTexture:configuration:](v14, "encodeDisparityRefinementPreprocessingOn:alphaTexture:inputDisparityTexture:outputDisparityTexture:configuration:", v10, objc_msgSend((id)objc_msgSend(a3, "objectAtIndexedSubscript:", 1), "metalTexture"), objc_msgSend(a5, "metalTexture"), objc_msgSend(a5, "metalTexture"), v64);
    v12 = MEMORY[0x1E0C809B0];
  }
  v63[0] = v12;
  v63[1] = 3221225472;
  v63[2] = __66__CIFocalPlaneProcessor_processWithInputs_arguments_output_error___block_invoke_2;
  v63[3] = &unk_1E2EC2D30;
  v63[4] = v14;
  objc_msgSend(v10, "addCompletedHandler:", v63);
  return v38 == 0;
}

uint64_t __66__CIFocalPlaneProcessor_processWithInputs_arguments_output_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 40), "newDefaultLibraryWithBundle:error:", objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()), 0);
  +[CIFocalPlaneProcessor processWithInputs:arguments:output:error:]::library = result;
  return result;
}

void __66__CIFocalPlaneProcessor_processWithInputs_arguments_output_error___block_invoke_2(uint64_t a1)
{

}

+ (int)formatForInputAtIndex:(int)a3
{
  int *v3;

  v3 = &kCIFormatRh;
  if (a3)
    v3 = &kCIFormatR8;
  return *v3;
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
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("imageExtents"), a5.origin.x, a5.origin.y, a5.size.width, a5.size.height), "objectAtIndexedSubscript:", a3), "CGRectValue");
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

@end
